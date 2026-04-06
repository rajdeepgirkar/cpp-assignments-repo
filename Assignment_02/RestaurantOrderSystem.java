import java.util.Scanner;

public class RestaurantOrderSystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double totalAmount = 0;
        int choice;
        boolean ordering = true;
        
        System.out.println("--- Welcome to the Restaurant ---");
        
        while (ordering) {
            System.out.println("\n--- Menu ---");
            System.out.println("1. Pizza - Rs. 250");
            System.out.println("2. Burger - Rs. 100");
            System.out.println("3. Pasta - Rs. 150");
            System.out.println("4. Sandwich - Rs. 80");
            System.out.println("5. Coffee - Rs. 50");
            System.out.println("6. Finish Order");
            System.out.print("Enter your choice (1-6): ");
            
            choice = scanner.nextInt();
            
            switch (choice) {
                case 1:
                    System.out.println("Added Pizza to your order.");
                    totalAmount += 250;
                    break;
                case 2:
                    System.out.println("Added Burger to your order.");
                    totalAmount += 100;
                    break;
                case 3:
                    System.out.println("Added Pasta to your order.");
                    totalAmount += 150;
                    break;
                case 4:
                    System.out.println("Added Sandwich to your order.");
                    totalAmount += 80;
                    break;
                case 5:
                    System.out.println("Added Coffee to your order.");
                    totalAmount += 50;
                    break;
                case 6:
                    ordering = false;
                    System.out.println("Finishing order...");
                    break;
                default:
                    System.out.println("Invalid choice! Please select a valid menu item.");
            }
        }
        
        if (totalAmount > 0) {
            System.out.println("\n--- Final Bill ---");
            System.out.println("Subtotal: Rs. " + totalAmount);
            
            // Add 5% GST
            double gst = totalAmount * 0.05;
            double finalAmount = totalAmount + gst;
            
            System.out.println("GST (5%): Rs. " + gst);
            System.out.println("Total Amount Payable: Rs. " + finalAmount);
        } else {
            System.out.println("\nYou didn't order anything.");
        }
        
        System.out.println("Thank you for eating with us!");
        
        scanner.close();
    }
}
