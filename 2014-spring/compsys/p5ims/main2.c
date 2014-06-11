/*
** CS154 Project 5: IM Server
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <pthread.h>
#include <arpa/inet.h> /* inet_ntop */
#include <sys/types.h> /* getaddrinfo */
#include <sys/socket.h>  /* recv, send, getaddrinfo */
#include <netdb.h> /* getaddrinfo */
#include <unistd.h> /* sleep */

#include "imp.h"

#define DB_LINE_LEN 255


/* you can move this global somewhere else */
int verbose;
pthread_mutex_t mut;
pthread_t	saveDbThread;

/*
  The Friend struct
  Represents a single friend. Contains:
  1) friendName - name of User
  2) status - the friend request status
*/
typedef struct  {
    char name[IMP_NAME_MAXLEN+1];
    int  status; // IMP_FRIEND_REQUESTED, IMP_FRIEND_PENDING, or IMP_FRIEND_YES
} Friend;
/*
  The User Struct
  Represents a single user. Contains:
  1) name - Their name
  2) numFriends - The number of their friends, including requested friends
  3) friends - Pointers to their friends
*/
typedef struct  {
    char name [IMP_NAME_MAXLEN+1];
    int  numFriends;
    Friend **friends;	
} User;


/*
  The AllUsers struct.
  Tracks the information of all users. Contains:
  1) numUsers - the total number of users
  2) userInfo - the users
*/
typedef struct {
    int numUsers;
    User **userInfo;
} AllUsers;

AllUsers users;

void usage(const char *me);
void freeAllUsers();
void freeUser(User *pUser);
void freeFriend(Friend *pFriendStatus);
User *newUser();
Friend *newFriend(char *line);
void addOneStatusToUserInfo(User *pUserInfo, Friend *pFriendStatus);
void addOneUserToAllUsers(User *pUserInfo);
int saveDbFile(char *dbFile);
int readDbFile(char *dbFile);
char * strrtrim(char *str);
int saveDbLoop();
void * serveClient(void *arg);
int startServer(int port);

int main(int argc, char *argv[]) {
    char *me, *dbFile = NULL;
    int interval=0, port=-1;
    int opt; /* current option being parsed */

    me = argv[0];
    while ((opt = getopt(argc, argv, "p:d:i:h")) != -1)
	switch (opt) {
	case 'd':
	    dbFile = strdup(optarg);
	    break;
	case 'p':
	    if (1 != sscanf(optarg, "%d", &port)) {
		fprintf(stderr, "%s: couldn't parse \"%s\" as port number\n",
			me, optarg);
		usage(me);
	    }
	    break;
	case 'i':
	    if (1 != sscanf(optarg, "%d", &interval)) {
		fprintf(stderr, "%s: couldn't parse \"%s\" as save interval\n",
			me, optarg);
		usage(me);
	    }
	    break;
	case 'v':
	    verbose = 1;
	    break;
	case 'h':
	default:
	    usage(me);
	}
    if (-1 == port || !dbFile) {
	fprintf(stderr, "%s: need \"-p port#\" and \"-d dbFile\" options\n",
		argv[0]);
	usage(me);
    }
    /* if something was specified for interval, check it,
       and then set the global */
    if (interval) {
	if (interval < 0) {
	    fprintf(stderr, "%s: need a positive save interval (not %d)\n",
		    me, interval);
	    usage(me);
	}
	impSaveInterval = interval;
    }

    /* ... try read in database from file into in-memory representation (which
       you design) in case of error, print to standard error "SERVER_INIT_FAIL"
       and an error message ... */
    if (readDbFile(dbFile) < 0){
	printf("SERVER_INIT_FAIL\n");
    }

    saveDbFile("del.1");
    free(dbFile);


    pthread_mutex_init (&mut, NULL);
    pthread_create(&saveDbThread, NULL, saveDbLoop);
    /* ... start the IM server running, and if there are other problems then
       print to standard error "SERVER_INIT_FAIL" and an error message ... */

    /* ... start a while(1) loop to accept() new connections, and create
       threads to deal with teach newly connected client, or call a function
       (which doesn't return) to do this.  */

    exit(0);
}

void usage(const char *me) {
  fprintf(stderr, "\n");
  fprintf(stderr, "usage: %s [-h] [-v] -p port# -d dbFile [-i saveInterval]\n", me);
  fprintf(stderr, "The server will initialize from user database \"dbFile\", "
          "listen for connections\n");
  fprintf(stderr, "from clients on port \"port#\", and save the user "
          "database every \"saveInterval\"\n");
  fprintf(stderr, "seconds (defaults to %d seconds).  The -v option sets "
          "the value of \"verbose\"; do with\n", impSaveInterval);
  fprintf(stderr, "that what you want.\n");
  exit(1);
}



/*
  freeAllUsers
  Frees users.
*/
void freeAllUsers(){
    int i;
    int numUsers = users.numUsers;
    for (i=0; i < numUsers; i++){
	freeUser(users.userInfo[i]);
    }
    free(users.userInfo);
}

/*
  freeUser
  Frees a user.
*/
void freeUser(User *pUser){
    if (pUser) {
	int i;
	int numFriends = pUser->numFriends;
	for (i=0; i < numFriends; i++){
	    freeFriend(pUser->friends[i]);
	}
	free(pUser);
    }
}

/*
  freeFriend
  Frees a Friend
 */
void freeFriend(Friend *pFriendStatus){ 
    if (pFriendStatus) free(pFriendStatus);
}

/*
  newUser
  Initializes a new user
*/
User *newUser(){
    User *u = malloc(sizeof(User));
    if (!u){
	printf("SERVER_INIT_FAIL\n");
	if (verbose) printf("newUser: failed to malloc one tUserInfo\n");
	exit(0);
    }
    u->numFriends = 0;
    u->friends = NULL;
    return u;
}

/*
 */
Friend *newFriend(char *line){
    char *ptr;
    // first char is -, followed by friendName, and an optional status
    Friend *friendStatus = malloc(sizeof(Friend));
    ptr = strtok(line, "- \t");
    strcpy(friendStatus->name, ptr);
    ptr = strtok(NULL, "- \t");
    if (ptr){
	if (strcmp(ptr, "requested") == 0)
	    friendStatus->status = IMP_FRIEND_REQUESTED;
	else if (strcmp(ptr, "pending") == 0)
	    friendStatus->status = IMP_FRIEND_PENDING;
	else {
	    printf("SERVER_INIT_FAIL: newFriendStatus - unknown status \"%s\"\n", ptr);
	    exit(0);
	}
    } else {
	friendStatus->status = IMP_FRIEND_YES;
    }
    return friendStatus;
}




/*
  addOneStatusToUserInfo
  Add status to the global list of all users, reallocating the memory for pointer.
  exit with error message if memory cannot be allocated
*/
void addOneStatusToUserInfo(User *pUserInfo, Friend *pFriendStatus){
    Friend **newPtr;
    if (pUserInfo->numFriends)
	newPtr = realloc(pUserInfo->friends, (pUserInfo->numFriends+1) * sizeof(Friend *));
    else
	newPtr = malloc(sizeof(Friend *));
    if (!newPtr){
	printf("SERVER_INIT_FAIL\n");
	if (verbose) printf("addOneStatusToUserInfo: failed when reallocating from %d friends", pUserInfo->numFriends);
	exit(0);
    }
    pUserInfo->friends = newPtr;
    pUserInfo->friends[pUserInfo->numFriends] = pFriendStatus;
    pUserInfo->numFriends++;
}

/* 
   addOneUsertoAllUsers
 * Add one user to the global list of all users, reallocating the memory.
 * exit with error message if memory cannot be allocated
 * ****************************************************************************************************
 */
void addOneUserToAllUsers(User *pUserInfo){
    User **newPtr;
    if (users.numUsers)
	newPtr = realloc(users.userInfo, (users.numUsers+1) * sizeof(User *));
    else
	newPtr = malloc(sizeof(User *));

    if (!newPtr){
	printf("SERVER_INIT_FAIL\n");
	if (verbose) printf("addOneUserToAllUsers: failed when reallocating from %d users", users.numUsers);
	exit(0);
    }
    users.userInfo = newPtr;
    users.userInfo[users.numUsers] = pUserInfo;
    users.numUsers++;
}


int saveDbFile(char *dbFile){
    int i,j;
    int status;
    char *friendName;
    FILE *fp = fopen(dbFile, "w");

    if (!fp){
	if (verbose){
	    printf("Cannot open file %s\n", dbFile);
	}
	return -1;
    }
    pthread_mutex_lock (&mut); //before first fprintf in saveDbFile()
    

// write first line with number of users
    fprintf(fp, "%d users:\n",users.numUsers);
    for (i=0 ; i<users.numUsers;i++){
	User *userInfo = users.userInfo[i];
	fprintf(fp, "%s\n", userInfo->name);
	for (j=0;j<userInfo->numFriends;j++){
	    Friend *friendStatus = userInfo->friends[j];
	    status = friendStatus->status;
	    friendName = friendStatus->name;
	    if (status == IMP_FRIEND_PENDING){
		fprintf(fp, "- %s pending\n", friendName);
	    }
	    else
		if (status == IMP_FRIEND_REQUESTED){
		    fprintf(fp, "- %s requested\n", friendName);
		}
		else
		    if (status == IMP_FRIEND_YES){
			fprintf(fp, "- %s\n", friendName);
		    } // no need to save others
	}
	fprintf(fp, ".\n");
    }
    pthread_mutex_unlock(&mut); //at the end of the for loop.

    fclose(fp);
    return 0;
}


/* *********************************************************************************
 Read dbFile into memory structure. The file format looks like the following
 alice
   - david
   - bob requested
   - carol
   .
 bob
   - alice pending
   - carol
   .
 carol
   - bob
   - alice
   .
 david
   - alice
  . 
*/

/* **************************************************************************************************** */
int readDbFile(char *dbFile){
    int i;
    char *ptr;
    char line[DB_LINE_LEN+1];
    int  userCnt = 0;
    FILE *fp = fopen(dbFile, "r");

    if (!fp){
	if (verbose){
	    printf("Cannot open file %s\n", dbFile);
	}
	return -1;
    }
    // read first line with number of users
    ptr = fgets(line,DB_LINE_LEN, fp);
    userCnt = atoi(ptr); // relying on atoi() feature that it quietly ignores non numeric characters and thus the "4 users:" is converted to 4
    if (verbose) printf("userCnt=%d\n", userCnt);

    // Now read for each user
    for (i=0 ; i<userCnt; i++){
	ptr = fgets(line,DB_LINE_LEN, fp);
	strrtrim(ptr);
	User *pUserInfo = newUser();
	addOneUserToAllUsers(pUserInfo);
	bzero(pUserInfo->name,sizeof(pUserInfo->name));
	strncpy(pUserInfo->name, ptr, IMP_NAME_MAXLEN);

	while ((ptr=fgets(line,DB_LINE_LEN, fp)) != NULL){
	    strrtrim(ptr);
	    if (!ptr[0]){
		continue;// ignore blank lines
	    }
	    if (*ptr == '.') break; // done with the user
	    Friend *pFriendStatus = newFriend(line);
	    addOneStatusToUserInfo(pUserInfo, pFriendStatus);
	    if (verbose) printf("User(%d)=%s\n", i, line);
	}
    }

    fclose(fp);
    return 0;
}

char * strrtrim(char *str){
    char *end = str + strlen(str) - 1;
    while(end > str && (*end == '\n' || *end == '\r' || isspace((int)*end))) {
	*end = '\0';
	end--;
    }
    return str;
}

/* **************************************************************************************
 * Function that will be used in a thread to save
 * ************************************************************************************** */

void * saveDbLoop(void *arg){
    char *dbFile = (char *)arg;
    sleep(impSaveInterval);
    saveDbFile(dbFile);
    return NULL;
}

/* **************************************************************************************
 * Function that will be used in a thread serve the client
 *
 * ************************************************************************************** */
void * serveClient(void *arg){
    int clientSock = * (int *)arg;
    int bound	= 0;
    int loggedIn= 0;
    char userName[IMP_NAME_MAXLEN+1];

// serve code goes here.
    bound = 0;
    loggedIn = 0;
    userName[0] = '\0';

    printf("bound=%d, loggedIn=%d, userName=\"%s\"\n", bound, loggedIn, userName);
    close(clientSock);
    return NULL;
}
/* ************************************************************************************** */
int startServer(int port){
    int sockfd, newsockfd, portno, clilen;
//char buffer[256];
    struct sockaddr_in serv_addr, cli_addr;
    pthread_t thread_id;

/* First call to socket() function */
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
	printf("SERVER_INIT_FAIL\n");
	if (verbose) perror("ERROR opening socket");
	exit(1);
    }
/* Initialize socket structure */
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(portno);

/* Now bind the host address using bind() call.*/
    if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
	printf("SERVER_INIT_FAIL\n");
	if (verbose) perror("ERROR on binding");
	exit(1);
    }
/* Now start listening for the clients, here
 * process will go in sleep mode and will wait
 * for the incoming connection
 */
    listen(sockfd, 5);
    clilen = sizeof(cli_addr);
    while (!serverDone) {
	newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
	if (newsockfd < 0) {
	    perror("ERROR on accept");
	    exit(1);
	}
/* Create child process */
	if (pthread_create( &thread_id , NULL ,  serveClient , (void*) &newsockfd) < 0){
            perror("could not create thread");
            close(newsockfd);
            continue;
	}
    }
    close(sockfd);
    return 0;
}

