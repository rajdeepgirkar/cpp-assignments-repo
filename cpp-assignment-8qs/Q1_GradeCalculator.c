// Grade
#include <stdio.h>
#include <stdlib.h>

int main() {
    float java = 65;
    float c = 65;
    float cpp = 65;
    float total;
    float avg;
    char *grade;
    
    printf("Marks in Java = %.2f\n", java);
    printf("Marks in C = %.2f\n", c);
    printf("Marks in Cpp = %.2f\n", cpp);

    total = java + c + cpp;
    printf("Total = %.2f\n", total);
    
    avg = total / 3;
    printf("Percentage (avg) = %.2f %%\n", avg);

    grade = (avg >= 75 && avg <= 100) ? "A" :
            (avg >= 60 && avg < 75) ? "B" :
            (avg >= 45 && avg < 60) ? "C" :
            (avg < 45) ? "Fail": "Invalid case";
    
    printf("Grade = %s\n", grade);

    return 0;
}
