/***************************************************************************
 * NO Bomb - use for practice
 ***************************************************************************/

#include <stdio.h>
#include <stdlib.h>

FILE *infile;
char BUF[BUFSIZ];
int current_phase = 0;

/* original bomb.c code with fake funcs so that we can get some practice */
int explode_bomb(){
   /*
	A080495da <explode_bomb>:
 	80495da:	83 ec 1c             	sub    $0x1c,%esp
 	80495dd:	c7 04 24 1c af 04 08 	movl   $0x804af1c,(%esp)
 	80495e4:	e8 e7 f2 ff ff       	call   80488d0 <puts@plt>
 	80495e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 	80495f0:	e8 d7 fe ff ff       	call   80494cc <send_msg>
 	80495f5:	c7 04 24 4c af 04 08 	movl   $0x804af4c,(%esp)
 	80495fc:	e8 cf f2 ff ff       	call   80488d0 <puts@plt>
 	8049601:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 	8049608:	e8 03 f3 ff ff       	call   8048910 <exit@plt>
	*/

	puts("Sorry too bad");
	printf("Here is the bomb email to prof - not really\n");
	puts("KABOOM");
	return 0;
	}
int initialize_bomb(){ printf("Bomb initialized\n"); return 0; }
int phase_defused(){ current_phase++; printf("Phase %d defused\n", current_phase); return 0; }

//int phase_1_asm(char *line){
//	asm("sub    $0x1c,%esp");
//	asm("movl   $0x804a6ac,0x4(%esp)");
//	asm("mov    0x20(%esp),%eax");
//	asm("mov    %eax,(%esp)");
//	asm("test   %eax,%eax");
//	asm("add    $0x1c,%esp");
//	asm("ret");
//}

int phase_1(char *line){ printf("In phase 1\n"); return 1;}
int phase_2(char *line){ printf("In phase 2\n"); return 1;}
int phase_3(char *line){ printf("In phase 3\n"); return 1;}
int phase_4(char *line){ printf("In phase 4\n"); return 1;}
int phase_5(char *line){ printf("In phase 5\n"); return 1;}
int phase_6(char *line){ printf("In phase 6\n"); return 1;}
char *read_line(){
	while (fgets(BUF, BUFSIZ-1, infile) != NULL){
		if (BUF[0]) return BUF;
	}
	printf("Enter Line: ");
	while (gets(BUF) != NULL){
		if (BUF[0]) return BUF;
	}
}
	

int main(int argc, char *argv[])
{
    char *input;

    /* When run with no arguments, the bomb reads its input lines
     * from standard input. */
    if (argc == 1) {
	infile = stdin;
    }

    /* When run with one argument <file>, the bomb reads from <file>
     * until EOF, and then switches to standard input. Thus, as you
     * defuse each phase, you can add its defusing string to <file> and
     * avoid having to retype it. */
    else if (argc == 2) {
	if (!(infile = fopen(argv[1], "r"))) {
	    printf("%s: Error: Couldn't open %s\n", argv[0], argv[1]);
	    exit(8);
	}
    }

    /* You can't call the bomb with more than 1 command line argument. */
    else {
	printf("Usage: %s [<input_file>]\n", argv[0]);
	exit(8);
    }

    initialize_bomb();

    printf("Welcome to your cs154 \"bomb\". It has 6 phases, which must be\n");
    printf("\"defused\" in sequence by entering correct strings. Good luck.\n");

    input = read_line();             /* Get input                   */
    phase_1(input);                  /* Run the phase               */
    phase_defused();
    printf("Phase 1 defused. How about the next one?\n");

    input = read_line();
    phase_2(input);
    phase_defused();
    printf("Phase 2 done. Keep going!\n");

    input = read_line();
    phase_3(input);
    phase_defused();
    printf("Phase 3 cleared. Halfway there!\n");

    input = read_line();
    phase_4(input);
    phase_defused();
    printf("Phase 4 passed. Try this one.\n");

    input = read_line();
    phase_5(input);
    phase_defused();
    printf("Phase 5 finished. On to the next...\n");

    input = read_line();
    phase_6(input);
    phase_defused();

    /* All phases done.  But isn't something... missing?  Something secret,
       something extra that might have been overlooked? */

    return 0;
}
