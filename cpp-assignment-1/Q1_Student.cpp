#include <iostream>
using namespace std;

class Student {
private:
    string name;
    int rollNumber;
    float marks;
    char grade;

public:
    void setName(string n) {
        name = n;
    }

    void setRollNumber(int r) {
        rollNumber = r;
    }

    void setMarks(float m) {
        marks = m;
    }

    void setGrade(char g) {
        grade = g;
    }

    string getName() {
        return name;
    }

    int getRollNumber() {
        return rollNumber;
    }

    float getMarks() {
        return marks;
    }

    char getGrade() {
        return grade;
    }

    void calculateGrade() {
        if (marks >= 90 && marks <= 100)
            grade = 'A';
        else if (marks >= 80)
            grade = 'B';
        else if (marks >= 70)
            grade = 'C';
        else if (marks >= 60)
            grade = 'D';
        else
            grade = 'F';

        cout << "Grade calculated successfully!" << endl;
    }

    void display() {
        cout << "\nStudent Information:" << endl;
        cout << "Name: " << name << endl;
        cout << "Roll Number: " << rollNumber << endl;
        cout << "Marks: " << marks << endl;
        cout << "Grade: " << grade << endl;
    }
};

int main() {
    Student s;
    int choice;
    string name;
    int roll;
    float marks;

    do {
        cout << "\n--- Student Menu ---" << endl;
        cout << "1. Accept Information" << endl;
        cout << "2. Display Information" << endl;
        cout << "3. Calculate Grade" << endl;
        cout << "4. Exit" << endl;
        cout << "Enter your choice: ";
        cin >> choice;

        switch(choice) {
            case 1:
                cout << "Enter Name: ";
                cin >> name;
                cout << "Enter Roll Number: ";
                cin >> roll;
                cout << "Enter Marks: ";
                cin >> marks;

                s.setName(name);
                s.setRollNumber(roll);
                s.setMarks(marks);
                break;

            case 2:
                s.display();
                break;

            case 3:
                s.calculateGrade();
                break;

            case 4:
                cout << "Exiting program..." << endl;
                break;

            default:
                cout << "Invalid choice!" << endl;
        }

    } while(choice != 4);

    return 0;
}
