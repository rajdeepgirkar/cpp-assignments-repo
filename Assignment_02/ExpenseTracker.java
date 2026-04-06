import java.util.Scanner;

public class ExpenseTracker {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double[] expenses = new double[7];
        String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
        
        System.out.println("--- Daily Expense Tracker ---");
        
        // Accept expenses for 7 days
        for (int i = 0; i < 7; i++) {
            System.out.print("Enter expense for " + days[i] + ": Rs. ");
            // Use hasNextDouble to avoid exceptions, though simple for assignment
            expenses[i] = scanner.nextDouble();
        }
        
        double total = 0;
        double maxExpense = expenses[0];
        double minExpense = expenses[0];
        int maxDayIndex = 0;
        
        // Calculate total, max, min
        for (int i = 0; i < 7; i++) {
            total += expenses[i];
            if (expenses[i] > maxExpense) {
                maxExpense = expenses[i];
                maxDayIndex = i;
            }
            if (expenses[i] < minExpense) {
                minExpense = expenses[i];
            }
        }
        
        double average = total / 7;
        
        System.out.println("\n--- Expense Summary ---");
        System.out.println("Total Weekly Expense: Rs. " + total);
        System.out.printf("Average Expense: Rs. %.2f\n", average);
        System.out.println("Highest Expense: Rs. " + maxExpense + " (occurred on " + days[maxDayIndex] + ")");
        System.out.println("Lowest Expense: Rs. " + minExpense);
        
        scanner.close();
    }
}
