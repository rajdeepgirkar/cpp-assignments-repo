import java.util.Scanner;

public class SalaryConversion {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Salary Conversion System ---");
        
        System.out.print("Enter your salary (e.g., 45000.7589): ");
        double salary = scanner.nextDouble();
        
        System.out.println("\nOriginal Salary (double): " + salary);
        
        // Explicit casting from double to int (Narrowing)
        // Causes loss of fractional part
        int salaryInt = (int) salary;
        System.out.println("\nConverted to int (Explicit): " + salaryInt);
        System.out.println("Precision loss (double - int): " + (salary - salaryInt));
        
        // In Java, double to float is also a narrowing conversion and requires explicit casting.
        float salaryFloatExplicit = (float) salary;
        System.out.println("\nConverted directly to float (Explicit): " + salaryFloatExplicit);
        System.out.println("Precision loss (double - float): " + (salary - salaryFloatExplicit));
        
        // int to float is an implicit (widening) conversion.
        float salaryFloatImplicit = salaryInt; // implicit casting from int to float
        System.out.println("\nConverted to float from int (Implicit): " + salaryFloatImplicit);
        
        scanner.close();
    }
}
