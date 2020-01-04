/*
 * proxy.c - a simple, iterative HTTP proxy server
 */
#include "csapp.h"
#include "cache.h"

#define PROXY_LOG "proxy.log"

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

  int listenfd, port, clientlen, connfd;
  struct sockaddr_in clientaddr;
  pthread_t tid;
  if (argc != 2)
  {
    fprintf(stderr, "usage: %s <port>\n", argv[0]);
    exit(1);
  }

  listenfd = Open_listenfd(atoi(argv[1]));
  while (1)
  {
    clientlen = sizeof(clientaddr);
    connfd = Accept(listenfd, (SA *)&clientaddr, &clientlen);
    Pthread_create(&tid, NULL, (void *)doit, (void *)connfd);
  }

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
  /*	
  char line[MAXLINE], host[MAXLINE];
  char method[MAXLINE], uri[MAXLINE], version[MAXLINE];
  int serverfd, port=80;
*/
  struct stat sbuf;
  int port, client_fd, content_length, size;
  char buf_c_read[MAXLINE], buf_c_send[MAXLINE], buf_s_header[MAXLINE], buf_s_content[MAX_OBJECT_SIZE];
  char method[MAXLINE], version[MAXLINE], host[MAXLINE], uri[MAXLINE];
  char tmp_str[MAXLINE];
  rio_t rio_c, rio_s;
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
  parse_uri_proxy(uri, host, &port);
  // printf("here%s \n%s \n%s \n%s\n", method, uri, version, host);
  sprintf(buf_c_send, "%s %s %s\r\n", method, uri, version);
  Rio_readlineb(&rio_c, buf_c_read, MAXLINE);
  // printf("\n\n%s\n\n", buf_c_read);
  // sscanf(buf_c_read, "Host: %s", host);
  /// get hostname, port, filename by parse_uri()
  sprintf(buf_c_send, "%s%s", buf_c_send, buf_c_read);
  while (1)
  {
    size = (Rio_readlineb(&rio_c, buf_c_read, MAXLINE));
    // printf("%d\n", size);
    // printf("%s\n", buf_c_read);
    sprintf(buf_c_send, "%s%s", buf_c_send, buf_c_read);
    if (size <= 2)
    {
      break;
    }
  }
  //Rio_readnb(&rio_c, buf_c, MAXLINE);

  printf("Request headers:\n");
  printf("%s", buf_c_send);
  // sscanf(buf_c, "%s %s %s\r\nHost: %s", method, uri, version, host);
  // sscanf(buf_c, "Host: %s", host);

  /// be sure to call this only after you have read out all the information
  /// you need from the request
  // printf("%d\n\n", client_fd);

  client_fd = Open_clientfd(host, port);
  // printf("%d\n\n", client_fd);
  Rio_writen(client_fd, buf_c_send, strlen(buf_c_send));

  Rio_readinitb(&rio_s, client_fd);
  while (1)
  {
    size = Rio_readlineb(&rio_s, buf_s_header, MAXLINE);
    // printf("\n%d\n%s\n", size, buf_s_header);
    Rio_writen(fd, buf_s_header, size);
    if (strstr(buf_s_header, "Content-Length") || strstr(buf_s_header, "Content-length"))
    {
      sscanf(buf_s_header, "Content-Length: %d", tmp_str);
      content_length = atoi(tmp_str);
      // printf("ctl: %d\n", content_length);
    }
    if (!strcmp(buf_s_header, "\r\n"))
    {
      break;
    }
    if (size <= 2)
    {
      break;
    }
    // printf("oneloopend\n");
  }

  // printf("\n\n%s\n\n", buf_s_header);
  while (1)
  {
    // printf("hil\n");
    size = Rio_readlineb(&rio_s, buf_s_content, MAXLINE);
    // printf("hi2\n");
    // printf("\n%d\n\n%s\n\n", size, buf_s_content);
    Rio_writen(fd, buf_s_content, size);
    if (!strcmp(buf_s_content, "\r\n"))
    {
      break;
    }
    if (size <= 2)
    {
      break;
    }
  }
  // size = Rio_readnb(&rio_s, buf_s_content, content_length);
  // Rio_writen(fd, buf_s_content, size);

  Close(client_fd);
  //Close(fd);

  /// find the URI in the proxy cache.
  /// if the URI is in the cache, send directly to the client
  /// be sure to write the log when the proxy server send to the client
  /*cache_block* cache_content = NULL;*/

  /// read response header
  /// read the response header from the server and build the proxy's responseBuffer
  /// header by repeatedly adding the responseBuffer (server response)
  /// this proxy server only supports 'Content-Length' format.

  /// Content-Lengh
  /// using the 'Content-Length' read from the http server response header,
  /// you must allocate and read that many bytes to our buffer
  /// you now write the response heading and the content back to the client

  /// add the proxy cache
  /// logging the cache status and other information
  /// check the free or close
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
  /*	
  char timebuf[MAXLINE];
  time_t timet;
  struct tm *timeinfo;
  */
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
