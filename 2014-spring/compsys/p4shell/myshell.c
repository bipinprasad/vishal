#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include <fcntl.h>
#include <wait.h>

void doPwd(char *outFileName);
void runOneCmd(char *cmd, char *outFileName);
int openOutFile(char *outFileName);

int batchMode = 0;
int debug = 1;

typedef struct ParsedCmds {
	int cmdCnt;
	char *cmds[257]; // can only have 257 max commands when input is limited to 512 with a separator between commands
} tParsedCmds;


char * strtrim(char *str){
	// todo: trim leading characters and return pointer to the first non blank character
	while(isspace((int)*str)) {
		str++;
	}
	return str;
}
char * strrtrim(char *str){
	// todo: trim trailing characters
	char *end = str + strlen(str) - 1;
	while(end > str && (*end == '\n' || *end == '\r' || isspace((int)*end)) ) {
		*end = '\0';
		end--;
	}
	return str;
}
void myPrint(char *msg)
{
    write(STDOUT_FILENO, msg, strlen(msg));
}

int print_error(char *err){
	char error_message[30] = "An error has occurred\n";
	write(STDOUT_FILENO, error_message, strlen(error_message));
	if  (debug){
		perror(err);
	}
	exit(1);
}

/**
 * Get the file from which command lines will be processed.
 * Exit upon error.
 */
FILE * get_cmdinput_file(int argc, char *argv[]){
	FILE *fp;
	if (argc == 1){
		return stdin;  // stdin
	} else if (argc == 2){
		fp = fopen(argv[1], "r");
		batchMode = 1;
		// @todo: write error handling here, check file exists etc.
		if (!fp){
			print_error("Error opening batch file");
		}
		return fp;
	} else {
		// todo: print error
		if (debug){
			myPrint("Expecting only one batch file");
		    errno = E2BIG;
		    print_error("Too many files (> 1)");
		}
		exit(0);
	}
}

void parseCmdLine(struct ParsedCmds *pParsedCmds, char *cmdLine){
	char *pch;
	int i;
	pParsedCmds->cmdCnt = 0;

	cmdLine = strtrim(cmdLine);
	strrtrim(cmdLine);

	// todo use strtok to break up the input into commands
	pch = strtok(cmdLine, ";");
	while (pch != NULL) {
		pParsedCmds->cmds[pParsedCmds->cmdCnt] = pch;
		pParsedCmds->cmdCnt++;
		pch = strtok(NULL, ";");
	}
	// trim all the commands
	for (i=0;i<pParsedCmds->cmdCnt;i++){
		pParsedCmds->cmds[i] = strrtrim(strtrim(pParsedCmds->cmds[i]));
	}

}
void doExit() {
	exit(EXIT_SUCCESS);
}

void doPwd(char *outFileName) {
	int out_fno = openOutFile(outFileName);

	char path_buff[514];
	if (getcwd(path_buff, 512)) {
		write(out_fno, path_buff, strlen(path_buff));
		write(out_fno, "\n", 1);
	} else {
		print_error("Current working directory too large");
		exit(EXIT_FAILURE);
	}
	if (out_fno != STDOUT_FILENO){
		close(out_fno);
	}
}

void doCd(char *dir) {
	if (!dir || !dir[0]){
		dir = getenv("HOME");
	}
	chdir(dir);
}

void doExternalCmd(char *cmd, char *outFileName){
	int childpid = 0;
	int childstatus  = 0;

	myPrint(cmd);

	childpid = fork();
	if (childpid == 0){
		// child
		int out_fno = openOutFile(outFileName);
		if (out_fno != STDOUT_FILENO){
			dup2(out_fno, 1);   // make stdout go to file
			dup2(out_fno, 2);   // make stderr go to file
		}
		system(cmd);
		if (out_fno != STDOUT_FILENO){
			close(out_fno);
		}
		exit(0);
	} else {
		// parent
		wait(&childstatus);
	}

}

void doCmd(char *cmd){
	// if there any redirection?
	char *p = strchr(cmd, '>');
	char *outFileName = NULL;

	if (p){
		*p = '\0';
		strrtrim(cmd); // trim trailing space from the broken up string - command side only
		outFileName = p+1;
		outFileName = strtrim(outFileName);
	}
	runOneCmd(cmd, outFileName);
}

void runOneCmd(char *cmd, char *outFileName){
	char *p;

	// @TODO: Open outFileName here if supplied

	if (!cmd) {
		exit(EXIT_FAILURE);
	} else if (strcmp(cmd, "exit") == 0) {
		doExit();
	} else if (strcmp(cmd, "pwd") == 0) {
		doPwd(outFileName);
	} else if (strncmp(cmd, "cd", 2) == 0) {
		// it this a cd command or something that just begins with cd
		if (strlen(cmd) == 2){
			doCd(NULL);
		} else {
			if (isspace((int)cmd[2])){
				p = strrtrim(strtrim(cmd+2));
				doCd(p);
			} else{
				doExternalCmd(cmd, outFileName);
			}
		}
	} else {
		doExternalCmd(cmd, outFileName);
	}

	// @TODO Close output filename here if supplied
}
int openOutFile(char *outFileName){
	int out_fno = STDOUT_FILENO;

	if (outFileName && outFileName[0]){
		out_fno = open(outFileName, O_RDWR |O_CREAT|O_EXCL, S_IRWXU);
		if (out_fno < 0){
			print_error("Output file cannot be opened");
		}
	}
	return out_fno;
}


int main(int argc, char *argv[]) 
{
    char cmd_buff[514];
    char *pinput;
    FILE *cmdInputFile;
    struct ParsedCmds parsedCmds;
    int i;

    cmdInputFile = get_cmdinput_file(argc, argv);
    while (1) {
    	cmd_buff[0] = '\0';
    	if (!batchMode)
    		myPrint("myshell> ");
        pinput = fgets(cmd_buff, 512, cmdInputFile);
        if (!pinput) {
            exit(0);
        }

        myPrint(cmd_buff);
        parseCmdLine(&parsedCmds, pinput);
        if (debug){
			for (i = 0 ; i < parsedCmds.cmdCnt ; i++){
				printf("cmd-part (%d) = \"%s\"\n", i, parsedCmds.cmds[i]);
			}
        }
		for (i = 0 ; i < parsedCmds.cmdCnt ; i++){
			doCmd(parsedCmds.cmds[i]);
		}
    }

    if (batchMode){
    	fclose(cmdInputFile);

    }
}

