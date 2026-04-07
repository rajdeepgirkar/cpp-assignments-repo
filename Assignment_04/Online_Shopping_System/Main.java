package Online_Shopping_System;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        try {
            System.out.print("Enter Customer Name: ");
            String customerName = scanner.nextLine();

            System.out.print("Enter number of products: ");
            int productCount = Integer.parseInt(scanner.nextLine());

            if (productCount <= 0) {
                throw new Exception("Product count must be greater than zero.");
            }

            Product[] products = new Product[productCount];
            for (int i = 0; i < productCount; i++) {
                System.out.println("\nEntering details for Product " + (i + 1) + ":");
                System.out.print("Enter Product ID: ");
                int productId = Integer.parseInt(scanner.nextLine());

                System.out.print("Enter Product Name: ");
                String productName = scanner.nextLine();

                System.out.print("Enter Product Price: ");
                String price = scanner.nextLine();

                Product product = new Product(productId, productName, price);
                product.getNumericPrice(); // validates if it can be parsed
                products[i] = product;
            }

            Order order = new Order(customerName, products);

            System.out.print("\nDo you have a discount percentage? (Enter 0 if none): ");
            double discount = Double.parseDouble(scanner.nextLine());

            double finalAmount;
            if (discount > 0) {
                finalAmount = order.calculateTotal(discount);
            } else {
                finalAmount = order.calculateTotal();
            }

            System.out.println("\nSelect Payment Method:\n1. UPI\n2. Card");
            System.out.print("Enter your choice (1 or 2): ");
            int paymentChoice = Integer.parseInt(scanner.nextLine());

            Payment paymentMethod;
            if (paymentChoice == 1) {
                paymentMethod = new UPIPayment();
            } else if (paymentChoice == 2) {
                paymentMethod = new CardPayment();
            } else {
                throw new Exception("Invalid payment option selected.");
            }

            String bill = order.generateBill(finalAmount);
            System.out.println(bill);

            paymentMethod.pay(finalAmount);

        } catch (NumberFormatException e) {
            System.out.println("Error: Invalid numeric input provided. " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            scanner.close();
        }
    }
}
