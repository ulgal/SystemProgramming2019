/*
 * proxy.c - a simple, iterative HTTP proxy server
 */
#include "csapp.h"
#include "cache.h"

#define PROXY_LOG "proxy.log"
int cache_size, logfd;
cache_block *dummy_head;

void doit(int fd);
void proxy_cache_log(char *, char *, int);
void print_requesthdrs(rio_t *rp);
void parse_uri_proxy(char *, char *, int *);
void clienterror(int fd, char *cause, char *errnum, char *shortmsg, char *longmsg);
//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  /*
 * main: 
 *  listens for connections on the given port number, handles HTTP requests 
 *  with the doit function then closes the connection 
 */
  int listenfd, clientlen, connfd;
  struct sockaddr_in clientaddr;
  if (argc != 2)
  {
    fprintf(stderr, "usage: %s <port>\n", argv[0]);
    exit(1);
  }
  cache_size = 0;
  dummy_head = Malloc(sizeof(cache_block));
  dummy_head->next = NULL;
  logfd = Open(PROXY_LOG, O_WRONLY | O_CREAT, 0);
  listenfd = Open_listenfd(atoi(argv[1]));
  while (1)
  {
    clientlen = sizeof(clientaddr);
    connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
    doit(connfd);
    // Close(connfd);
    // Pthread_create(&tid, NULL, (void *)doit, (void *)connfd);
  }
  Close(logfd);

  /// listen for connections
  /// if a client connects, accept the connection, handle the requests
  /// (call the do it function), then close the connection
}
//-----------------------------------------------------------------------------
void doit(int fd)
{
  /*
 * doit: reads HTTP request from connection socket, forwards the request to the
 *  requested host. Reads the response from the host server, and writes the
 *  response back to the client 
 * params:
 *    - fd (int): file descriptor of the connection socket.
 */

  int port, server_fd, content_length, size, search_cnt;
  char buf_c_read[MAXLINE], buf_c_send[MAXLINE], buf_s_header[MAXLINE], buf_s_content[MAX_OBJECT_SIZE];
  char method[MAXLINE], version[MAXLINE], host[MAXLINE], uri[MAXLINE];
  char tmp_str[MAXLINE];
  char cache_uri[MAXLINE], cache_header[MAXLINE];
  int read_content_size;
  rio_t rio_c, rio_s;
  int i;

  /// initialize cache state
  cache_header[0] = '\0';

  /// read request header
  Rio_readinitb(&rio_c, fd);
  Rio_readlineb(&rio_c, buf_c_read, MAXLINE);
  sscanf(buf_c_read, "%s %s %s", method, uri, version);

  /// Check if the method is GET, if not return a 501 error using clienterror()
  if (strcasecmp(method, "GET"))
  {
    clienterror(fd, method, "501", "Not implemented", "Does not implemented this method");
    return;
  }

  /// Check cache. if exist, return cached response
  if ((search_cnt = search_cache_block(dummy_head, uri)) > 0)
  {
    // printf("cache hit\n");
    cache_block *target = dummy_head;
    while (search_cnt > 0)
    {
      target = target->next;
      search_cnt--;
    }
    proxy_cache_log("[cached]", uri, target->content_length);
    // printf("%s\n%s\n%s\n%d\n", target->request_uri, target->response_header, target->response_content, target->content_length);
    Rio_writen(fd, target->response_header, strlen(target->response_header));
    Rio_writen(fd, target->response_content, target->content_length);
    Close(fd);
    return;
  }

  // printf("no cache\n");
  strcpy(cache_uri, uri);
  /// get hostname, port, filename by parse_uri()
  parse_uri_proxy(uri, host, &port);
  sprintf(buf_c_send, "%s %s %s\r\n", method, uri, version);
  Rio_readlineb(&rio_c, buf_c_read, MAXLINE);
  sprintf(buf_c_send, "%s%s", buf_c_send, buf_c_read);
  while (1)
  {
    size = (Rio_readlineb(&rio_c, buf_c_read, MAXLINE));

    sprintf(buf_c_send, "%s%s", buf_c_send, buf_c_read);
    if (size <= 2)
    {
      break;
    }
  }

  // printf("Request headers:\n");
  // printf("%s", buf_c_send);

  /// open server
  server_fd = Open_clientfd(host, port);
  Rio_writen(server_fd, buf_c_send, strlen(buf_c_send));

  /// read response header
  Rio_readinitb(&rio_s, server_fd);
  while (1)
  {
    size = Rio_readlineb(&rio_s, buf_s_header, MAXLINE);
    sprintf(cache_header, "%s%s", cache_header, buf_s_header);
    Rio_writen(fd, buf_s_header, size);
    if (strstr(buf_s_header, "Content-Length"))
    {
      sscanf(buf_s_header, "Content-Length: %s", tmp_str);
      content_length = atoi(tmp_str);
      read_content_size = content_length;
    }
    if (strstr(buf_s_header, "Content-length"))
    {
      sscanf(buf_s_header, "Content-length: %s", tmp_str);
      content_length = atoi(tmp_str);
      read_content_size = content_length;
    }
    if (!strcmp(buf_s_header, "\r\n"))
    {
      break;
    }
    if (size <= 2)
    {
      break;
    }
  }

  /// check whether it can stored or not
  size = sizeof(char) * content_length + sizeof(char) * strlen(cache_header) + sizeof(char) * strlen(cache_uri) + sizeof(int) + 3;
  if (size <= MAX_OBJECT_SIZE)
  {
    // printf("can cache\n");
    cache_block *target;
    if (size + cache_size < MAX_CACHE_SIZE)
    {
      target = add_cache_block(dummy_head, cache_uri, cache_header, content_length);
      cache_size += size;
    }
    else
    {
      // printf("remove, FIFO\n");
      while (size + cache_size >= MAX_CACHE_SIZE)
      {
        cache_size -= cache_replacement_policy(dummy_head);
      }
      target = add_cache_block(dummy_head, cache_uri, cache_header, content_length);
      cache_size += size;
    }
    i = 0;
    while (read_content_size > 0)
    {
      size = Rio_readlineb(&rio_s, buf_s_content, MAX_OBJECT_SIZE);
      Rio_writen(fd, buf_s_content, size);
      memcpy(target->response_content + i, buf_s_content, size);
      i += size;
      if (!strcmp(buf_s_content, "\r\n"))
      {
        break;
      }
      read_content_size -= size;
      if (read_content_size - size < 0)
      {
        break;
      }
    }
    proxy_cache_log("[uncached]", target->request_uri, target->content_length);
  }
  else
  {
    // printf("can't cache\n");
    while (read_content_size > 0)
    {
      size = Rio_readlineb(&rio_s, buf_s_content, MAX_OBJECT_SIZE);
      Rio_writen(fd, buf_s_content, size);
      if (!strcmp(buf_s_content, "\r\n"))
      {
        break;
      }
      read_content_size -= size;
      if (read_content_size - size < 0)
      {
        break;
      }
    }
    proxy_cache_log("[uncached]", cache_uri, content_length);
  }

  // printf("end\n");

  Close(server_fd);
  Close(fd);
}

void proxy_cache_log(char *cached, char *uri, int contentLength)
{
  /*
 * proxy_cache_log:
 * 		keep the track of all the cache-log when add or find the contents
 *params:
 	-cached: status of the cache corresponding uri
	-uri: uri string
	-contentLength: size of the content length (bytes)
 * 		
 */
  char timebuf[MAXLINE], log[MAXLINE];
  char wday[MAXLINE], month[MAXLINE];
  time_t timet;
  struct tm *timeinfo;
  timet = time(NULL);
  timeinfo = localtime(&timet);
  /// convert wday(int) to wday(string)
  switch (timeinfo->tm_wday)
  {
  case 0:
    strcpy(wday, "Sun");
    break;
  case 1:
    strcpy(wday, "Mon");
    break;
  case 2:
    strcpy(wday, "Tue");
    break;
  case 3:
    strcpy(wday, "Wed");
    break;
  case 4:
    strcpy(wday, "Thu");
    break;
  case 5:
    strcpy(wday, "Fri");
    break;
  case 6:
    strcpy(wday, "Sat");
    break;
  }
  /// convert mon(int) to month(string)
  switch (timeinfo->tm_mon)
  {
  case 0:
    strcpy(month, "Jan");
    break;
  case 1:
    strcpy(month, "Feb");
    break;
  case 2:
    strcpy(month, "Mar");
    break;
  case 3:
    strcpy(month, "Apr");
    break;
  case 4:
    strcpy(month, "May");
    break;
  case 5:
    strcpy(month, "June");
    break;
  case 6:
    strcpy(month, "July");
    break;
  case 7:
    strcpy(month, "Aug");
    break;
  case 8:
    strcpy(month, "Sept");
    break;
  case 9:
    strcpy(month, "Oct");
    break;
  case 10:
    strcpy(month, "Nov");
    break;
  case 11:
    strcpy(month, "Dec");
    break;
  }
  sprintf(timebuf, "%s %d %s %d %d:%d:%d KST:", wday, timeinfo->tm_mday, month, timeinfo->tm_year + 1900, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
  sprintf(log, "%s %s %s %d\n", cached, timebuf, uri, contentLength);
  Write(logfd, log, strlen(log));
}

void print_requesthdrs(rio_t *rp)
{
  /**** DO NOT MODIFY ****/
  /**** WARNING: This will read out everything remaining until a line break ****/
  /*
 * print_requesthdrs: 
 *        reads out and prints all request lines sent to the server
 * params:
 *    - rp: Rio pointer for reading from file
 *
 */
  char buf[MAXLINE];
  Rio_readlineb(rp, buf, MAXLINE);
  while (strcmp(buf, "\r\n"))
  {
    printf("%s", buf);
    Rio_readlineb(rp, buf, MAXLINE);
  }
  printf("\n");
  return;
}

void parse_uri_proxy(char *uri, char *host, int *port)
{
  /*
 * parse_uri_proxy:
 * 		 Get the hostname, port, and parse the uri.
 * params:
 * 		- uri:  uri string
 * 		- host: host string extracted from the uri.
 * 		- port: port number
 *
 * you have to add further parsing steps in http.c 
 * 
 * example1: http://www.snu.ac.kr/index.html
 *			 host: www.snu.ac.kr 
 *			 filename: should be /index.html 
 *			 port: 80 (default)
 *
 * example2: http://www.snu.ac.kr:1234/index.html
 * 			 host: www.snu.ac.kr
 * 			 filename: /index.html 
 * 			 port: 1234
 *
 * example3: http://127.0.0.1:1234/index.html
 * 			 host: 127.0.0.1
 * 			 filename: /index.html
 * 			 port: 1234
 * 			 
 *	
*/
  char *convert_port[MAXLINE];

  if (strstr(strstr(uri, ":") + 1, ":"))
  {
    sscanf(uri, "http://%[^:]:%[^/]%s", host, convert_port, uri);
    *port = atoi(convert_port);
  }
  else
  {
    sscanf(uri, "http://%[^/]/", host);
    *port = 80;
  }
}

void clienterror(int fd, char *cause, char *errnum,
                 char *shortmsg, char *longmsg)
{
  /**** DO NOT MODIFY ****/
  /*
 * clienterror: 
 *        Creates appropriate HTML error page and sends to the client 
 * params:
 *    - fd: file descriptor of connection socket.
 *    - cause: what has caused the error: the filename or the method
 *    - errnum: The HTTP status (error) code
 *    - shortmsg: The HTTP status (error) message
 *    - longmsg: A longer description of the error that will be printed 
 *           on the error page
 *
 */
  char buf[MAXLINE], body[MAXBUF];
  ///build the HTTP response body
  sprintf(body, "<html><title>Mini Error</title>");
  sprintf(body, "%s<body bgcolor="
                "ffffff"
                ">\r\n",
          body);
  sprintf(body, "%s<b>%s: %s</b>\r\n", body, errnum, shortmsg);
  sprintf(body, "%s<p>%s: %s\r\n", body, longmsg, cause);
  sprintf(body, "%s<hr><em>Mini Web server</em>\r\n", body);

  /// print the HTTP response
  sprintf(buf, "HTTP/1.0 %s %s\r\n", errnum, shortmsg);
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "Content-type: text/html\r\n");
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "Content-Length: %d\r\n\r\n", (int)strlen(body));
  Rio_writen(fd, buf, strlen(buf));
  Rio_writen(fd, body, strlen(body));
}
