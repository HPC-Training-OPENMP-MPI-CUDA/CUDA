#include <stdio.h>
#include <iostream>
// This the first sample code of kernal

__global__ void kernal ( void ) {

}

int main( void ) {
	kernal<<<1,1>>> ();
	printf("Hello world! \n");
	return 0;
}
