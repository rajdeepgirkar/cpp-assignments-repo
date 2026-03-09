#include <stdio.h>

int main() {
    int x = 10, y = 20, z = 30;

    int *px = &x;
    int *py = &y;
    int *pz = &z;

    printf("Before swap:\n");
    printf("x = %d, y = %d, z = %d\n", *px, *py, *pz);
    printf("Addresses:\n");
    printf("px = %p, \npy = %p, \npz = %p\n\n", px, py, pz);

    int temp = *px;
    *px = *pz;
    *pz = temp;

    printf("After swap:\n");
    printf("x = %d, \ny = %d, \nz = %d\n", *px, *py, *pz);
    printf("Addresses:\n");
    printf("px = %p, \npy = %p, \npz = %p\n", px, py, pz);

    return 0;
}