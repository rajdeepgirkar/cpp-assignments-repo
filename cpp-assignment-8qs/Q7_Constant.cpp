#include <iostream>
#include <iomanip>
using namespace std;

const float PI = 3.14159f;

float circleArea(float radius);
float circlePerimeter(float radius);

int main() {
    float radius = 7.0f;

    cout << fixed << setprecision(4);

    cout << "Radius = " << radius << endl;
    cout << "Area = " << circleArea(radius) << endl;
    cout << "Perimeter = " << circlePerimeter(radius) << endl;

    // PI = 3.0f;   // attempt to modify const variable

    return 0;
}

float circleArea(float radius) {
    return PI * radius * radius;
}

float circlePerimeter(float radius) {
    return 2 * PI * radius;
}

//  error: assignment of read-only variable 'PI'
//    20 |     PI = 3.0f;   // attempt to modify const variable
//       |     ~~~^~~~~~