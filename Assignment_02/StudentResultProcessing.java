import java.util.Scanner;

/**
 * Q2: Student Result Processing System
 * Manages a student's marks in 5 subjects.
 * Calculates total, average, percentage.
 * Assigns grades and determines promotion status.
 * Grade Criteria:
 *   90 and above -> A
 *   75 to 89     -> B
 *   60 to 74     -> C
 *   40 to 59     -> D
 *   Below 40     -> Fail
 */
public class StudentResultProcessing {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Accept student details
        System.out.print("Enter Student Name: ");
        String studentName = scanner.nextLine();

        System.out.print("Enter Roll Number: ");
        String rollNumber = scanner.nextLine();

        // Array to store marks in 5 subjects
        int[] marks = new int[5];
        String[] subjects = {"Mathematics", "Science", "English", "Hindi", "Computer"};

        // Accept marks for each subject
        System.out.println("\nEnter marks for 5 subjects (out of 100):");
        for (int i = 0; i < 5; i++) {
            System.out.print("  " + subjects[i] + ": ");
            marks[i] = scanner.nextInt();
        }

        // Calculate total marks
        int totalMarks = 0;
        for (int mark : marks) {
            totalMarks += mark;
        }

        // Calculate average and percentage
        double average = totalMarks / 5.0;
        double percentage = (totalMarks / 500.0) * 100;

        // Determine grade based on percentage
        String grade;
        if (percentage >= 90) {
            grade = "A";
        } else if (percentage >= 75) {
            grade = "B";
        } else if (percentage >= 60) {
            grade = "C";
        } else if (percentage >= 40) {
            grade = "D";
        } else {
            grade = "Fail";
        }

        // Check if student is promoted (must pass i.e. percentage >= 40)
        String promotionStatus = grade.equals("Fail") ? "NOT PROMOTED" : "PROMOTED";

        // Display result in a user-friendly format
        System.out.println("\n============================================");
        System.out.println("          STUDENT RESULT CARD               ");
        System.out.println("============================================");
        System.out.println("Student Name  : " + studentName);
        System.out.println("Roll Number   : " + rollNumber);
        System.out.println("--------------------------------------------");
        for (int i = 0; i < 5; i++) {
            System.out.printf("%-14s: %d%n", subjects[i], marks[i]);
        }
        System.out.println("--------------------------------------------");
        System.out.println("Total Marks   : " + totalMarks + " / 500");
        System.out.printf("Average       : %.2f%n", average);
        System.out.printf("Percentage    : %.2f%%%n", percentage);
        System.out.println("Grade         : " + grade);
        System.out.println("Status        : " + promotionStatus);
        System.out.println("============================================");

        scanner.close();
    }
}
