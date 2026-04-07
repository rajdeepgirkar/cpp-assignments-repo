import java.util.Scanner;

class Student {
    String name;
    int rollNo;
    static int totalStudents = 0; // Static variable to keep track of total students

    public Student(String name, int rollNo) {
        this.name = name;
        this.rollNo = rollNo;
        totalStudents++; // Increment counter when object is created
    }

    // Static method to display the total student count
    public static void displayTotalStudents() {
        System.out.println("Total number of students: " + totalStudents);
    }
}

public class StudentCounter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Student Counter System ---");
        
        // Display initial count
        Student.displayTotalStudents();
        
        System.out.print("How many students do you want to create? ");
        int num = scanner.nextInt();
        scanner.nextLine(); // consume newline
        
        System.out.println("Creating student objects...\n");
        
        for (int i = 0; i < num; i++) {
            System.out.print("Enter name for student " + (i + 1) + ": ");
            String name = scanner.nextLine();
            System.out.print("Enter roll no for student " + (i + 1) + ": ");
            int rollNo = scanner.nextInt();
            scanner.nextLine(); // consume newline
            
            new Student(name, rollNo); // Creating student object
            
            // Display count after creating each object
            Student.displayTotalStudents();
            System.out.println();
        }
        
        scanner.close();
    }
}
