#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <getopt.h>
#include <sys/types.h>
#include "cachelab.h"
#include <sys/wait.h> // for WEXITSTATUS
#include <limits.h> // for INT_MAX

#include "cachelab.h"

#define MAX_CACHE_LINES 100
#define MAX_SET_INDEX_BITS 60
#define MAX_BLOCK_INDEX_BITS 60

#define DEFAULT_SET_BITS    10
#define DEFAULT_CACHE_LINES 2
#define DEFAULT_BLOCK_BITS  8
#define CACHE_BYTES_PER_LINE (B+3*sizeof(int))


/*
 * usage - Print usage info
 */
void usage(char *argv[]){
	// -v -s 4 -E 1 -b 4 -t traces/yi.trace
    printf("Usage: %s [-v] -s <set-bits> -E <cache-lines> -b <block-bits> -t <trace-file>\n", argv[0]);
    printf("Simulate a cache using request from a tracefile.\n");
    printf("Options:\n");
    printf("  -v               verbose.\n");
    printf("  -s <set-bits>    Number of set index bits columns (max %d)\n", MAX_CACHE_LINES);
    printf("  -E <cache-lines> Number of lines in the cache (max %d)\n", MAX_CACHE_LINES);
    printf("  -b <block-bits>  Number of block index bits columns (max %d)\n", MAX_BLOCK_INDEX_BITS);
    printf("  -t <trace-file>  Path to an existing trace-file to process\n");
    printf("Example: %s -v -s 4 -E 1 -b 4 -t traces/yi.trace\n", argv[0]);
}

void parseOptions(int argc, char *argv[], int *sp, int *Ep, int *bp, char *traceFile, int *verbosep){
	char c;
	*verbosep = 0;
	*sp       = DEFAULT_SET_BITS;
	*Ep		  = DEFAULT_CACHE_LINES;
	*bp		  = DEFAULT_BLOCK_BITS;
	*traceFile='\0';

    while ((c = getopt(argc,argv,"s:E:b:t:vh")) != -1) {
        switch(c) {
        case 's':
            *sp = atoi(optarg);
            break;
        case 'E':
            *Ep = atoi(optarg);
            break;
        case 'b':
            *bp = atoi(optarg);
            break;
        case 'v':
            *verbosep = 1;
            break;
        case 't':
            strcpy(traceFile,optarg);
            break;
        case 'h':
            usage(argv);
            exit(0);
        default:
            usage(argv);
            exit(1);
        }
    }

    if (*sp < 1 || *sp > MAX_SET_INDEX_BITS) {
        printf("Error: Set index bits should be between 1 and %d and not %d\n", MAX_SET_INDEX_BITS, *sp);
        // usage(argv);
        exit(1);
    }

    if (*bp < 1 || *bp > MAX_BLOCK_INDEX_BITS) {
        printf("Error: Block index bits should be between 1 and %d and not %d\n", MAX_BLOCK_INDEX_BITS, *bp);
        // usage(argv);
        exit(1);
    }

    if (*Ep < 1 || *Ep > MAX_CACHE_LINES) {
        printf("Error: Cache lines should be between 1 and %d and not %d\n", MAX_CACHE_LINES, *Ep);
        // usage(argv);
        exit(1);
    }

    if (!traceFile[0]){
        printf("Error: Trace-file argument (-t) is required but missing\n");
        // usage(argv);
        exit(1);
    }

    // traceFile readable?
    if( access( traceFile, R_OK ) == -1 ) {
    	printf("Error: Trace-file \"%s\" cannot be read\n", traceFile);
    	exit(1);
    }

    if (*verbosep){
    	printf("%s: s=%d,E=%d,b=%d,traceFile=%s\n", argv[0], *sp, *Ep, *bp, traceFile);
    }
}

int getTag (unsigned int address, int s, int b){
  int tag = address >>> (s+b);
  return tag;
}

int getSet (unsigned int address, int s, int b){
    //s_no * L * (B/4 + 1)
	int leftm = sizeof(int) -s - b;
	int set <<= leftm;
    set >>>= (leftm+b);
    return set;
}

int getValid (unsigned int address){
  return address >> 31;
}

int getSetStart(int s_no, int L, int B){
	return s_no * L * CACHE_BYTES_PER_LINE / 4;
}
void simulate(int *cache, int action, unsigned int address, unsigned int bytes, int *pHits, int *pMisses, int *pEvictions, int s, int E, int b){
	/**
	 * action = LOAD_ACTION, MODIFY_ACTION, STORE_ACTION.
	 * address = starting address of the action
	 * bytes   = number of bytes affected from the address
	 * pHitsm, pMisses, pEvictions are pointers to integers that are updated based on the action
	 *           in this simulate function.
	 *
	 * How to detect LRU: In each set, keep an integer (ignoring the leftmost sign bit).
	 * All the lines in the accessed set are shifted to the right, and then the Rth position
	 * bit is set to 1. The cache line with the lowest associated number can be evicted first.
	 * Note that this works properly as long as the number of lines in the set does not exceeed
	 * the number of bits. For example, if we are working with 31 bits, then we can only use this
	 * to rank upto 31 lines. If the number of lines are more than 31, then the ordinsl positions
	 * 32 onwards would all appear to have the same rank of last (the flag=0).
	 */

	struct tLine {
	  int flags;	// bit flags -
	  int valid_flag;		// first bit: valid/invalid
					// unused bits
	  int tag;			// tag bits		= m - s - b
	  int set;     			// set bits
					// block bits
	  int lruRank;                  // lowest corresponds to line that was used least recently
					// ignoring actual memory bytes - since we are assuming that all request
					// do not cross block boundary
	};

        //What happens when Direct Mapped? Do we need to account for different tagging scheme?


	int tag = getTag(address, s, b);
	int set = getSet(address, s, b);
	int offset = set * E * CACHE_BYTES_PER_LINE;
	int isValid = cache[offset]
	int flagInt = cache[offset+1];
	int lru     = cache[offset+2];

	if (isValid){}

	//if tag or set not in the cache:
	   //if getValid(address) = 0;
             //then *pMisses += 1;
  	     //lowest lru ranked line, address = address passed in.
	     //update lruRank;

	//else *pHits += 1;
       
}

int main(int argc, char *argv[])
{
	int verbose,s,E,b, S,B;
	int *cache;
	char traceFile[BUFSIZ];
	char traceLine[BUFSIZ];
	int  intSize = sizeof(int);
	FILE *fp = NULL;
	char *lineMemAction;
	char *lineMemStart;
	char *lineMemBytes;
	int  memStart;
	int  memBytes;

	int hits = 0, misses=0, evictions=0;

	parseOptions(argc, argv, &s, &E, &b, traceFile, &verbose);
	S = 0x01 << s;
	B = 0x01 << b;
	cache = (int *)malloc(S * E * CACHE_BYTES_PER_LINE);

	if ((fp = fopen(traceFile, "r")) == NULL){
		perror ("Error opening trace-file");
		exit(1);
	}
	while (fgets(traceLine,BUFSIZ,fp) != NULL){
		if (traceLine[0] != ' '){
			if (verbose)
				printf("Ignoring trace line that does not begin with space: \"%s\"\n", traceLine);
			continue;
		}
		lineMemAction = lineMemStart = lineMemBytes;
		lineMemAction	= strtok(traceLine, " ,");
		if (lineMemAction)
			lineMemStart = strtok(NULL, " ,\n");
		if (lineMemStart)
			lineMemBytes = strtok(NULL, " ,\n");
		if (!lineMemAction || !lineMemStart || !lineMemBytes){
			if (verbose)
				printf("Ignoring trace line without all required params: \"%s\"\n", traceLine);
			continue;
		}
		memStart = atoi(lineMemStart);
		memBytes = atoi(lineMemBytes);
		if (verbose)
			printf("Processing trace lines: \" %s %d,%d\"\n", lineMemAction, memStart, memBytes);
		simulate(cache, 0, memStart, memBytes, &hits, &misses, &evictions, s, E, b);
	}
	if (verbose){
		printf("Size of integer = %d bytes\n", intSize);
	}
	fclose(fp);

    //printSummary(hits, misses, evictions);
    return 0;
}
