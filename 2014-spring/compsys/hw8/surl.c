/*
** surl.c: a simple URL grabber for cs154-2014 hw8
** based on http://beej.us/guide/bgnet/examples/client.c
**
** Compile with:

  gcc -Wall -Werror -o surl surl.c

** and run with:

  ./surl

*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define BUFF_SIZE 200
int main() {
  int clientfd;
  struct addrinfo hints, *servinfo, *pp;
  int gairet;
  char *buff=NULL;
  ssize_t red, count;

  memset(&hints, 0, sizeof hints);
  hints.ai_family = AF_INET;
  hints.ai_socktype = SOCK_STREAM;

  buff = malloc(BUFF_SIZE);

  /* vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv */
  /* edit the following two lines */
#define HOST "www.classes.cs.uchicago.edu"
#define PORT "80"
  /* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */

  if ((gairet = getaddrinfo(HOST, PORT, &hints, &servinfo))) {
    fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(gairet));
    return 1;
  }

  /* loop through all the results and connect to the first we can */
  for (pp = servinfo; pp != NULL; pp = pp->ai_next) {
    if (-1 == (clientfd = socket(pp->ai_family, pp->ai_socktype,
                                 pp->ai_protocol))) {
      perror("client: socket");
      continue;
    }
    if (-1 == connect(clientfd, pp->ai_addr, pp->ai_addrlen)) {
      close(clientfd);
      perror("client: connect");
      continue;
    }
    /* connect() worked, so no more looping through ai_next */
    break;
  }
  if (pp == NULL) {
    fprintf(stderr, "client: failed to connect\n");
    return 2;
  }
  freeaddrinfo(servinfo);

  /* vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv */

	sprintf(buff, "%s\r\n%s\r\n%s\r\n%s\r\n\r\n",
		"GET /archive/2014/spring/15400/hw8/vvp.txt HTTP/1.1",
		"Host: www.classes.cs.uchicago.edu",
		"Connection: close",
		"Accept: text/plain");
	write(clientfd, buff, strlen(buff));
	// read response
	count = 0;
	while(1){
		if ((red = recv(clientfd, buff, 199, 0)) == -1) {
	    	perror("recv");
	    	break;
		}
		count += red;
		if (red == 0){
			break;
		}
		buff[red] = '\0';
	
		write(STDOUT_FILENO, buff, red);
	}
	// printf("client: received '%s'\n",buf);

	free(buff);
	close(clientfd);
  /* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */

  exit(0);
}
