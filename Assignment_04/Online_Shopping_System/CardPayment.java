package Online_Shopping_System;

public class CardPayment implements Payment {
    @Override
    public void pay(double amount) {
        System.out.println("Processing Credit/Debit Card Payment of ₹" + amount + "...");
        System.out.println("Card Payment Successful.");
    }

    @Override
    public void refund(double amount) {
        System.out.println("Refunding ₹" + amount + " to Card.");
    }
}
