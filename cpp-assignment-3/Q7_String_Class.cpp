#include <iostream>
#include <cstring>
using namespace std;

class String {
private:
    char* str;

public:

    // CONSTRUCTOR
    String(const char* s = "") {
        str = new char[strlen(s) + 1];
        strcpy(str, s);
    }

    // COPY CONSTRUCTOR (DEEP COPY)
    String(const String &s) {
        str = new char[strlen(s.str) + 1];
        strcpy(str, s.str);
    }

    // ASSIGNMENT OPERATOR
    String& operator=(const String &s) {
        if (this != &s) {
            delete[] str;
            str = new char[strlen(s.str) + 1];
            strcpy(str, s.str);
        }
        return *this;
    }

    // OPERATOR + FOR CONCATENATION
    String operator+(const String &s) {
        char* temp = new char[strlen(str) + strlen(s.str) + 1];
        strcpy(temp, str);
        strcat(temp, s.str);

        String result(temp);
        delete[] temp;
        return result;
    }

    // OPERATOR >> FOR INPUT
    friend istream& operator>>(istream &in, String &s) {
        char temp[1000];
        in >> temp;

        delete[] s.str;
        s.str = new char[strlen(temp) + 1];
        strcpy(s.str, temp);

        return in;
    }

    // OPERATOR << FOR OUTPUT
    friend ostream& operator<<(ostream &out, const String &s) {
        out << s.str;
        return out;
    }

    // DESTRUCTOR
    ~String() {
        delete[] str;
    }
};

int main() {

    String s1, s2, s3;

    // TASK 1: INPUT TWO STRINGS USING YOUR CLASS
    cout << "Enter first string: ";
    cin >> s1;

    cout << "Enter second string: ";
    cin >> s2;

    // TASK 2: CONCATENATE USING s3 = s1 + s2
    s3 = s1 + s2;

    // TASK 3: PRINT ALL THREE STRINGS
    cout << "\nFirst string: " << s1 << endl;
    cout << "Second string: " << s2 << endl;
    cout << "Concatenated string: " << s3 << endl;

    // TASK 4: DEMONSTRATE MEMORY HANDLING (DEEP COPY)
    // Copy constructor creates a separate memory allocation for each object.
    // Assignment operator also allocates new memory before copying data.
    // This prevents multiple objects from sharing the same memory (avoids shallow copy).

    return 0;
}
