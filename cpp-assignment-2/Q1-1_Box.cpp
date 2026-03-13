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
