#include <iostream>
using namespace std;

// CUSTOM EXCEPTION CLASS
class DivideByZero {};

// FUNCTION WITH EXCEPTION SPECIFICATION
int divide(int a, int b) throw(DivideByZero)
{
    if (b == 0)
        throw DivideByZero();

    return a / b;
}

int main()
{
    int num, den;

    cout << "Enter numerator: ";
    cin >> num;

    cout << "Enter denominator: ";
    cin >> den;

    try
    {
        try
        {
            int result = divide(num, den);
            cout << "Result: " << result << endl;
        }

        // INNER CATCH
        catch (DivideByZero)
        {
            cout << "Inside inner catch" << endl;

            // RETHROW EXCEPTION
            throw;
        }
    }

    // OUTER CATCH
    catch (DivideByZero)
    {
        cout << "Handled in outer catch" << endl;
    }

    return 0;
}

/*
Run this in terminal
g++ Q4_Division.cpp -std=c++14
./Q4_Division.exe
*/