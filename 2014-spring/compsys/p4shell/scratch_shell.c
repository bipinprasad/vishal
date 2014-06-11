#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>

typedef struct ParsedCmds {
        int cmdCnt;
        char *cmds[257]; // can only have 257 max char
} ParsedCmds;

void myPrint(char *msg);
int printError(char *err);
FILE * getCmdInputFile(int argc, char *argv[]);
void doExit();
void doPwd();
void doCd(char *dir);
void doExternalCmd(char *cmd);
void runOneCmd(char *cmd);
char* strtrim(char *str);
char* strrtrim(char *str);
void parseCmdLine(struct ParsedCmds *pParsedCmds, char *cmdLine);
int openOutFile(char *outFileName);



int batchMode = 0;
int debug = 1;

int main(int argc, char *argv[]) {
	char cmd_buff[514];
	char *pinput;
	struct ParsedCmds parsedCmds;
	int i;

	FILE * cmd_input_file = getCmdInputFile(argc, argv);
	while (1) {
		cmd_buff[0] = '\0';
		if (!batchMode)
			myPrint("myshell> ");
		pinput = fgets(cmd_buff, 512, cmd_input_file);
		if (!pinput) {
			exit(0);
		}
		myPrint(cmd_buff);
		parseCmdLine(&parsedCmds, pinput);
		if (debug) {
			for (i = 0; i < parsedCmds.cmdCnt; i++) {
				printf("cmd-part (%d) = \"%s\"\n", i, parsedCmds.cmds[i]);
			}
		}
		for (i = 0; i < parsedCmds.cmdCnt; i++) {
			runOneCmd(parsedCmds.cmds[i]);
		}
	}

	if (batchMode) {
		fclose(cmd_input_file);
	}

}

void myPrint(char *msg) {
	write(STDOUT_FILENO, msg, strlen(msg));
}

int printError(char *err) {
	char error_message[30] = "An error has occurred\n";
	write(STDOUT_FILENO, error_message, strlen(error_message));
	if (debug) {
		perror(err);
	}
	exit(EXIT_SUCCESS);
}

FILE * getCmdInputFile(int argc, char *argv[]) {
	FILE * fp;
	if (argc == 1) {
		return stdin;
	} else if (argc == 2) {
		fp = fopen(argv[1], "r");
		if (!fp) {
			printError("Error opening batch file");
		}
		return fp;
	} else {
		errno = E2BIG;
		printError("Too many files (> 1)");
		exit(EXIT_FAILURE);
	}
}

void doExit() {
	exit(EXIT_SUCCESS);
}

void doPwd() {
	char path_buff[514];
	if (getcwd(path_buff, 512)) {
		write(STDOUT_FILENO, path_buff, strlen(path_buff));
		puts("");
	} else {
		printError("Current working directory too large");
		exit(EXIT_FAILURE);
	}
}

void doCd(char *dir) {
	if (!dir || !dir[0]) {
		dir = getenv("HOME");
	}
	chdir(dir);
}

void doExternalCmd(char *cmd) {
	myPrint(cmd);
}

void runOneCmd(char *cmd) {
	char *p;
	if (!cmd) {
		exit(EXIT_FAILURE);
	} else if (strcmp(cmd, "exit") == 0) {
		doExit();
	} else if (strcmp(cmd, "pwd") == 0) {
		doPwd();
	} else if (strncmp(cmd, "cd", 2) == 0) {
		// it this a cd command or something that just begins with cd
		if (strlen(cmd) == 2) {
			doCd(NULL);
		} else {
			if (isspace((int) cmd[2])) {
				p = strrtrim(strtrim(cmd + 2));
				doCd(p);
			} else {
				doExternalCmd(cmd);
			}
		}
	} else {
		doExternalCmd(cmd);
	}
}


char * strtrim(char *str) {
	// todo: trim leading characters and return pointer to the first non-blank character
	while (isspace((int) *str)) {
		str++;
	}
	return str;
}

char * strrtrim(char *str) {
	// todo: trim trailing characters
	char *end = str + strlen(str) - 1;
	while (end > str && (*end == '\n' || *end == '\r' || isspace((int) *end))) {
		*end = '\0';
		end--;
	}
	return str;
}

void parseCmdLine(struct ParsedCmds *pParsedCmds, char *cmdLine) {
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
	for (i = 0; i < pParsedCmds->cmdCnt; i++) {
		pParsedCmds->cmds[i] = strrtrim(strtrim(pParsedCmds->cmds[i]));
	}

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



