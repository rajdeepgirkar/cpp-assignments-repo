import java.util.Scanner;

/**
 * Q1: Electricity Bill Calculator
 * Calculates household electricity bill based on slab rates.
 * Slab Rates:
 *   First 100 units  -> Rs. 5 per unit
 *   Next 100 units   -> Rs. 7 per unit
 *   Above 200 units  -> Rs. 10 per unit
 * A 5% surcharge is applied if the bill exceeds Rs. 1500.
 */
public class ElectricityBillCalculator {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Accept customer details
        System.out.print("Enter Customer Name: ");
        String customerName = scanner.nextLine();

        System.out.print("Enter Consumer Number: ");
        String consumerNumber = scanner.nextLine();

        System.out.print("Enter Units Consumed: ");
        int unitsConsumed = scanner.nextInt();

        // Calculate bill using slab rates
        double billAmount = 0.0;

        if (unitsConsumed <= 100) {
            // All units fall in the first slab (Rs. 5/unit)
            billAmount = unitsConsumed * 5;
        } else if (unitsConsumed <= 200) {
            // First 100 units at Rs. 5, remaining at Rs. 7
            billAmount = (100 * 5) + ((unitsConsumed - 100) * 7);
        } else {
            // First 100 at Rs. 5, next 100 at Rs. 7, rest at Rs. 10
            billAmount = (100 * 5) + (100 * 7) + ((unitsConsumed - 200) * 10);
        }

        // Apply 5% surcharge if bill exceeds Rs. 1500
        double surcharge = 0.0;
        if (billAmount > 1500) {
            surcharge = billAmount * 0.05;
        }

        // Calculate total amount payable
        double totalAmount = billAmount + surcharge;

        // Display complete bill details in a formatted manner
        System.out.println("\n============================================");
        System.out.println("         ELECTRICITY BILL DETAILS           ");
        System.out.println("============================================");
        System.out.println("Customer Name    : " + customerName);
        System.out.println("Consumer Number  : " + consumerNumber);
        System.out.println("Units Consumed   : " + unitsConsumed);
        System.out.println("--------------------------------------------");
        System.out.printf("Bill Amount      : Rs. %.2f%n", billAmount);
        System.out.printf("Surcharge (5%%)   : Rs. %.2f%n", surcharge);
        System.out.println("--------------------------------------------");
        System.out.printf("Total Payable    : Rs. %.2f%n", totalAmount);
        System.out.println("============================================");

        scanner.close();
    }
}
