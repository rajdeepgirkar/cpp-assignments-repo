import java.util.Scanner;

class BankAccount {
    int accountNumber;
    String name;
    double balance;

    // Default constructor
    public BankAccount() {
        this.accountNumber = 0;
        this.name = "Unknown";
        this.balance = 0.0;
        System.out.println("Default constructor called.");
    }

    // Parameterized constructor
    public BankAccount(int accountNumber, String name, double balance) {
        this.accountNumber = accountNumber;
        this.name = name;
        this.balance = balance;
        System.out.println("Parameterized constructor called for " + name);
    }

    public void displayDetails() {
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Name: " + name);
        System.out.println("Balance: Rs. " + balance);
        System.out.println("-------------------------");
    }
}

public class BankAccountSystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Bank Account System ---");
        
        // Creating object using default constructor
        System.out.println("\nCreating account with default constructor...");
        BankAccount acc1 = new BankAccount();
        acc1.displayDetails();
        
        System.out.print("How many additional parameterized accounts do you want to create? ");
        int n = scanner.nextInt();
        scanner.nextLine();
        
        for (int i = 0; i < n; i++) {
            System.out.println("\nEnter details for Account " + (i + 1) + ":");
            System.out.print("Enter Account Number: ");
            int accNo = scanner.nextInt();
            scanner.nextLine();
            System.out.print("Enter Name: ");
            String name = scanner.nextLine();
            System.out.print("Enter Balance: ");
            double bal = scanner.nextDouble();
            scanner.nextLine();
            
            BankAccount acc = new BankAccount(accNo, name, bal);
            acc.displayDetails();
        }
        
        scanner.close();
    }
}
