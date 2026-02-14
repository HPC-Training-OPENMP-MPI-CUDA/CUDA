#include <stdio.h>
#include <iostream>
#include <cuda_runtime.h>
// This the first sample code of kernal

__global__ void kernal ( void ) {
	printf("Hello world! \n");
}

int main( void ) {
	kernal<<<1,1>>> ();
	// Wait for GPU to finish
    cudaDeviceSynchronize();
	return 0;
}
