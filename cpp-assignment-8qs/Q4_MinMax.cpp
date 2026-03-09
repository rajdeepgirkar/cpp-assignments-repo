#include <iostream>
using namespace std;

void findMinMax(int a, int b, int c, int &minVal, int &maxVal);

int main() {
    int lo, hi;
    int n1 = 12;
    int n2 = 56;
    int n3 = 2;

    findMinMax(n1, n2, n3, lo, hi);

    cout << "Numbers: " << n1 << ", " << n2 << ", " << n3 << endl;
    cout << "\nMinimum value = " << lo << endl;
    cout << "\nMaximum value = " << hi << endl;

    cout << "\nAfter function call, lo = " << lo << " and hi = " << hi << endl;

    return 0;
}

void findMinMax(int a, int b, int c, int &minVal, int &maxVal){
    minVal = a;
    maxVal = a;
    
    if (b < minVal) minVal = b;
    if (b > maxVal) maxVal = b;
    
    if (c < minVal) minVal = c;
    if (c > maxVal) maxVal = c;
}