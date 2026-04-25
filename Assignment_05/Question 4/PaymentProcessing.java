import java.util.List;
import java.util.ArrayList;

class Payment {
    int paymentId;
    double amount;
    
    public Payment(int paymentId, double amount) {
        this.paymentId = paymentId;
        this.amount = amount;
    }
    
    public void displayPayment() {
        System.out.println("Payment ID: " + paymentId + ", Amount: $" + amount);
    }
}

class CreditCardPayment extends Payment {
    public CreditCardPayment(int paymentId, double amount) {
        super(paymentId, amount);
    }
    
    @Override
    public void displayPayment() {
        System.out.println("[Credit Card] Payment ID: " + paymentId + ", Amount: $" + amount);
    }
}

class UPIPayment extends Payment {
    public UPIPayment(int paymentId, double amount) {
        super(paymentId, amount);
    }
    
    @Override
    public void displayPayment() {
        System.out.println("[UPI] Payment ID: " + paymentId + ", Amount: $" + amount);
    }
}

public class PaymentProcessing {

    // Generic Method Using Wildcard
    public static void displayAllPayments(List<? extends Payment> payments) {
        for (Payment p : payments) {
            p.displayPayment();
        }
    }

    public static void main(String[] args) {
        List<CreditCardPayment> ccPayments = new ArrayList<>();
        ccPayments.add(new CreditCardPayment(1001, 250.00));
        ccPayments.add(new CreditCardPayment(1002, 120.50));
        
        List<UPIPayment> upiPayments = new ArrayList<>();
        upiPayments.add(new UPIPayment(2001, 50.00));
        upiPayments.add(new UPIPayment(2002, 15.75));
        upiPayments.add(new UPIPayment(2003, 300.25));
        
        System.out.println("=== Credit Card Payments ===");
        displayAllPayments(ccPayments);
        
        System.out.println("\n=== UPI Payments ===");
        displayAllPayments(upiPayments);
    }
}
