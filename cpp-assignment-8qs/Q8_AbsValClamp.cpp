#include <iostream>
using namespace std;

int absolute(int n) {
    return (n < 0) ? -n : n;
}

int clamp(int val, int lo, int hi) {
    return (val < lo) ? lo : (val > hi) ? hi : val;
}

int main() {

    int val[] = {-15, 0, 25, -3};
    int lo[]  = {-10, -10, -10, 0};
    int hi[]  = {10, 10, 10, 5};

    cout << "val \tlo \thi \tabsolute(val) \tclamp(val,lo,hi)\n";

    for(int i = 0; i < 4; i++) {
        cout << val[i] << " \t" << lo[i] << " \t" << hi[i] << "\t" << absolute(val[i]) << "\t\t" << clamp(val[i], lo[i], hi[i]) << "\n";
    }

    return 0;
}