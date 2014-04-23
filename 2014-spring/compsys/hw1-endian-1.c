/*
 * hw1-endian-1.c
 *
 *  Created on: Apr 6, 2014
 *      Author: Vishal
 */
#include <stdio.h>

int eqbigandsmall(x){
	return (x >> ((sizeof(int)-1) * 8)) == (x & 0xFF);
}

int main() {
  int endian, foo;
  foo = 1;
  endian = (*((char *)(&foo)) + ' ' == ' ');
  printf("hello world, from a %s-endian machine\n",
         endian ? "big" : "little");

  /*Question 2 */
  /*A. At least one bit of x is 0.
    B. At least one bit of x is 1.
    C. Any of the bits in the most significant nibble of x is 0.
    D. Any of the bits in the least significant nibble of x is 1.
    E. The most significant and the least significant byte are equal. For this partequality (==) testing is allowed.
    F. Any even bit of x is 1. The least-significant bit is an even bit, for example. For this part you can assume an int is 32-bits.
  */

  //A tests
  printf ("\nA tests: at least one bit of x is 0\n");
  printf ("This should be 1: %d\n", one0(5));
  printf ("This should be 0: %d\n", one0(0xFFFFFFFF));

  //B tests
  printf ("\nB tests: at lease one bit x is 1\n");
  printf ("This should be 1: %d\n", one1(5));
  printf ("This should be 0: %d\n", one1(0));

  //C tests
  printf ("\nC tests\n");
  printf ("This should be 1: %d\n", nibOne0(5));
  printf ("This should be 0: %d\n", nibOne0(0xF0000000));

  //D tests
  printf ("\nD tests\n");
  printf ("This should be 1: %d\n", nibOne1(5));
  printf ("This should be 0: %d\n", nibOne1(0x000000F0));

  //E tests
  printf ("\nE tests\n");
  printf ("This should be 1: %d\n", equalBites(0xFF0000FF));
  printf ("This should be 0: %d\n", equalBites(0x1F0000F1));

  //E tests
  printf ("\nE tests\n");
  printf ("This should be 1: %d\n", eqbigandsmall(0xFF0000FF));
  printf ("This should be 0: %d\n", eqbigandsmall(0x1F0000F1));


  //F tests
  printf ("\nF tests\n");
  printf ("This should be 1: %d\n", even1(0x00000001));
  printf ("This should be 0: %d\n", even1(0x00000002));

  return endian;
}

/*A. At least one bit of x is 0.*/
int one0 (int x){
  return ~x && 1;
}

/*B. At least one bit of x is 1.*/
int one1 (int x){
  return x && 1;
}

/*C. Any of the bits in the most significant nibble of x is 0.*/
int nibOne0 (int x){
  return (~x >> 28) && 1;
}

/*D. Any of the bits in the least significant nibble of x is 1.*/
int nibOne1 (int x){
  return (x << 28) && 1;
}

/*E. The most significant and the least significant byte are equal. For this partequality (==) testing is allowed.*/
int equalBites (int x){
  int bigBite = (x >> 24) << 24;
  int littleBite = x << 24;
  return (bigBite == littleBite);

  //more succinctly: return ((x >> 24) << 24 == x << 24)
}

/*F. Any even bit of x is 1. The least-significant bit is an even bit, for example. For this part you can assume an int is 32-bits.*/
int even1 (int x){
  return (x & 0x55555555) && 1;
}



