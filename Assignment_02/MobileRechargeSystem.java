import java.util.Scanner;

/**
 * Q7: Mobile Recharge System
 * Recharge application for prepaid mobile users.
 * Shows available recharge plans using switch-case.
 * Plans:
 *   Rs. 199 -> 28 days validity
 *   Rs. 399 -> 56 days validity
 *   Rs. 599 -> 84 days validity
 */
public class MobileRechargeSystem {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Accept mobile number from user
        System.out.print("Enter Mobile Number: ");
        String mobileNumber = scanner.nextLine();

        // Display available recharge plans
        System.out.println("\n============================================");
        System.out.println("      MOBILE RECHARGE PLANS                 ");
        System.out.println("============================================");
        System.out.println("1. Rs. 199 -> 28 days validity");
        System.out.println("2. Rs. 399 -> 56 days validity");
        System.out.println("3. Rs. 599 -> 84 days validity");
        System.out.println("============================================");

        System.out.print("Select a plan (1/2/3): ");
        int planChoice = scanner.nextInt();

        // Variables to store selected plan details
        int rechargeAmount = 0;
        int validityDays = 0;
        String planName = "";

        // Determine plan details using switch-case
        switch (planChoice) {
            case 1:
                rechargeAmount = 199;
                validityDays = 28;
                planName = "Basic Plan";
                break;
            case 2:
                rechargeAmount = 399;
                validityDays = 56;
                planName = "Standard Plan";
                break;
            case 3:
                rechargeAmount = 599;
                validityDays = 84;
                planName = "Premium Plan";
                break;
            default:
                // Handle invalid plan selection
                System.out.println("Invalid plan selection! Please choose 1, 2, or 3.");
                scanner.close();
                return;
        }

        // Print recharge confirmation with plan details
        System.out.println("\n============================================");
        System.out.println("       RECHARGE CONFIRMATION                ");
        System.out.println("============================================");
        System.out.println("Mobile Number    : " + mobileNumber);
        System.out.println("Plan Selected    : " + planName);
        System.out.println("Recharge Amount  : Rs. " + rechargeAmount);
        System.out.println("Validity         : " + validityDays + " days");
        System.out.println("--------------------------------------------");
        System.out.println("Recharge Successful! Thank you.");
        System.out.println("============================================");

        scanner.close();
    }
}
