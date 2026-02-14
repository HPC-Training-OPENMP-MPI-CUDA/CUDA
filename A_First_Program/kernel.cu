#include <stdio.h>
#include <iostream>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
// This the first sample code of kernal

__global__ void kernal ( void ) {
        //print the blocks and threads IDs
        printf("The block ID is %d --- The thread ID is %d\n", blockIdx.x ,threadIdx.x);
}

int main( void ) {
        //kernal<<<3456,1024>>> (); max block and max threads
        kernal<<<32,1024>>> ();    //<<<number_of_block, number_of_threads_per_block>>>  max_number_of_threads_per_block=1024
        cudaDeviceSynchronize();  // VERY IMPORTANT
        printf("Hello world! \n");
        return 0;
}