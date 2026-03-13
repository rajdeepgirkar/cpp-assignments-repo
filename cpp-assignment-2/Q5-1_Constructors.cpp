/*

Q5.1] Create a class Student with: 
    rollNo 
    name 
    marks 

Write the following: 
    1. Default constructor 
    2. Parameterized constructor 
    3. Constructor that uses this-> pointer 
    4. A function to print student details 

Create: 
    - One object using default constructor 
    - Two objects using parameterized constructor 

*/

#include <iostream>
using namespace std;

class Student {
private:
    int rollNo;
    string name;
    float marks;

public:
    Student() {
        rollNo = 1;
        name = "Raj";
        marks = 80;
    }

    Student(int r, string n, float m) {
        rollNo = r;
        name = n;
        marks = m;
    }

    Student(int rollNo, string name, float marks, int x) {
        this->rollNo = rollNo;
        this->name = name;
        this->marks = marks;
    }

    void display() {
        cout << "Roll No: " << rollNo << endl;
        cout << "Name: " << name << endl;
        cout << "Marks: " << marks << "\n" << endl;
    }
};

int main() {

    Student s1;
    Student s2(2, "Deep", 85);
    Student s3(3, "Rajdeep", 90, 1);

    cout << "Student #1 Details:\n";
    s1.display();

    cout << "Student #2 Details:\n";
    s2.display();

    cout << "Student #3 Details:\n";
    s3.display();

    return 0;
}

/*

Q5.2] Answer: 
1) When does compiler generate a default constructor? 
ANS: The compiler automatically generates a default constructor when no constructor is defined in the class.

2) When does it NOT generate one? 
ANS: The compiler does not generate a default constructor if the programmer defines any constructor in the class.

3) Can constructors be overloaded? 
ANS: Yes, constructors can be overloaded by defining multiple constructors with different parameter lists in the same class.

*/