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

/* structure to keep track of client connections - used for sending messages */
typedef struct {
	int clientSock; // -1 means not connected
	char userName[IMP_NAME_MAXLEN+1]; // logged in userName - if logged in
} Client;

typedef struct {
	int numClients;
	Client **clients;
} Clients;

/* *****************************************************************************************
 *                               Global Variables
 * *****************************************************************************************
 */
int verbose;
pthread_mutex_t mut;
pthread_mutex_t clientsMut; // for locking global clients
pthread_t	saveDbThread;
int serverDone = 0;
AllUsers users;
Clients clients;


/* *****************************************************************************************
 *                               Function prototypes
 * *****************************************************************************************
 */

void usage(const char *me);
void freeAllUsers();
void freeUser(User *pUser);
void freeFriend(Friend *pFriendStatus);
User *newUser();
Friend *newFriend(char *line);
Friend *newFriendFromRequest(char *friendName, int status);
void addOneFriendToUser(User *pUserInfo, Friend *pFriendStatus);
void addOneUserToAllUsers(User *pUserInfo);
int saveDbFile(char *dbFile);
int readDbFile(char *dbFile);
char * strrtrim(char *str);
void * saveDbLoop(void *arg);
void * serveClient(void *arg);
int startServer(int port);
int isValidUserName(char *userName);
User *getUserByName(char *userName);
Friend *getUsersFriend(User *pUserThis, char *friendName);
void sendStatusUpdateMessages(int sock, char *userName, int friendsSock, char *friendName, impEm *iem);

int removeClient(int clientSock);
int addClient(int clientSock);
int setClientUserName(int clientSock, char *clientUserName);
char *getClientUserName(int clientSock);
int removeClientWithLock(int clientSock);
int addClientWithLock(int clientSock);
char *getClientUserNameWithLock(int clientSock);
int getClientSockForUserName(char *userName);

void processOpRegister(int clientIsBound, char *currentUserName, impMsgOp *cliMsgOp, int clientSock);
void processOpLogin(impMsgOp *cliMsgOp, int clientSock);
void processOpLogout(impMsgOp *cliMsgOp, int clientSock);
void processOpFriendRequest(impMsgOp *cliMsgOp, int clientSock);



int main(int argc, char *argv[]) {
    char *me, *dbFile = NULL;
    int interval=0, port=-1;
    int opt; /* current option being parsed */

    me = argv[0];
    while ((opt = getopt(argc, argv, "vp:d:i:h")) != -1)
	switch (opt) {
	case 'd':
	    dbFile = strdup(optarg);
	    break;
	case 'p':
	    if (1 != sscanf(optarg, "%d", &port)) {
			fprintf(stderr, "%s: couldn't parse \"%s\" as port number\n", me, optarg);
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
		fprintf(stderr, "%s: need \"-p port#\" and \"-d dbFile\" options\n", argv[0]);
		usage(me);
    }
    /* if something was specified for interval, check it,
       and then set the global */
    if (interval) {
		if (interval < 0) {
	    	fprintf(stderr, "%s: need a positive save interval (not %d)\n", me, interval);
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


    pthread_mutex_init (&mut, NULL);
    pthread_mutex_init (&clientsMut, NULL);
    pthread_create(&saveDbThread, NULL, saveDbLoop, dbFile);
    /* ... start the IM server running, and if there are other problems then
       print to standard error "SERVER_INIT_FAIL" and an error message ... */

	startServer(port);
    /* ... start a while(1) loop to accept() new connections, and create
       threads to deal with teach newly connected client, or call a function
       (which doesn't return) to do this.  */

    // saveDbFile("del.1");
    free(dbFile);
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
		if (verbose)
			printf("newUser: failed to malloc one tUserInfo\n");
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
    Friend *pFriend = malloc(sizeof(Friend));
    ptr = strtok(line, "- \t");
    strcpy(pFriend->name, ptr);
    ptr = strtok(NULL, "- \t");
    if (ptr){
		if (strcmp(ptr, "requested") == 0)
			pFriend->status = IMP_FRIEND_REQUESTED;
		else if (strcmp(ptr, "pending") == 0)
			pFriend->status = IMP_FRIEND_PENDING;
		else {
			printf("SERVER_INIT_FAIL: newFriendStatus - unknown status \"%s\"\n", ptr);
			exit(0);
		}
    } else {
    	pFriend->status = IMP_FRIEND_YES;
    }
    return pFriend;
}
Friend *newFriendFromRequest(char *friendName, int status){
    Friend *pFriend = malloc(sizeof(Friend));
    strncpy(pFriend->name, friendName, IMP_NAME_MAXLEN);
    pFriend->name[IMP_NAME_MAXLEN] = '\0';
    if (status == IMP_FRIEND_PENDING || status == IMP_FRIEND_REQUESTED || status == IMP_FRIEND_YES){
    	pFriend->status = status;
    } else {
    	pFriend->status = IMP_FRIEND_YES;
    }
    return pFriend;
}




/*
  addOneFriendToUser
  Add Friend to the supplied user, reallocating the memory for friends pointer.
  exit with error message if memory cannot be allocated
*/
void addOneFriendToUser(User *pUserInfo, Friend *pFriendStatus) {
	Friend **newPtr;
	if (pUserInfo->numFriends)
		newPtr = realloc(pUserInfo->friends,
				(pUserInfo->numFriends + 1) * sizeof(Friend *));
	else
		newPtr = malloc(sizeof(Friend *));
	if (!newPtr) {
		printf("SERVER_INIT_FAIL\n");
		if (verbose)
			printf("addOneFriendToUser: failed when reallocating from %d friends", pUserInfo->numFriends);
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

/* *************************************************************************************** */
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
			Friend *pFriend = newFriend(line);
			addOneFriendToUser(pUserInfo, pFriend);
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
	while (!serverDone){
    	sleep(impSaveInterval);
    	saveDbFile(dbFile);
	}
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
	int n;
	char line[IMP_PROTSTRING_MAXLEN+1];
    char userName[IMP_NAME_MAXLEN+1];
	impEm iem;
	impMsg *cliMsg = NULL;
	impMsgOp * cliMsgOp = NULL;

// serve code goes here.
    bound = 0;
    loggedIn = 0;
    userName[0] = '\0';

    addClientWithLock(clientSock); // update global structure - later userName will be added to it
    printf("bound=%d, loggedIn=%d, userName=\"%s\"\n", bound, loggedIn, userName);
	while ((n=recv(clientSock,line,IMP_PROTSTRING_MAXLEN,0))>0){
		line[n] = '\0';
		cliMsg = impStrToMsg(&iem, line);
		switch (cliMsg->mt){
		case IMP_MSG_TYPE_UNKNOWN: /* 0 (not a valid value) */
			break;
		case IMP_MSG_TYPE_OP:      /* 1: "OP" */
			cliMsgOp = (impMsgOp *)cliMsg;
			if (cliMsgOp->op == IMP_OP_REGISTER){
				pthread_mutex_lock (&mut);
				processOpRegister(bound,userName,cliMsgOp,clientSock);
				pthread_mutex_unlock (&mut);
			}
			else
			if (cliMsgOp->op == IMP_OP_LOGIN){
				processOpLogin(cliMsgOp,clientSock);
			}
			else
			if (cliMsgOp->op == IMP_OP_LOGOUT){
				processOpLogout(cliMsgOp,clientSock);
			}
			else
			if (cliMsgOp->op == IMP_OP_FRIEND_REQUEST){
				processOpFriendRequest(cliMsgOp, clientSock);
			}
			break;
		case IMP_MSG_TYPE_ACK:    /* 2: "ACK" */
			break;
		case IMP_MSG_TYPE_ERROR:   /* 3: "ERROR" */
			break;
		case IMP_MSG_TYPE_STATUS:  /* 4: "STATUS" */
			break;
		case IMP_MSG_TYPE_INVALID:  /* 5: (only for range checking) */
			break;

		}
		impMsgFree(cliMsg);
	}  

    close(clientSock);
    return NULL;
}
/* ************************************************************************************** */
int startServer(int port){
    int sockfd, newsockfd;
	socklen_t clilen;
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
    serv_addr.sin_port = htons(port);

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
/* ******************************************************************************** */
int isValidUserName(char *userName){
	char *p = userName;
	int c;
	if (!p) return 0;
	for (c=*p;c;p++){
		if (isspace(c) || !isprint(c)) return 0;
	}
	return 1;
}

/* ******************************************************************************** */
void processOpRegister(int clientIsBound, char *currentUserName, impMsgOp *cliMsgOp, int clientSock){
	int i;
	char *str;
	char *cliMsgUserName = cliMsgOp->userName; // username in the received client msg
	impEm iem;

	if (clientIsBound){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_CLIENT_BOUND, currentUserName, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}
	// does user exist ?
	for (i=0; i<users.numUsers;i++){
		if (strcmp(cliMsgUserName,users.userInfo[i]->name) == 0){
			str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_USER_EXISTS, cliMsgUserName, IMP_END);
			send(clientSock,str,strlen(str),0);
			free(str);
			return;
		}
	}
	if (!isValidUserName(cliMsgUserName)){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_BAD_COMMAND, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}
	// register the new user
	User *pUserInfo = newUser();
	addOneUserToAllUsers(pUserInfo);
	bzero(pUserInfo->name,sizeof(pUserInfo->name));
	strncpy(pUserInfo->name, cliMsgUserName, IMP_NAME_MAXLEN);

	str = impStrNew(&iem, IMP_MSG_TYPE_ACK, IMP_OP_REGISTER, cliMsgUserName, IMP_END);
	send(clientSock,str,strlen(str),0);
	free(str);
}

/* ******************************************************************************** */
void processOpLogin(impMsgOp *cliMsgOp, int clientSock){
	//int i;
	char *str;
	char *currentUserName;
	char *cliMsgUserName = cliMsgOp->userName; // username in the received client msg
	impEm iem;

	// already logged in?
	currentUserName = getClientUserNameWithLock(clientSock);
	if (currentUserName && currentUserName[0]){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_CLIENT_BOUND, currentUserName, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

	// does this user exist at all
	User *pUserThis = getUserByName(cliMsgUserName);
	if (!pUserThis){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_USER_DOES_NOT_EXIST, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

	// does user exist on another connection ?
	int otherSock = getClientSockForUserName(cliMsgUserName);
	if (otherSock > 0){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_USER_ALREADY_ACTIVE, cliMsgUserName, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

    // save the new userName in global structure and send ack to client
	strncpy(currentUserName, cliMsgUserName, IMP_NAME_MAXLEN);
	currentUserName[IMP_NAME_MAXLEN] = '\0';

	str = impStrNew(&iem, IMP_MSG_TYPE_ACK, IMP_OP_LOGIN, cliMsgUserName, IMP_END);
	send(clientSock,str,strlen(str),0);
	free(str);

	// send all the status messages
	int numFriends = pUserThis->numFriends;
	int i;
	for (i=0; i < numFriends; i++){
		Friend *pFriend = pUserThis->friends[i];
		char *friendName = pFriend->name;
		int  friendStatus= pFriend->status; // IMP_FRIEND_REQUESTED, IMP_FRIEND_PENDING, or IMP_FRIEND_YES

		int friendClientSock = getClientSockForUserName(friendName);
		int	active = (friendClientSock>=0) ? IMP_ACTIVE_YES : IMP_ACTIVE_NOT;

		// impMsgNew(iem, IMP_MSG_TYPE_STATUS, "TheUserName", IMP_FRIEND_NOT, IMP_ACTIVE_YES, IMP_END);
		// impMsgNew(iem, IMP_MSG_TYPE_STATUS, "TheUserName", IMP_FRIEND_NOT, IMP_ACTIVE_NOT, IMP_END);
		// ( ... plus 2x3 other examples w/ different IMP_FRIEND_* values)
		str = impStrNew(&iem, IMP_MSG_TYPE_STATUS, friendName, friendStatus, active, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);

		// also send status messages to the confirmed friends that are logged in

		if (friendStatus == IMP_FRIEND_YES
		&&  friendClientSock >= 0){
			str = impStrNew(&iem, IMP_MSG_TYPE_STATUS, cliMsgUserName, friendStatus, IMP_ACTIVE_YES, IMP_END);
			send(clientSock,str,strlen(str),0);
			free(str);

		}
	}

}

/* ******************************************************************************** */
void processOpLogout(impMsgOp *cliMsgOp, int clientSock){
	int i;
	char *str;
	char *currentUserName;
	impEm iem;

	// already logged in?
	currentUserName = getClientUserNameWithLock(clientSock);
	if (!currentUserName[0]){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_CLIENT_NOT_BOUND, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

	// send all status messages to confirmed friends that are logged in

	int numUsers = users.numUsers;
	for (i=0; i < numUsers; i++){
		User *pUser = users.userInfo[i];
		if (strcmp(pUser->name,currentUserName) != 0){
			continue;
		}
		int j;
		int numFriends = pUser->numFriends;
		for (j=0; j < numFriends; j++){
			Friend *pFriend = pUser->friends[i];
		    char *friendName = pFriend->name;
		    int  friendStatus= pFriend->status; // IMP_FRIEND_REQUESTED, IMP_FRIEND_PENDING, or IMP_FRIEND_YES

			// send status messages to the confirmed friends that are logged in

		    if (friendStatus == IMP_FRIEND_YES) {
				int friendClientSock = getClientSockForUserName(friendName);
				sendStatusUpdateMessages(-1,currentUserName,friendClientSock,friendName,&iem);
		    }
		}
		break;
	}

    // remove user from socket table and send ack to client
	currentUserName[0] = '\0';

	str = impStrNew(&iem, IMP_MSG_TYPE_ACK, IMP_OP_LOGOUT, IMP_END);
	send(clientSock,str,strlen(str),0);
	free(str);


}

/* ******************************************************************************** */
void processOpFriendRequest(impMsgOp *cliMsgOp, int clientSock){
	//int i;
	char *str;
	char *currentUserName;
	char *cliMsgUserName = cliMsgOp->userName; // username in the received client msg
	impEm iem;

	// already logged in?
	currentUserName = getClientUserNameWithLock(clientSock);
	if (!currentUserName || !currentUserName[0]){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_CLIENT_NOT_BOUND, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

	// cannot be friends with oneself
	if (strcmp(currentUserName,cliMsgUserName) == 0){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_BAD_COMMAND, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

	User *pUserThis   = getUserByName(currentUserName);
	User *pUserFriend = getUserByName(cliMsgUserName);

	// does the user exist at all ?
	if (!pUserFriend){
		str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_USER_DOES_NOT_EXIST, IMP_END);
		send(clientSock,str,strlen(str),0);
		free(str);
		return;
	}

	// friends with this user already ?
	Friend *pFriend			= getUsersFriend(pUserThis, cliMsgUserName);
	Friend *pFriendsFriend  = getUsersFriend(pUserFriend, currentUserName);

	if (pFriend && pFriendsFriend){
		int st = pFriend->status;
		if (st == IMP_FRIEND_YES){
			str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_FRIEND_ALREADY, cliMsgUserName, IMP_END);
			send(clientSock,str,strlen(str),0);
			free(str);
			return;
		}
		else
		if (st == IMP_FRIEND_REQUESTED){
			str = impStrNew(&iem, IMP_MSG_TYPE_ERROR, IMP_ERROR_REQUESTED_ALREADY, cliMsgUserName, IMP_END);
			send(clientSock,str,strlen(str),0);
			free(str);
			return;
		}
		else
		if (st == IMP_FRIEND_PENDING){
			// set global structure indicating friendship
			pFriend->status = IMP_FRIEND_YES;
			pFriendsFriend->status = IMP_FRIEND_YES;

			// Status update to the connected parties
			str = impStrNew(&iem, IMP_MSG_TYPE_STATUS, currentUserName, IMP_FRIEND_YES, IMP_ACTIVE_YES, IMP_END);
			send(clientSock,str,strlen(str),0);
			free(str);

			int friendClientSock = getClientSockForUserName(cliMsgUserName);
			sendStatusUpdateMessages(clientSock,currentUserName,friendClientSock,cliMsgUserName,&iem);
		}
	} else {
		// allocate new friends for both sides and add to global structures
		pFriend = newFriendFromRequest(cliMsgUserName, IMP_FRIEND_REQUESTED);
		pFriendsFriend = newFriendFromRequest(currentUserName, IMP_FRIEND_PENDING);
		addOneFriendToUser(pUserThis, pFriend);
		addOneFriendToUser(pUserFriend, pFriendsFriend);
	}

	// send ack
	str = impStrNew(&iem, IMP_MSG_TYPE_ACK, IMP_OP_FRIEND_REQUEST, cliMsgUserName, IMP_END);
	send(clientSock,str,strlen(str),0);
	free(str);
}


/* ***************************************************************************************************
 *                                Clients methods
 *
 * Do we need a generic list add, remove function looks like repetition
 * ***************************************************************************************************
 */
int addClient(int clientSock){
	Client **newPtr;
	Client *oneClient;

	oneClient = (Client *)malloc(sizeof(Client));
	if (!oneClient) {
		printf("SERVER_INIT_FAIL\n");
		if (verbose)
			printf("addClient: failed when allocating one client struct\n");
		exit(0);
	}
	oneClient->clientSock = clientSock;
	oneClient->userName[0]= '\0';

	if (clients.numClients)
		newPtr = realloc(clients.clients, (clients.numClients + 1) * sizeof(Client *));
	else
		newPtr = malloc(sizeof(Client *));
	if (!newPtr) {
		printf("SERVER_INIT_FAIL\n");
		if (verbose)
			printf("addClient: failed when reallocating from %d clients\n", clients.numClients);
		exit(0);
	}
	clients.clients = newPtr;
	clients.clients[clients.numClients] = oneClient;
	clients.numClients++;
	return 1;
}

int removeClient(int clientSock){
	Client **newPtr = NULL;
	int i,j;
	int found = 0;

	if (clients.numClients == 0){
		return 0;
	}

	for (i=0 ; i < clients.numClients ; i++){
		if (clients.clients[i]->clientSock == clientSock){
			free(clients.clients[i]);
			found = 1;
			break;
		}
	}
	if (!found){
		return 0;
	}
	// slide the pointer down one, free the last client, reallocate pointers
	for (j=i+1;j<clients.numClients;j++){
		clients.clients[j-1] = clients.clients[j];
	}
	if (clients.numClients>1){
		newPtr = realloc(clients.clients, (clients.numClients - 1) * sizeof(Client *));
		if (!newPtr) {
			printf("SERVER_INIT_FAIL\n");
			if (verbose)
				printf("removeClient: failed when reallocating from %d clients", clients.numClients);
			exit(0);
		}
		clients.clients = newPtr;
	}
	else {
		free(clients.clients);
		clients.clients = NULL;
	}
	clients.numClients--;
	return 1;
}

int setClientUserName(int clientSock, char *clientUserName){
	int i;
	for (i=0;i<clients.numClients;i++){
		if (clients.clients[i]->clientSock == clientSock){
			strcpy(clients.clients[i]->userName, clientUserName);
			return 1;
		}
	}
	return 0; // nothing was added - client not available
}
/**
 * Return the point to userName (not null for connection).
 * userName[0] is null character if not bound
 */
char *getClientUserName(int clientSock){
	int i;
	for (i=0;i<clients.numClients;i++){
		if (clients.clients[i]->clientSock == clientSock){
			return clients.clients[i]->userName;
		}
	}
	return NULL; // not found - clientSocket is not connected?
}

/**
 * Get ClientSock for a connected client that has the specified user
 */
int getClientSockForUserName(char *userName){
	int i;
	for (i=0;i<clients.numClients;i++){
		Client *pClient = clients.clients[i];
		if (strcmp(pClient->userName, userName) == 0){
			return pClient->clientSock;
		}
	}
	return -1;
}


/**
 * Remove Client from the global list with a lock - so it is thread safe.
 */
int removeClientWithLock(int clientSock){
	int retVal;
	pthread_mutex_lock(&clientsMut);
	retVal = removeClient(clientSock);
	pthread_mutex_unlock(&clientsMut);
	return retVal;
}

/**
 * Add Client from the global list with a lock - so it is thread safe.
 */
int addClientWithLock(int clientSock){
	int retVal;
	pthread_mutex_lock(&clientsMut);
	retVal = addClient(clientSock);
	pthread_mutex_unlock(&clientsMut);
	return retVal;
}

/**
 * Set Client's UserName in the global list with a lock - so it is thread safe.
 */
int setClientUserNameWithLock(int clientSock, char *clientUserName){
	int retVal;
	pthread_mutex_lock(&clientsMut);
	retVal = setClientUserName(clientSock, clientUserName);
	pthread_mutex_unlock(&clientsMut);
	return retVal;
}
/**
 * Get Client's UserName in the global list with a lock - so it is thread safe.
 */
char *getClientUserNameWithLock(int clientSock){
	char *retVal;
	pthread_mutex_lock(&clientsMut);
	retVal = getClientUserName(clientSock);
	pthread_mutex_unlock(&clientsMut);
	return retVal;
}

/**
 * Search the global structure and return a pointer to User
 */
User *getUserByName(char *userName){
	int i;
	int numUsers = users.numUsers;
	for (i=0; i < numUsers; i++){
		User *pUser = users.userInfo[i];
		if (strcmp(pUser->name, userName) == 0){
			return pUser;
		}
	}
	return NULL;
}

Friend *getUsersFriend(User *pUserThis, char *friendName){
	int numFriends = pUserThis->numFriends;
	int j;
	for (j=0 ; j < numFriends; j++){
		Friend *pFriend = pUserThis->friends[j];
		if (strcmp(pFriend->name,friendName) == 0){
			return pFriend;
		}
	}
	return NULL;
}
/**
 * Send friend status messages - to both sides as necessary
 */
void sendStatusUpdateMessages(int sock, char *userName, int friendsSock, char *friendName, impEm *iem){
	if (friendsSock >= 0){
		int  active = (sock >= 0) ? IMP_ACTIVE_YES : IMP_ACTIVE_NOT;
		char *str = impStrNew(iem, IMP_MSG_TYPE_STATUS, userName, IMP_FRIEND_YES, active, IMP_END);
		send(friendsSock,str,strlen(str),0);
		free(str);
	}
	if (sock >= 0){
		int  active = (friendsSock >= 0) ? IMP_ACTIVE_YES : IMP_ACTIVE_NOT;
		char *str = impStrNew(iem, IMP_MSG_TYPE_STATUS, friendName, IMP_FRIEND_YES, active, IMP_END);
		send(sock,str,strlen(str),0);
		free(str);
	}
}
