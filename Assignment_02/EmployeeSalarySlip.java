import java.util.Scanner;

/**
 * Q5: Employee Salary Slip Generator
 * Generates formatted salary slips for employees.
 * Calculations:
 *   HRA = 20% of basic salary
 *   DA  = 10% of basic salary
 *   PF  = 8% of basic salary
 *   Net Salary = Basic + HRA + DA - PF
 */
public class EmployeeSalarySlip {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Accept employee details
        System.out.print("Enter Employee Name: ");
        String employeeName = scanner.nextLine();

        System.out.print("Enter Employee ID: ");
        String employeeId = scanner.nextLine();

        System.out.print("Enter Basic Salary (Rs.): ");
        double basicSalary = scanner.nextDouble();

        // Calculate salary components
        double hra = basicSalary * 0.20;  // House Rent Allowance = 20% of basic
        double da = basicSalary * 0.10;   // Dearness Allowance = 10% of basic
        double pf = basicSalary * 0.08;   // Provident Fund = 8% of basic

        // Calculate gross salary (basic + allowances)
        double grossSalary = basicSalary + hra + da;

        // Calculate net salary (gross - deductions)
        double netSalary = grossSalary - pf;

        // Display formatted salary slip
        System.out.println("\n============================================");
        System.out.println("            EMPLOYEE SALARY SLIP            ");
        System.out.println("============================================");
        System.out.println("Employee Name    : " + employeeName);
        System.out.println("Employee ID      : " + employeeId);
        System.out.println("--------------------------------------------");
        System.out.println("          EARNINGS                          ");
        System.out.println("--------------------------------------------");
        System.out.printf("Basic Salary     : Rs. %.2f%n", basicSalary);
        System.out.printf("HRA (20%%)        : Rs. %.2f%n", hra);
        System.out.printf("DA  (10%%)        : Rs. %.2f%n", da);
        System.out.println("--------------------------------------------");
        System.out.printf("Gross Salary     : Rs. %.2f%n", grossSalary);
        System.out.println("--------------------------------------------");
        System.out.println("          DEDUCTIONS                        ");
        System.out.println("--------------------------------------------");
        System.out.printf("PF   (8%%)        : Rs. %.2f%n", pf);
        System.out.println("--------------------------------------------");
        System.out.printf("NET SALARY       : Rs. %.2f%n", netSalary);
        System.out.println("============================================");

        scanner.close();
    }
}
