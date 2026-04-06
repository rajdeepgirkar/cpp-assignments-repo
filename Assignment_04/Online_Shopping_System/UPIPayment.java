package Online_Shopping_System;

public class UPIPayment implements Payment {
    @Override
    public void pay(double amount) {
        System.out.println("Processing UPI Payment of ₹" + amount + "...");
        System.out.println("UPI Payment Successful.");
    }

    @Override
    public void refund(double amount) {
        System.out.println("Refunding ₹" + amount + " to UPI ID.");
    }
}
