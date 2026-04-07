package Smart_Banking_System;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        try {
            System.out.println("--- Smart Banking System ---");
            System.out.println("Select Account Type to create:\n1. Savings Account\n2. Current Account");
            System.out.print("Enter choice (1 or 2): ");
            int accountTypeChoice = Integer.parseInt(scanner.nextLine());

            if (accountTypeChoice != 1 && accountTypeChoice != 2) {
                throw new Exception("Invalid account type selected.");
            }

            System.out.print("Enter Account Number: ");
            int accNum = Integer.parseInt(scanner.nextLine());

            System.out.print("Enter Account Holder Name: ");
            String accName = scanner.nextLine();

            System.out.print("Enter Initial Balance: ");
            String accBalance = scanner.nextLine();

            Account account;
            if (accountTypeChoice == 1) {
                account = new SavingsAccount(accNum, accName, accBalance);
            } else {
                account = new CurrentAccount(accNum, accName, accBalance);
            }

            System.out.println("\nAccount Created Successfully!");
            account.displayAccountDetails();

            System.out.print("\nEnter amount to deposit: ");
            double depositAmount = Double.parseDouble(scanner.nextLine());

            System.out.print("Is there a bonus for this deposit? (Enter bonus amount, 0 if none): ");
            double bonusAmount = Double.parseDouble(scanner.nextLine());

            if (bonusAmount > 0) {
                account.deposit(depositAmount, bonusAmount);
            } else {
                account.deposit(depositAmount);
            }

            System.out.print("\nEnter amount to withdraw: ");
            double withdrawAmount = Double.parseDouble(scanner.nextLine());
            account.withdraw(withdrawAmount);

            System.out.println(account.generateAccountSummary());

        } catch (NumberFormatException e) {
            System.out.println("Error: Invalid numeric input provided. " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            scanner.close();
        }
    }
}
