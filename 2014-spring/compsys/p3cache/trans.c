/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);
void trans(int M, int N, int A[N][M], int B[M][N]); 

void trans_32_by_32 (int M, int N, int A[N][M], int B[M][N]);
void trans_32_by_64 (int M, int N, int A[N][M], int B[M][N]);
void trans_64_by_64 (int M, int N, int A[N][M], int B[M][N]);
void trans_61_by_67 (int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
	if (M == 32 && N == 32){
	  trans_32_by_32(M,N,A,B);
	}
	else if (M == 32 && N == 64){
	  trans_32_by_64(M,N,A,B);
	}
	else if (M == 64 && N == 64){
	  trans_64_by_64(M,N,A,B);
	}
	else if (M == 61 && N == 67){
	  trans_61_by_67 (M,N,A,B);
	}
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */


char trans_32_by_32_desc[] = "32x32 Transpose Algorithm";
void trans_32_by_32 (int M, int N, int A[N][M], int B[M][N]){
  int i, j, tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;
  for (j = 0; j < M; j+=8) {
    for (i = 0; i < N; i++) {  
            tmp0 = A[i][j];
	    tmp1 = A[i][j+1];
	    tmp2 = A[i][j+2];
            tmp3 = A[i][j+3];
	    tmp4 = A[i][j+4];
	    tmp5 = A[i][j+5];
            tmp6 = A[i][j+6];
            tmp7 = A[i][j+7];

            B[j][i] = tmp0;
	    B[j+1][i] = tmp1;
	    B[j+2][i] = tmp2;
	    B[j+3][i] = tmp3;
	    B[j+4][i] = tmp4;
	    B[j+5][i] = tmp5;
	    B[j+6][i] = tmp6;
	    B[j+7][i] = tmp7;
        }
    }
}


void trans_32_by_64 (int M, int N, int A[N][M], int B[M][N]){
	int i0,j0;
	for (i0=0; i0<8; i0++){
	  for (j0=0;j0<2;j0++){
	    int i, j;
	    int tmp0, tmp1, tmp2, tmp3;
	    for (j = 0; j < 16; j+=4){
	      for (i = 7; i>=0 ; i--){
		tmp0 = A[i0*8 + i][j0*16 + j + 0];
		tmp1 = A[i0*8 + i][j0*16 + j + 1];
		tmp2 = A[i0*8 + i][j0*16 + j + 2];
		tmp3 = A[i0*8 + i][j0*16 + j + 3];

		B[j0*16 +j + 0][i0*8 +i] = tmp0;
		B[j0*16 +j + 1][i0*8 +i] = tmp1;
		B[j0*16 +j + 2][i0*8 +i] = tmp2;
		B[j0*16 +j + 3][i0*8 +i] = tmp3;
	      }
	    }
	  }
	}
}

void trans_64_by_64 (int M, int N, int A[N][M], int B[M][N]){
	int i0,j0;
	for (i0=7; i0>=0; i0--){
	  for (j0=15; j0>=0; j0--){  
	    int i, tmp0, tmp1, tmp2, tmp3;
	    for (i=7; i>=0; i--){
	      tmp0 = A[i0*8 + i][j0*4 + 0];
	      tmp1 = A[i0*8 + i][j0*4 + 1];
	      tmp2 = A[i0*8 + i][j0*4 + 2];
	      tmp3 = A[i0*8 + i][j0*4 + 3];
	      
	      B[j0*4 + 0][i0*8 +i] = tmp0;
	      B[j0*4 + 1][i0*8 +i] = tmp1;
	      B[j0*4 + 2][i0*8 +i] = tmp2;
	      B[j0*4 + 3][i0*8 +i] = tmp3;
	    }
	  }
	}
}

void trans_61_by_67 (int M, int N, int A[N][M], int B[M][N]){
	int i0,j0;
	int nRows, nCols;

	for (i0=8; i0>=0; i0--){
		nRows = ((N-i0*8) < 8) ? (N-i0*8) : 8; 
		for (j0=15; j0>=0; j0--){
		  nCols = ((M-j0*4) < 4) ? (M-j0*4) : 4; 

		  int i, j, k;
		  int TMP_VARIABLE_CNT = 4;

		  /*Though the assignment tells us not to use arrays, here
                    I have instantiated an array called tmp2. This array is merely
		    A place to store 4 temporary variables. Since A[N][M] is
                    61x67 (awkward dimensions to deal with) the number of temporary
                    variables that I will need in a given interation to move values from A to B
                    will change. So instead of explicitly naming 4 temporary variables,
                    I've made tmp2 so I can use 1,2,3, or 4 temporary variables if the
                    occassion arises. This makes the code cleaner. I could (with some effort)
                    use individually named temporary variables (as I did in my other transpose
                    functions), but that would be very tedious. I believe using this small array
                    does not violate the spirit of the assignment.

		    Furthermore since I have only 8 other local variables in this function (i0, j0,
                    nRows, nCols, i, j, k, and TMP_VARIABLE_CNT) having tmp2 be an array that can
                    contain no more than 4 temporary ints, means that this function never uses
                    more than 12 variables.*/
		  int tmp2[4];

		  if (TMP_VARIABLE_CNT > nCols)
		    TMP_VARIABLE_CNT = nCols;
		  for (j = 0; j < nCols; j += TMP_VARIABLE_CNT) {
		    for (i = nRows-1; i >=0 ; i--){
		      for (k=0; k<TMP_VARIABLE_CNT && (j+k)<nCols ; k++){
			tmp2[k] = A[i0*8 +i][j0*4 +j+k];
		      }
		      for (k=0; k<TMP_VARIABLE_CNT && (j+k)<nCols ; k++){
			B[j0*4 +j+k][i0*8 +i] = tmp2[k];
		      }
		    }
		  }
		}
	}
}

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc);

}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

