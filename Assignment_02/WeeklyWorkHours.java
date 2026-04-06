import java.util.Scanner;

public class WeeklyWorkHours {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Weekly Work Hours (Jagged Array) ---");
        
        System.out.print("Enter number of employees: ");
        int numEmployees = scanner.nextInt();
        
        int[][] workHours = new int[numEmployees][];
        
        for (int i = 0; i < numEmployees; i++) {
            System.out.print("\nEnter number of days worked by Employee " + (i + 1) + ": ");
            int days = scanner.nextInt();
            workHours[i] = new int[days];
            
            for (int j = 0; j < days; j++) {
                System.out.print("Hours worked on day " + (j + 1) + ": ");
                workHours[i][j] = scanner.nextInt();
            }
        }
        
        System.out.println("\n--- Summary ---");
        for (int i = 0; i < workHours.length; i++) {
            System.out.print("Employee " + (i + 1) + " hours: ");
            int totalHours = 0;
            
            for (int j = 0; j < workHours[i].length; j++) {
                System.out.print(workHours[i][j] + " ");
                totalHours += workHours[i][j];
            }
            System.out.println("| Total: " + totalHours + " hours (over " + workHours[i].length + " days)");
        }
        
        scanner.close();
    }
}
