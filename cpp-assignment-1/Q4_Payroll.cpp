#include <iostream>
using namespace std;

class Employee {
private:
    int empID;
    string empName;
    double empSalary;
    double grossSalary;

public:
    void setEmpID(int id) {
        empID = id;
    }

    void setEmpName(string name) {
        empName = name;
    }

    void setEmpSalary(double salary) {
        empSalary = salary;
    }

    int getEmpID() {
        return empID;
    }

    string getEmpName() {
        return empName;
    }

    double getEmpSalary() {
        return empSalary;
    }

    void calculateGrossSalary() {
        if (empSalary <= 5000)
            grossSalary = empSalary + empSalary * 0.10;
        else if (empSalary <= 10000)
            grossSalary = empSalary + empSalary * 0.15;
        else
            grossSalary = empSalary + empSalary * 0.20;

        cout << "Gross Salary: " << grossSalary << endl;
    }

    void displayEmployeeDetails() {
        cout << "\nEmployee Details\n";
        cout << "Employee ID: " << empID << endl;
        cout << "Employee Name: " << empName << endl;
        cout << "Employee Salary: " << empSalary << endl;
        cout << "Gross Salary: " << grossSalary << endl;
    }
};

int main() {
    Employee emp[100];
    int count = 0;
    int choice, id, i;
    string name;
    double salary;

    do {
        cout << "\n--- Employee Payroll Menu ---\n";
        cout << "1. Add New Employee\n";
        cout << "2. Calculate Gross Salary\n";
        cout << "3. Display Employee Details\n";
        cout << "4. Update Employee Information\n";
        cout << "5. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {

        case 1:
            cout << "Enter Employee ID: ";
            cin >> id;

            for(i = 0; i < count; i++) {
                if(emp[i].getEmpID() == id) {
                    cout << "Employee ID already exists!\n";
                    break;
                }
            }

            if(i == count) {
                emp[count].setEmpID(id);
                cout << "Enter Employee Name: ";
                cin >> name;
                emp[count].setEmpName(name);

                cout << "Enter Employee Salary: ";
                cin >> salary;
                emp[count].setEmpSalary(salary);

                count++;
            }
            break;

        case 2:
            cout << "Enter Employee ID: ";
            cin >> id;

            for(i = 0; i < count; i++) {
                if(emp[i].getEmpID() == id) {
                    emp[i].calculateGrossSalary();
                    break;
                }
            }
            break;

        case 3:
            cout << "Enter Employee ID: ";
            cin >> id;

            for(i = 0; i < count; i++) {
                if(emp[i].getEmpID() == id) {
                    emp[i].displayEmployeeDetails();
                    break;
                }
            }
            break;

        case 4:
            cout << "Enter Employee ID to update: ";
            cin >> id;

            for(i = 0; i < count; i++) {
                if(emp[i].getEmpID() == id) {
                    cout << "Enter new name: ";
                    cin >> name;
                    emp[i].setEmpName(name);

                    cout << "Enter new salary: ";
                    cin >> salary;
                    emp[i].setEmpSalary(salary);

                    cout << "Employee updated successfully.\n";
                    break;
                }
            }
            break;

        case 5:
            cout << "Exiting program...\n";
            break;

        default:
            cout << "Invalid choice!\n";
        }

    } while(choice != 5);

    return 0;
}