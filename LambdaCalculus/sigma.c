/*
 ============================================================================
 Name        : Question1.c
 
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int lo = 0 ;
 int hi = 4;
 int j , k , i;

 int thunk1();
 int thunk2();
 int thunk3();

int thunk1 (){
	return i * sigma(&j, lo , hi ,thunk2 ) ;
}

int thunk2 (){
	return  (i+j) * sigma(&k, lo , hi ,thunk3 );
}

int thunk3 (){
	return j*k-i ;
}


int sigma(int *k, int low, int high,int expr()) {
 int sum = 0;
 for (*k=low; *k<=high; (*k)++) {
         sum = sum + expr();
     }
 return sum;
}



int main(void) {
     int y =  	sigma(&i, lo , hi ,thunk1 );
	  return y;
}






