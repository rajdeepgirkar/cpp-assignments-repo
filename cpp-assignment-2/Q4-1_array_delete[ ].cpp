/*

Q4.1] Write a program that: 
    - Uses new to allocate an array of 5 integers 
    - Takes user input 
    - Prints the values 
    - Deallocates memory using delete[] 

*/

#include <iostream>
using namespace std;

int main() {
    // Allocate memory for 5 integers
    int *arr = new int[5];

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

    // Deallocate memory
    delete[] arr;

    return 0;
}
