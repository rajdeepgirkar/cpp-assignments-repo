import java.util.Scanner;

/**
 * Q3: ATM Simulation
 * Simulates a simple ATM system with menu-driven operations.
 * Features: Check Balance, Deposit Money, Withdraw Money, Exit.
 * Uses switch-case for menu and loop for continuous operation.
 */
public class ATMSimulation {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Initial balance for the ATM account
        double balance = 5000.00;
        int choice;

        System.out.println("============================================");
        System.out.println("        WELCOME TO ATM SIMULATION           ");
        System.out.println("============================================");

        // Loop to keep showing the menu until user chooses Exit
        do {
            // Display ATM menu
            System.out.println("\n--- ATM Menu ---");
            System.out.println("1. Check Balance");
            System.out.println("2. Deposit Money");
            System.out.println("3. Withdraw Money");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            // Process user's choice using switch-case
            switch (choice) {
                case 1:
                    // Display current balance
                    System.out.printf("\nYour Current Balance: Rs. %.2f%n", balance);
                    break;

                case 2:
                    // Deposit money into the account
                    System.out.print("Enter amount to deposit: Rs. ");
                    double depositAmount = scanner.nextDouble();

                    // Validate deposit amount
                    if (depositAmount > 0) {
                        balance += depositAmount;
                        System.out.printf("Rs. %.2f deposited successfully.%n", depositAmount);
                        System.out.printf("Updated Balance: Rs. %.2f%n", balance);
                    } else {
                        System.out.println("Invalid amount! Please enter a positive value.");
                    }
                    break;

                case 3:
                    // Withdraw money from the account
                    System.out.print("Enter amount to withdraw: Rs. ");
                    double withdrawAmount = scanner.nextDouble();

                    // Check for sufficient balance before withdrawal
                    if (withdrawAmount <= 0) {
                        System.out.println("Invalid amount! Please enter a positive value.");
                    } else if (withdrawAmount > balance) {
                        System.out.println("Insufficient Balance! Transaction Failed.");
                        System.out.printf("Available Balance: Rs. %.2f%n", balance);
                    } else {
                        balance -= withdrawAmount;
                        System.out.printf("Rs. %.2f withdrawn successfully.%n", withdrawAmount);
                        System.out.printf("Remaining Balance: Rs. %.2f%n", balance);
                    }
                    break;

                case 4:
                    // Exit the ATM
                    System.out.println("\nThank you for using the ATM. Goodbye!");
                    break;

                default:
                    // Handle invalid menu choices
                    System.out.println("Invalid choice! Please select 1-4.");
            }

        } while (choice != 4); // Continue until user selects Exit

        scanner.close();
    }
}
