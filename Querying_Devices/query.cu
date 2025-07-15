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
	cudaDeviceProp prop;

	int count;
	HANDLE_ERROR ( cudaGetDeviceCount ( &count ) );
	for (int i=0; 0 < count; i++) {
		HANDLE_ERROR ( cudaGetDeviceProperties ( &prop, i ));
		printf( "	--- General Information for device %d ---\n", i );
		printf( "Name:	%s\n", prop.name );
		printf( "Compute Capability: %d.%d" )
	}
}
