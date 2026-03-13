/*

Q6.1] Create a class Employee with: 
    - const int employeeId 
    - string name 
    - float salary 

Write a constructor using initializer list to initialize all members. 

Q6.2] Add a function to display details. 

*/

#include <iostream>
using namespace std;

class Employee {
private:
    const int employeeId;
    string name;
    float salary;

public:
    Employee(int id, string n, float s) : employeeId(id), name(n), salary(s) {}

    void display() {
        cout << "Employee ID: " << employeeId << endl;
        cout << "Name: " << name << endl;
        cout << "Salary: " << salary << endl;
    }
};

int main() {
    Employee e1(101, "Rajdeep", 50000);
    e1.display();

    return 0;
}

/*

Q6.3] Answer these:

1.  Why must const members be initialized in initializer list? 
ANS: const members must be initialized in the initializer list because their value cannot be changed after the object is created.

2.  What happens if you try to assign the value of a const member inside constructor body? 
ANS: It will cause a compile-time error, because const variables cannot be assigned a value after initialization.

3.  Why is initializer list faster than assignment? 
ANS: The initializer list directly initializes the member variables, while assignment first creates the variable and then assigns a value, which requires an extra step.

*/
