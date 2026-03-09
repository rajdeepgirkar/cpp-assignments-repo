#include <iostream>
using namespace std;

void doubleIt(int &n) {
    n = n * 2;
    cout << "Inside doubleIt: " << n << endl;
}

int main() {
    int num = 7;
    doubleIt(num);
    cout << "In main after call: " << num << endl;
    return 0;
}