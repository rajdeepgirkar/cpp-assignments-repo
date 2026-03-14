#include <iostream>
#include <fstream>
using namespace std;

class Student {
private:
    int roll;
    string name;
    float marks;

public:

    // PARAMETERIZED CONSTRUCTOR
    Student(int r, string n, float m) {
        roll = r;
        name = n;
        marks = m;
    }

    // FUNCTION TO WRITE DATA TO FILE
    void writeToFile(ofstream &out) {
        out << roll << " " << name << " " << marks << endl;
    }

    // DESTRUCTOR
    ~Student() {
        cout << "Destroying student " << name << endl;
    }
};

int main() {

    // TASK 1: CREATE ARRAY OF 3 STUDENT OBJECTS
    Student s[3] = {
        Student(1, "Rajdeep", 85.5),
        Student(2, "Sahil", 78.0),
        Student(3, "Mihir", 91.2)
    };

    // TASK 2: WRITE ALL STUDENT DETAILS TO FILE "students.txt"
    ofstream fout("students.txt");

    for(int i = 0; i < 3; i++) {
        s[i].writeToFile(fout);
    }
    fout.close();

    // TASK 3: READ THE FILE AGAIN AND PRINT CONTENTS
    ifstream fin("students.txt");
    int r;
    string n;
    float m;
    cout << "Reading from file:\n";

    while(fin >> r >> n >> m) {
        cout << "Roll: " << r << "\n" << "Name: " << n << "\n" << "Marks: " << m << endl << endl;
    }
    fin.close();

    // TASK 4: EXPLAIN CONSTRUCTOR / DESTRUCTOR CALL SEQUENCE FOR ARRAY OF OBJECTS
    // Constructor Call Order:
    // When an array of objects is created, constructors are called from first object to last object.
    // Example order: Student1 -> Student2 -> Student3

    // Destructor Call Order:
    // When program ends, destructors are called in reverse order (Last In First Out).
    // Example order: Student3 -> Student2 -> Student1

    return 0;
}
