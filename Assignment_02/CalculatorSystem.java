import java.util.Scanner;

public class CalculatorSystem {
    
    // Method to calculate sum of two integers
    public int calculate(int a, int b) {
        return a + b;
    }
    
    // Method to calculate sum of two doubles
    public double calculate(double a, double b) {
        return a + b;
    }
    
    // Method to calculate sum of three integers
    public int calculate(int a, int b, int c) {
        return a + b + c;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        CalculatorSystem calc = new CalculatorSystem();
        
        System.out.println("--- Calculator System (Method Overloading) ---");
        
        System.out.print("Enter first integer: ");
        int num1 = scanner.nextInt();
        System.out.print("Enter second integer: ");
        int num2 = scanner.nextInt();
        
        System.out.print("Enter first double: ");
        double d1 = scanner.nextDouble();
        System.out.print("Enter second double: ");
        double d2 = scanner.nextDouble();
        
        System.out.print("Enter three integers separated by space: ");
        int a1 = scanner.nextInt();
        int a2 = scanner.nextInt();
        int a3 = scanner.nextInt();
        
        // Calling overloaded methods
        int sumInt = calc.calculate(num1, num2);
        double sumDouble = calc.calculate(d1, d2);
        int sumThreeInts = calc.calculate(a1, a2, a3);
        
        // Displaying results
        System.out.println("\nResult of calculate(int, int) with " + num1 + " and " + num2 + ": " + sumInt);
        System.out.println("Result of calculate(double, double) with " + d1 + " and " + d2 + ": " + sumDouble);
        System.out.println("Result of calculate(int, int, int) with " + a1 + ", " + a2 + ", and " + a3 + ": " + sumThreeInts);
        
        scanner.close();
    }
}
