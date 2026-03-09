#include <iostream>
using namespace std;

int main() {
    int x = 10, y = 20, z = 30;

    int *px = &x;
    int *py = &y;
    int *pz = &z;

    cout << "Before swap:\n";
    cout << "x = " << *px 
         << ", y = " << *py 
         << ", z = " << *pz << endl;

    cout << "Addresses:\n";
    cout << "px = " << px 
         << "\npy = " << py 
         << "\npz = " << pz << "\n\n";

    int temp = *px;
    *px = *pz;
    *pz = temp;

    cout << "After swap:\n";
    cout << "x = " << *px 
         << ", y = " << *py 
         << ", z = " << *pz << endl;

    cout << "Addresses:\n";
    cout << "px = " << px 
         << "\npy = " << py 
         << "\npz = " << pz << endl;

    return 0;
}