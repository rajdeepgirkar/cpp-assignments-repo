import java.util.Scanner;
import java.util.ArrayList;

class Employee {
    int id;
    String name;
    static int counter = 1000; // Static counter for auto-incrementing ID
    
    public Employee(String name) {
        this.name = name;
        counter++;
        this.id = counter; // Assign auto-incremented ID
    }
    
    public void displayDetails() {
        System.out.println("Employee ID: " + id + "\t| Name: " + name);
    }
}

public class EmployeeIDGenerator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Employee ID Generator ---");
        
        System.out.print("How many employees do you want to create? ");
        int count = scanner.nextInt();
        scanner.nextLine();
        
        ArrayList<Employee> employees = new ArrayList<>();
        
        for (int i = 0; i < count; i++) {
            System.out.print("Enter name for Employee " + (i + 1) + ": ");
            String name = scanner.nextLine();
            employees.add(new Employee(name));
        }
        
        System.out.println("\nEmployee Details:");
        System.out.println("-------------------------");
        for (Employee emp : employees) {
            emp.displayDetails();
        }
        System.out.println("-------------------------");
        
        scanner.close();
    }
}
