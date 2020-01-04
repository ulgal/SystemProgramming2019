#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <setjmp.h>
#include <signal.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <errno.h>
#include <math.h>
#include <pthread.h>
#include <semaphore.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#define MAXLINE 8192
#define IO_BUFSIZE 8192

typedef struct sockaddr SA;

int main(int argc, char **argv)
{
  int clientfd;
  char *host, *port, buf[MAXLINE];
  int io_fd, io_cnt;
  char *io_bufptr, io_buf[IO_BUFSIZE];
  struct hostent *hp;
  struct sockaddr_in serveraddr;
  if (argc != 3)
  {
    fprintf(stderr, "usage: %s <host> <port>\n", argv[0]);
  }
  host = argv[1];
  port = argv[2];
  //clientfd = open_clientfd(host, atoi(port));
  if ((clientfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
  {
    return -1;
  }
  if ((hp = gethostbyname(host)) == NULL)
  {
    return -2;
  }
  bzero((char *)&serveraddr, sizeof(serveraddr));
  serveraddr.sin_family = AF_INET;
  bcopy((char *)hp->h_addr_list[0], (char *)&serveraddr.sin_addr.s_addr, hp->h_length);
  serveraddr.sin_port = htons(atoi(port));
  if (connect(clientfd, (SA *)&serveraddr, sizeof(serveraddr)) < 0)
  {
    return -1;
  }
  io_fd = clientfd;
  io_cnt = 0;
  io_bufptr = io_buf;
  while (1)
  {
    printf("Enter string or hit Enter to quit: ");
    if (fgets(buf, MAXLINE, stdin) == NULL)
    {
      break;
    }

    size_t nleft = strlen(buf);
    ssize_t nwritten;
    char *bufp_s = buf, *bufp_c = buf, c;
    int n, rc, rc_flag;
    while (nleft > 0)
    {
      if ((nwritten = write(io_fd, bufp_s, nleft)) <= 0)
      {
        if (errno == EINTR)
        {
          nwritten = 0;
        }
        else
        {
          return -1;
        }
      }
      nleft -= nwritten;
      bufp_s += nwritten;
    }
    for (n = 1; n < MAXLINE; n++)
    {
      char *tmp_c = &c;
      rc_flag = 1;
      rc = 0;
      while (io_cnt <= 0)
      {
        io_cnt = read(io_fd, io_buf, sizeof(io_buf));

        if (io_cnt < 0)
        {

          if (errno != EINTR)
          {
            rc = -1;
            rc_flag = 0;
            break;
          }
        }
        else if (io_cnt == 0)
        {

          rc = 0;
          rc_flag = 0;
          break;
        }
        else
        {
          io_bufptr = io_buf;
        }
      }
      if (rc_flag == 1)
      {
        rc = 1;
        if (io_cnt < 1)
        {
          rc = io_cnt;
        }
        memcpy(tmp_c, io_bufptr, rc);
        io_bufptr += rc;
        io_cnt -= rc;
      }
      //*/

      if (rc == 1)
      {
        *bufp_c++ = c;
        if (c == '\n')
        {
          break;
        }
      }
      else if (rc == 0)
      {
        if (n == 1)
        {
          return 0;
        }
        else
        {
          break;
        }
      }
      else
      {
        return -1;
      }
    }
    *bufp_c = 0;
    //*/
    printf("Reply from server: ");
    fputs(buf, stdout);
  }
  close(clientfd);
  exit(0);
}