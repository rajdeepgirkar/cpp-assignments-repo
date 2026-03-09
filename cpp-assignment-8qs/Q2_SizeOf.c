// SizeOf
#include <stdio.h>

int main() {

    printf("Size of short int: %zu bytes\n", sizeof(short int)); // 2
    printf("Size of int: %zu bytes\n", sizeof(int)); // 4
    printf("Size of long int: %zu bytes\n", sizeof(long int)); // 4
    printf("Size of long long int: %zu bytes\n", sizeof(long long int)); // 8
    printf("Size of unsigned int: %zu bytes\n", sizeof(unsigned int)); // 4
    printf("Size of float: %zu bytes\n", sizeof(float)); // 4
    printf("Size of double: %zu bytes\n", sizeof(double)); // 8
    printf("Size of long double: %zu bytes\n", sizeof(long double)); // 16
    printf("Size of char: %zu bytes\n", sizeof(char)); // 1

    /*
    1. Datatypes having same size in my machinr:
    int, long int, unsigned int, float = 4 bytes
    long long int, double = 8 bytes

    2. Difference:
    unsigned int does NOT have a different size than int.
    */
}
