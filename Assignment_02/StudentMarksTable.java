import java.util.Scanner;

public class StudentMarksTable {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Student Marks Table ---");
        
        // 2D Array: 3 students, 3 subjects
        int[][] marks = new int[3][3];
        
        System.out.println("Enter marks for 3 subjects for each student:");
        for(int i = 0; i < 3; i++) {
            System.out.println("\nStudent " + (i+1) + ":");
            for(int j = 0; j < 3; j++) {
                System.out.print("Enter marks for Subject " + (j+1) + ": ");
                marks[i][j] = scanner.nextInt();
            }
        }
        
        System.out.println("\nStudent\tSub1\tSub2\tSub3\tTotal\tAverage");
        System.out.println("-------------------------------------------------------");
        
        for (int i = 0; i < marks.length; i++) {
            System.out.print("Std " + (i + 1) + "\t");
            int total = 0;
            
            for (int j = 0; j < marks[i].length; j++) {
                System.out.print(marks[i][j] + "\t");
                total += marks[i][j];
            }
            
            double average = (double) total / marks[i].length;
            System.out.printf("%d\t%.2f\n", total, average);
        }
        
        scanner.close();
    }
}
