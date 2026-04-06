package Online_Shopping_System;

public class Order {
    private String customerName;
    private Product[] products;

    public Order(String customerName, Product[] products) {
        this.customerName = customerName;
        this.products = products;
    }

    public double calculateTotal() {
        double total = 0;
        for (Product product : products) {
            total += product.getNumericPrice();
        }
        return total;
    }

    public double calculateTotal(double discountPercentage) {
        double total = calculateTotal();
        return total - (total * (discountPercentage / 100.0));
    }

    public String generateBill(double finalAmount) {
        StringBuilder bill = new StringBuilder();
        bill.append("\n--- BILL RECEIPT ---\n");
        bill.append("Customer Name: ").append(customerName).append("\n");
        bill.append("Products:\n");
        for (Product product : products) {
            bill.append(" - ").append(product.getProductName())
                    .append(" (ID: ").append(product.getProductId())
                    .append(") : ₹").append(product.getNumericPrice()).append("\n");
        }
        bill.append("Total Amount to Pay: ₹").append(finalAmount).append("\n");
        bill.append("--------------------\n");
        return bill.toString();
    }
}
