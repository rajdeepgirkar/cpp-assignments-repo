#include <iostream>
using namespace std;

class Matrix {
private:
    int rows, cols;
    int **data;

public:

    // PARAMETERIZED CONSTRUCTOR WITH DYNAMIC 2D ALLOCATION
    Matrix(int r, int c) {
        rows = r;
        cols = c;

        data = new int*[rows];
        for(int i = 0; i < rows; i++) {
            data[i] = new int[cols];
        }
    }

    // OPERATOR >> TO INPUT MATRIX
    friend istream& operator>>(istream &in, Matrix &m) {
        for(int i = 0; i < m.rows; i++) {
            for(int j = 0; j < m.cols; j++) {
                in >> m.data[i][j];
            }
        }
        return in;
    }

    // OPERATOR << TO DISPLAY MATRIX
    friend ostream& operator<<(ostream &out, Matrix &m) {
        for(int i = 0; i < m.rows; i++) {
            for(int j = 0; j < m.cols; j++) {
                out << m.data[i][j] << " ";
            }
            out << endl;
        }
        return out;
    }

    // OPERATOR + FOR MATRIX ADDITION
    Matrix operator+(Matrix &m) {
        Matrix temp(rows, cols);

        for(int i = 0; i < rows; i++) {
            for(int j = 0; j < cols; j++) {
                temp.data[i][j] = data[i][j] + m.data[i][j];
            }
        }
        return temp;
    }

    // OPERATOR == TO CHECK MATRIX EQUALITY
    bool operator==(Matrix &m) {
        for(int i = 0; i < rows; i++) {
            for(int j = 0; j < cols; j++) {
                if(data[i][j] != m.data[i][j]) {
                    return false;
                }
            }
        }
        return true;
    }

    // DESTRUCTOR TO DEALLOCATE MEMORY (task 4)
    ~Matrix() {
        for(int i = 0; i < rows; i++) {
            delete[] data[i];
        }
        delete[] data;
    }
};

int main() {

    int r, c;

    cout << "Enter rows and columns: ";
    cin >> r >> c;

    Matrix m1(r, c), m2(r, c);

    // TASK 1: CREATE TWO MATRICES USING cin >> m1 >> m2
    cout << "Enter elements of Matrix 1:\n";
    cin >> m1;

    cout << "Enter elements of Matrix 2:\n";
    cin >> m2;

    // TASK 2: ADD MATRICES m3 = m1 + m2
    Matrix m3 = m1 + m2;

    cout << "\nMatrix 1:\n" << m1;
    cout << "\nMatrix 2:\n" << m2;
    cout << "\nMatrix Addition Result:\n" << m3;

    // TASK 3: COMPARE MATRICES USING if(m1 == m2)
    if(m1 == m2)
        cout << "\nMatrices are Equal\n";
    else
        cout << "\nMatrices are Not Equal\n";

    // TASK 4: DEALLOCATE MEMORY IN DESTRUCTOR
    // Destructor automatically frees dynamically allocated memory
    // when objects go out of scope.

    return 0;
}
