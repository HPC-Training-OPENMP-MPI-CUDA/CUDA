#include <iostream>
#define HANDLE_ERROR(err) (HandleError(err, __FILE__, __LINE__))
inline void HandleError(cudaError_t err, const char *file, int line) {
    if (err != cudaSuccess) {
        fprintf(stderr, "CUDA Error: %s at %s:%d\n", cudaGetErrorString(err), file, line);
        exit(EXIT_FAILURE);
    }
}
// Learn how to pass parameters to funcation in kernal of cuda
__global__ void add (int a, int b, int *c){
	*c = a + b;
}

int main ( void ) {
	int c;
	int *dev_c;
	HANDLE_ERROR( cudaMalloc ( (void**) &dev_c, sizeof(int)));

	add <<<1,1>>>(2,7, dev_c);

	HANDLE_ERROR ( cudaMemcpy ( &c,
				    dev_c,
				    sizeof(int),
				    cudaMemcpyDeviceToHost ) );
	printf("2 + 7 = %d\n" , c);
	cudaFree( dev_c );
	
	return 0;
}
