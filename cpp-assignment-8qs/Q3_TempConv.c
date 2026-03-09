#include <stdio.h>

float celsiusToFahrenheit(float c);
float fahrenheitToCelsius(float f);

int main() {
    float celsius = 1;
    float fahrenheit = 33.8;

    float convertedF = celsiusToFahrenheit(celsius);
    float convertedC = fahrenheitToCelsius(fahrenheit);

    printf("Celsius to Fahrenheit:\n");
    printf("%.2f deg C = %.2f deg F\n\n", celsius, convertedF);

    printf("Fahrenheit to Celsius:\n");
    printf("%.2f deg F = %.2f deg C\n", fahrenheit, convertedC);

    return 0;
}

float celsiusToFahrenheit(float c) {
    float f;
    f = (c * 9.0 / 5.0) + 32.0;
    return f;
}

float fahrenheitToCelsius(float f) {
    float c;
    c = (f - 32.0) * 5.0 / 9.0;
    return c;
}
