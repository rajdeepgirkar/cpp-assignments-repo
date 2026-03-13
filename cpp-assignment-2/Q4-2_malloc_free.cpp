/*

Q4.2] Repeat Q4.1 using malloc and free. 

*/

#include <iostream>
#include <cstdlib>
using namespace std;

int main() {
    // Allocate memory for 5 integers using malloc
    int *arr = (int*) malloc(5 * sizeof(int));

    // Take user input
    cout << "Enter 5 integers:\n";
    for(int i = 0; i < 5; i++) {
        cin >> arr[i];
    }

    // Print the values
    cout << "Entered values are:\n";
    for(int i = 0; i < 5; i++) {
        cout << arr[i] << " ";
    }

    // Deallocate memory using free
    free(arr);

    return 0;
}
