#include <iostream>
using namespace std;

class Inspector; // FRIEND CLASS DECLARATION

class Number {
private:
    int value;

public:

    // CONSTRUCTOR
    Number(int v = 0) {
        value = v;
    }

    // FRIEND FUNCTION FOR COMPARISON (operator>)
    friend bool operator>(Number n1, Number n2);

    // FRIEND CLASS
    friend class Inspector;

    // PRE-INCREMENT OPERATOR (++n)
    Number& operator++() {
        ++value;
        return *this;
    }

    // POST-INCREMENT OPERATOR (n++)
    Number operator++(int) {
        Number temp = *this;
        value++;
        return temp;
    }

    // ASSIGNMENT OPERATOR (=)
    Number& operator=(const Number &n) {
        value = n.value;
        return *this;
    }

    // DISPLAY FUNCTION
    void display() {
        cout << value << endl;
    }
};

// FRIEND FUNCTION IMPLEMENTATION
bool operator>(Number n1, Number n2) {
    return n1.value > n2.value;
}

// FRIEND CLASS IMPLEMENTATION
class Inspector {
public:
    void show(Number n) {
        cout << "Private value: " << n.value << endl;
    }
};

int main() {

    Number n1(5), n2(10);

    // TASK 1: SHOW DIFFERENCE BETWEEN PRE & POST INCREMENT
    cout << "\n--- Pre vs Post Increment ---\n";

    cout << "Original n1: ";
    n1.display();

    cout << "Pre-increment (++n1): ";
    (++n1).display();

    cout << "Post-increment (n1++): ";
    (n1++).display();
    cout << endl;

    cout << "Value of n1 after post-increment: ";
    n1.display();

    // TASK 2: USE INSPECTOR TO PRINT PRIVATE MEMBERS
    cout << "\n--- Inspector Accessing Private Members ---\n";

    Inspector obj;
    obj.show(n1);
    obj.show(n2);

    // TASK 3: COMPARE OBJECTS USING FRIEND FUNCTION
    cout << "\n--- Comparing Objects ---\n";

    if(n1 > n2)
        cout << "n1 is greater than n2\n";
    else
        cout << "n2 is greater than or equal to n1\n";

    cout << endl;

    return 0;
}
