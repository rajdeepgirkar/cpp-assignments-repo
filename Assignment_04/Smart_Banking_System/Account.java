package Smart_Banking_System;

public abstract class Account implements BankService {
    protected int accountNumber;
    protected String accountHolderName;
    protected double balance;

    public Account(int accountNumber, String accountHolderName, String balanceString) throws NumberFormatException {
        this.accountNumber = accountNumber;
        this.accountHolderName = accountHolderName;
        this.balance = Double.parseDouble(balanceString);
    }

    public abstract void displayAccountDetails();

    @Override
    public void deposit(double amount) throws Exception {
        if (amount < 0) {
            throw new Exception("Negative deposit is not allowed.");
        }
        this.balance += amount;
        System.out.println("Successfully deposited ₹" + amount);
    }

    public void deposit(double amount, double bonus) throws Exception {
        if (amount < 0 || bonus < 0) {
            throw new Exception("Negative deposit/bonus is not allowed.");
        }
        this.balance += (amount + bonus);
        System.out.println("Successfully deposited ₹" + amount + " with bonus ₹" + bonus);
    }

    @Override
    public void withdraw(double amount) throws Exception {
        if (amount < 0) {
            throw new Exception("Negative withdrawal is not allowed.");
        }
        if (amount > this.balance) {
            throw new Exception("Withdrawal amount exceeds current balance.");
        }
        this.balance -= amount;
        System.out.println("Successfully withdrew ₹" + amount);
    }

    public String generateAccountSummary() {
        StringBuilder summary = new StringBuilder();
        summary.append("\n--- Account Summary ---\n");
        summary.append("Account Holder: ").append(accountHolderName).append("\n");
        summary.append("Account Number: ").append(accountNumber).append("\n");
        summary.append("Current Balance: ₹").append(balance).append("\n");
        summary.append("-----------------------\n");
        return summary.toString();
    }
}
