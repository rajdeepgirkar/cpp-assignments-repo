#include <iostream>
using namespace std;

class Employee {
private:
    int id;
    string name;
    mutable int accessCount;

public:
    // Constructor
    Employee(int i, string n) {
        id = i;
        name = n;
        accessCount = 0;
    }

    // USER-DEFINED COPY CONSTRUCTOR
    Employee(const Employee &e) {
        id = e.id;
        name = e.name;
        accessCount = e.accessCount;
        cout << "User-defined copy constructor called\n";
    }

    // CONST MEMBER FUNCTION
    void display() const {
        accessCount++;
        cout << "ID: " << id << endl;
        cout << "Name: " << name << endl;
        cout << "Access Count: " << accessCount << endl << endl;
    }
};

int main() {

    // TASK 1: CREATE OBJECT e1 AND CALL display() MULTIPLE TIMES
    Employee e1(101, "Rajdeep");
    e1.display();
    e1.display();
    e1.display();

    // TASK 2: CREATE e2 = e1 AND CHECK COPYING
    Employee e2 = e1;
    e2.display();

    // DEFAULT COPY CONSTRUCTOR
    // If no copy constructor is written, C++ automatically creates one
    // that performs member-wise copying.

    // SHALLOW COPY
    // Copies values of data members directly.
    // If pointers exist, both objects point to the same memory location.

    // DEEP COPY
    // Creates separate memory for copied data so objects work independently.

    // USER-DEFINED COPY CONSTRUCTOR
    // Programmer defines how copying happens (used for deep copy when needed).

    // TASK 3: display() IS const AND accessCount IS mutable
    // display() is const so it does not modify object data.
    // accessCount is mutable so it can still be modified inside a const function.

    return 0;
}
