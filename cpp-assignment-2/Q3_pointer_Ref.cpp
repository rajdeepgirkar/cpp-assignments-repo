/*

Q3.1] Write a program to store an integer value in a variable, then: 
    - Create a pointer pointing to the variable 
    - Create a reference to the same variable 
    - Modify the value using pointer and reference 

Print the variable after each change. 

*/

#include <iostream>
using namespace std;

int main() {
    int num = 10;
    int *ptr = &num;
    int &ref = num;

    cout << "Initial value: " << num << endl;

    *ptr = 20;
    cout << "After modifying using pointer(*): " << num << endl;

    ref = 30;
    cout << "After modifying using reference(&): " << num << endl;

    return 0;
}

/*

Q3.2] Explain: 
1. Two differences between pointer and reference
ANS:
| Pointer                                                | Reference                                              |
| ------------------------------------------------------ | ------------------------------------------------------ |
| 1) Stores the address of a variable                    | Acts as an alias (another name) for a variable         |
| 2) Can be NULL or changed to point to another variable | Cannot be NULL and cannot be changed once assigned     |


2. Why references cannot be reseated but pointers can?
ANS: 
    - A reference is permanently bound to the variable when it is created, so it cannot refer to another variable later.
    - A pointer stores an address, so the address can be changed to point to a different variable.


3. Why references cannot be NULL?
ANS: A reference must always refer to a valid existing variable. Since it is just another name for that variable, it cannot exist without referring to something, so it cannot be NULL.

*/