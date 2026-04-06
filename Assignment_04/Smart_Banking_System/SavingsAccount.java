package Smart_Banking_System;

public class SavingsAccount extends Account {

    public SavingsAccount(int accountNumber, String accountHolderName, String balanceString)
            throws NumberFormatException {
        super(accountNumber, accountHolderName, balanceString);
    }

    @Override
    public void displayAccountDetails() {
        System.out.println("Account Type: Savings Account");
        System.out.println("Account Holder: " + accountHolderName);
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Balance: ₹" + balance);
    }
}
