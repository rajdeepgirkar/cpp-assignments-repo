#include <iostream>
using namespace std;

class Vector {
private:
    int *arr;
    int size;

public:

    // CONSTRUCTOR WITH DYNAMIC MEMORY ALLOCATION
    Vector(int s) {
        size = s;
        arr = new int[size];
    }

    // OPERATOR [] TO ACCESS ELEMENTS
    int& operator[](int index) {
        return arr[index];
    }

    // OPERATOR () TO RETURN SUM OF ALL ELEMENTS
    int operator()() {
        int sum = 0;
        for(int i = 0; i < size; i++) {
            sum += arr[i];
        }
        return sum;
    }

    // DESTRUCTOR TO FREE MEMORY
    ~Vector() {
        delete[] arr;
    }
};

int main() {

    // TASK 1: AGGREGATE INITIALIZATION
    // Aggregate initialization is not suitable here because the class
    // contains private members and dynamic memory allocation.

    Vector v(5);

    // INITIALIZING VECTOR ELEMENTS
    for(int i = 0; i < 5; i++) {
        v[i] = (i + 1) * 10;
    }

    // TASK 2: DEMONSTRATE v[2] = 50
    v[2] = 50;

    cout << "Vector elements:\n";
    for(int i = 0; i < 5; i++) {
        cout << "v[" << i << "] = " << v[i] << endl;
    }

    // TASK 2: DEMONSTRATE cout << v()
    cout << "\nSum of all elements using v(): " << v() << endl;

    // TASK 3: DIFFERENCE BETWEEN INDEX AND FUNCTION-CALL OPERATORS
    // operator[] (Index Operator):
    // Used to access or modify elements using an index like an array.
    // Example: v[2] accesses the 3rd element.

    // operator() (Function-call Operator):
    // Allows the object to behave like a function.
    // Example: v() computes and returns the sum of elements.

    return 0;
}
