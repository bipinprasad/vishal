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
void trans_32_by_32_offset (int M, int N, int A[N][M], int B[M][N], 
	int a_start_row, int a_start_col, 
	int nRows, int nCols,
	int b_start_row, int b_start_col,
	int b_final_row, int b_final_col,
	int TMP_VARIABLE_CNT);

void trans_61_by_67 (int M, int N, int A[N][M], int B[M][N]){
	int i,j;
	int nRows, nCols;
	
#define ROW_INCREMENT 8
#define COL_INCREMENT 4
#define tmpVariableCnt 4
#define ROW_LOOP_CNT  ((N+ROW_INCREMENT-1)/ROW_INCREMENT)
#define COL_LOOP_CNT  ((M+COL_INCREMENT-1)/COL_INCREMENT)

	//for (i=0; i<ROW_LOOP_CNT; i++){
	for (i=ROW_LOOP_CNT-1; i>=0; i--){
		nRows = ((N-i*ROW_INCREMENT) < ROW_INCREMENT) ? (N-i*ROW_INCREMENT) : ROW_INCREMENT; 
		//fprintf(stderr, "N=%d,M=%d,i=%d,nRows=%d\n",N,M,i,nRows);
		//for (j=0;j<COL_LOOP_CNT;j++){
		for (j=COL_LOOP_CNT-1;j>=0;j--){
			nCols = ((M-j*COL_INCREMENT) < COL_INCREMENT) ? (M-j*COL_INCREMENT) : COL_INCREMENT; 
			trans_32_by_32_offset (M, N, A, B, i*ROW_INCREMENT, j*COL_INCREMENT, nRows, nCols, j*COL_INCREMENT, i*ROW_INCREMENT, j*COL_INCREMENT, i*ROW_INCREMENT, tmpVariableCnt);
		}
	}
	return;

#undef ROW_INCREMENT
#undef COL_INCREMENT
#undef tmpVariableCnt
#undef ROW_LOOP_CNT
#undef COL_LOOP_CNT
	trans_32_by_32_offset (M, N, A, B,  0,  0, 32, 30, 0, 0, 0, 0, 4); 
	trans_32_by_32_offset (M, N, A, B,  0, 30, 32, 31, 30, 0, 30, 0, 4); 
	trans_32_by_32_offset (M, N, A, B, 32,  0, 35, 30, 0, 32, 0, 32, 4); 
	trans_32_by_32_offset (M, N, A, B, 32, 30, 35, 31, 30, 32, 30, 32, 4); // 2086 misses
	return;
	trans_32_by_32_offset (M, N, A, B,  0, 0, 30, 61, 0, 0, 0, 0, 4); 
	trans_32_by_32_offset (M, N, A, B, 30, 0, 37, 61, 0, 30, 0, 30, 4); // 2090 misses
	return;
	trans_32_by_32_offset (M, N, A, B, 0, 0, 67, 61, 0, 0, 0, 0, 4); // 2162 misses
	return;
	for (i=0; i<8; i++){
		for (j=0;j<4;j++){
			trans_32_by_32_offset (M, N, A, B, i*8, j*16, 8, 16, j*16, i*8, j*16, i*8, 4);
		}
	}
	//trans_32_by_32_offset (M, N, A, B, 32, 0, 32, 32, 0, 32, 0, 32);
	//trans_32_by_32_offset (M, N, A, B,  0, 0, 32, 32, 0,  0, 0,  0);
}
void trans_64_by_64 (int M, int N, int A[N][M], int B[M][N]){
	int i,j;
	int nRows, nCols;
	
#define ROW_INCREMENT 8
#define COL_INCREMENT 12
#define tmpVariableCnt 3
#define ROW_LOOP_CNT  ((64+ROW_INCREMENT-1)/ROW_INCREMENT)
#define COL_LOOP_CNT  ((64+COL_INCREMENT-1)/COL_INCREMENT)

	//for (i=0; i<ROW_LOOP_CNT; i++){
	for (i=ROW_LOOP_CNT-1; i>=0; i--){
		nRows = ((N-i*ROW_INCREMENT) < ROW_INCREMENT) ? (N-i*ROW_INCREMENT) : ROW_INCREMENT; 
		//fprintf(stderr, "N=%d,M=%d,i=%d,nRows=%d\n",N,M,i,nRows);
		//for (j=0;j<COL_LOOP_CNT;j++){
		for (j=COL_LOOP_CNT-1;j>=0;j--){
			nCols = ((M-j*COL_INCREMENT) < COL_INCREMENT) ? (M-j*COL_INCREMENT) : COL_INCREMENT; 
			trans_32_by_32_offset (M, N, A, B, i*ROW_INCREMENT, j*COL_INCREMENT, nRows, nCols, j*COL_INCREMENT, i*ROW_INCREMENT, j*COL_INCREMENT, i*ROW_INCREMENT, tmpVariableCnt);
		}
	}
	//trans_32_by_32_offset (M, N, A, B, 32, 0, 32, 32, 0, 32, 0, 32, 4);
	//trans_32_by_32_offset (M, N, A, B,  0, 0, 32, 32, 0,  0, 0,  0, 4);
}
void trans_32_by_64 (int M, int N, int A[N][M], int B[M][N]){
	int i,j;
	for (i=0; i<8; i++){
		for (j=0;j<2;j++){
			trans_32_by_32_offset (M, N, A, B, i*8, j*16, 8, 16, j*16, i*8, j*16, i*8, 4);
		}
	}
	//trans_32_by_32_offset (M, N, A, B, 32, 0, 32, 32, 0, 32, 0, 32, 4);
	//trans_32_by_32_offset (M, N, A, B,  0, 0, 32, 32, 0,  0, 0,  0, 4);
}

void trans_32_by_32_offset (int M, int N, int A[N][M], int B[M][N], 
	int a_start_row, int a_start_col, 
	int nRows, int nCols,
	int b_start_row, int b_start_col,
	int b_final_row, int b_final_col,
	int TMP_VARIABLE_CNT
){
#define BLOCK_SIZE2 8
    int i, j, k;
    int tmp2[BLOCK_SIZE2];
	if (TMP_VARIABLE_CNT > nCols)
		TMP_VARIABLE_CNT = nCols;
    for (j = 0; j < nCols; j += TMP_VARIABLE_CNT) {
    	for (i = nRows-1; i >=0 ; i-- ){
    	//for (i = 0; i < nRows; i++) {
            for (k=0; k<TMP_VARIABLE_CNT && (j+k)<nCols ; k++){
                tmp2[k] = A[a_start_row+i][a_start_col+j+k];
            }
            for (k=0; k<TMP_VARIABLE_CNT && (j+k)<nCols ; k++){
                B[b_start_row+j+k][b_start_col+i] = tmp2[k];
            }
		}
	}
	return;
	// Now copy the B matrix ovcr to the offset
	if (b_start_row != b_final_row || b_start_col != b_final_col){
	   	for (j = 0; j < nRows; j += TMP_VARIABLE_CNT) {
    		for (i = 0; i < nCols; i++) {
            	for (k=0; k<TMP_VARIABLE_CNT && (j+k)<nRows ; k++){
                	tmp2[k] = B[b_start_row+i][b_start_col+j+k];
            	}
            	for (k=0; k<TMP_VARIABLE_CNT && (j+k)<nRows ; k++){
                	B[b_final_row+i][b_final_col+j+k] = tmp2[k];
            	}
        	}
		}
    }
}
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
	}	//transpose_by_blocks(*A, *B, N, M, 8);
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

void transpose_by_blocks(int *A, int *B, int N, int M, int block_size){
	int row, col, i, j, iMax, jMax;

	for (row=0; row<N; row += block_size){
		iMax = row + block_size;
		for (col=0; col<M; col += block_size){
			jMax = col+block_size;
            for (i=row; i<iMax && i<N; i++){
                for (j=col; j<jMax && j<M; j++){
                    B[j*N+i] = A[i*M+j];
                }
            }
         }
	}
}

char trans_32_by_32_desc[] = "32x32 Transpose Algorithm";
void trans_32_by_32 (int M, int N, int A[N][M], int B[M][N]){
#define BLOCK_SIZE 8
    int i, j, k;
	int tmp2[BLOCK_SIZE];
    for (j = 0; j < M; j += BLOCK_SIZE) {
    	for (i = 0; i < N; i++) {  
			for (k=0; k<BLOCK_SIZE && (j+k)<M ; k++){
				tmp2[k] = A[i][j+k];
			}
			for (k=0; k<BLOCK_SIZE && (j+k)<M ; k++){
				B[j+k][i] = tmp2[k];
			}
/*
            tmp = A[i][j];
            B[j][i] = tmp;

	    tmp = A[i][j+1];
	    B[j+1][i] = tmp;
	
	    tmp = A[i][j+2];
	    B[j+2][i] = tmp;
 		
            tmp = A[i][j+3];
	    B[j+3][i] = tmp;

            tmp = A[i][j+4];
	    B[j+4][i] = tmp;

	    tmp = A[i][j+5];
	    B[j+5][i] = tmp;

            tmp = A[i][j+6];
	    B[j+6][i] = tmp;

            tmp = A[i][j+7];
	    B[j+7][i] = tmp;

*/
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

