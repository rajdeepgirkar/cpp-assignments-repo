/*

Q2.1] Write three functions: 
    void swapByValue(int a, int b); 
    void swapByAddress(int *a, int *b); 
    void swapByReference(int &a, int &b); 

Call all three in main() and observe which one actually swaps values. 

*/

#include <iostream>
using namespace std;

// Pass by Value
void swapByValue(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
    cout << "Inside swapByValue: a = " << a << " b = " << b << endl;
}

// Pass by Address (Pointer)
void swapByAddress(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
    cout << "Inside swapByAddress: a = " << *a << " b = " << *b << endl;
}

// Pass by Reference
void swapByReference(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
    cout << "Inside swapByReference: a = " << a << " b = " << b << endl;
}

int main() {
    int x = 10, y = 20;

    cout << "Original values: x = " << x << " y = " << y << "\n" << endl;

    // Call swap by value
    swapByValue(x, y);
    cout << "After swapByValue: x = " << x << " y = " << y << "\n" << endl;

    // Call swap by address
    swapByAddress(&x, &y);
    cout << "After swapByAddress: x = " << x << " y = " << y << "\n" << endl;

    // Call swap by reference
    swapByReference(x, y);
    cout << "After swapByReference: x = " << x << " y = " << y << "\n" << endl;

    return 0;
}

/*

Q2.2] Answer this: 
Explain how reference variables act as aliases and how that affects swapByReference(). 

ANS: Reference variables act as aliases (another name) for existing variables and share the same memory location.

In swapByReference(int &a, int &b):
    - a becomes an alias of x
    - b becomes an alias of y
So when a and b are swapped inside the function, the original variables (x and y) are directly modified.

Result: swapByReference() successfully swaps the actual values.

*/