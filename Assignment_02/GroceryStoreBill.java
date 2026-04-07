import java.util.Scanner;

/**
 * Q4: Grocery Store Bill Generator
 * Creates a billing system for a small grocery shop.
 * Accepts multiple items with name, quantity, and price.
 * Stores item totals in arrays and applies 10% discount if bill > Rs. 3000.
 */
public class GroceryStoreBill {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Ask how many items to bill
        System.out.print("Enter the number of items: ");
        int numberOfItems = scanner.nextInt();
        scanner.nextLine(); // consume newline

        // Arrays to store item details
        String[] itemNames = new String[numberOfItems];
        int[] quantities = new int[numberOfItems];
        double[] prices = new double[numberOfItems];
        double[] itemTotals = new double[numberOfItems]; // stores quantity * price per item

        // Accept details for each item
        for (int i = 0; i < numberOfItems; i++) {
            System.out.println("\n--- Item " + (i + 1) + " ---");
            System.out.print("Enter Item Name: ");
            itemNames[i] = scanner.nextLine();

            System.out.print("Enter Quantity: ");
            quantities[i] = scanner.nextInt();

            System.out.print("Enter Price per unit (Rs.): ");
            prices[i] = scanner.nextDouble();
            scanner.nextLine(); // consume newline

            // Calculate total for this item
            itemTotals[i] = quantities[i] * prices[i];
        }

        // Calculate total bill amount by summing all item totals
        double totalBill = 0.0;
        for (double itemTotal : itemTotals) {
            totalBill += itemTotal;
        }

        // Apply 10% discount if total bill exceeds Rs. 3000
        double discount = 0.0;
        if (totalBill > 3000) {
            discount = totalBill * 0.10;
        }

        // Final payable amount after discount
        double finalAmount = totalBill - discount;

        // Print the bill in a formatted manner
        System.out.println("\n=====================================================================");
        System.out.println("                    GROCERY STORE BILL                               ");
        System.out.println("=====================================================================");
        System.out.printf("%-20s %-10s %-15s %-15s%n", "Item", "Qty", "Price/Unit", "Total");
        System.out.println("---------------------------------------------------------------------");

        for (int i = 0; i < numberOfItems; i++) {
            System.out.printf("%-20s %-10d Rs. %-12.2f Rs. %-12.2f%n",
                    itemNames[i], quantities[i], prices[i], itemTotals[i]);
        }

        System.out.println("---------------------------------------------------------------------");
        System.out.printf("%-47s Rs. %.2f%n", "Sub Total:", totalBill);
        System.out.printf("%-47s Rs. %.2f%n", "Discount (10% above Rs.3000):", discount);
        System.out.println("---------------------------------------------------------------------");
        System.out.printf("%-47s Rs. %.2f%n", "Total Payable:", finalAmount);
        System.out.println("=====================================================================");

        scanner.close();
    }
}
