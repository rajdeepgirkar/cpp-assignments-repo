/*

Q1.1] Create a class Box with private members length, width, and height. 

Write: 
    - A parameterized constructor 
    - A function setDimensions(int, int, int) that uses this-> to distinguish between member variables and parameters 
    - A function volume() to compute the volume 

Demonstrate: 
    - Initialization using constructor 
    - Assignment using setDimensions() 

*/

#include <iostream>
using namespace std;

class Box {
private:
    int length;
    int width;
    int height;

public:
    Box(int length, int width, int height) {
        this->length = length;
        this->width = width;
        this->height = height;
    }

    void setDimensions(int length, int width, int height) {
        this->length = length;
        this->width = width;
        this->height = height;
    }

    int volume() {
        return length * width * height;
    }
};

int main() {

    Box b1(5, 4, 3);
    cout << "Volume using constructor initialization: " << b1.volume() << endl;

    b1.setDimensions(10, 6, 2);
    cout << "Volume after using setDimensions(): " << b1.volume() << endl;

    return 0;
}

/*

Q1.2] Answer this: 

1) Why must initialization happen before assignment? 
ANS: 
Initialization must happen before assignment because a variable or object must be created and given an initial value before it can be used or modified.
    - Initialization: Giving a value to a variable at the time of its creation.
    - Assignment: Giving or changing a value after the variable has already been created.
If a variable is not initialized first, it may contain a garbage (undefined) value, which can cause incorrect program behavior.

2) When is initialization preferred over assignment? 
ANS: 
Initialization is preferred over assignment in the following situations:
1. When creating objects - Using constructors ensures that objects start with valid values.
2. For constant variables - const variables must be initialized at declaration because their values cannot be changed later.
3. For reference variables - References must be initialized when declared.
4. For better performance - Initialization directly sets the value, while assignment may first create the object and then change its value, which can be less efficient.

*/