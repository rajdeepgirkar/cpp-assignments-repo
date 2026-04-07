import java.util.Scanner;

/**
 * Q6: Bus Ticket Booking System
 * Simulates a bus with 10 seats using an array.
 * Menu-driven: View Available Seats, Book a Seat, Cancel a Seat, Exit.
 * Prevents double booking of already booked seats.
 */
public class BusTicketBooking {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Array to represent 10 seats; false = available, true = booked
        boolean[] seats = new boolean[10];
        int choice;

        System.out.println("============================================");
        System.out.println("       BUS TICKET BOOKING SYSTEM            ");
        System.out.println("============================================");

        // Loop to keep showing the menu until user chooses Exit
        do {
            System.out.println("\n--- Booking Menu ---");
            System.out.println("1. View Available Seats");
            System.out.println("2. Book a Seat");
            System.out.println("3. Cancel a Seat");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    // Display seat availability status
                    System.out.println("\nSeat Status:");
                    System.out.println("--------------------------------------------");
                    for (int i = 0; i < seats.length; i++) {
                        String status = seats[i] ? "BOOKED" : "AVAILABLE";
                        System.out.printf("  Seat %2d : [%s]%n", (i + 1), status);
                    }
                    System.out.println("--------------------------------------------");
                    break;

                case 2:
                    // Book a seat
                    System.out.print("Enter seat number to book (1-10): ");
                    int bookSeat = scanner.nextInt();

                    // Validate seat number range
                    if (bookSeat < 1 || bookSeat > 10) {
                        System.out.println("Invalid seat number! Please enter 1-10.");
                    } else if (seats[bookSeat - 1]) {
                        // Prevent double booking
                        System.out.println("Seat " + bookSeat + " is already booked! Choose another seat.");
                    } else {
                        seats[bookSeat - 1] = true;
                        System.out.println("Seat " + bookSeat + " booked successfully!");
                    }
                    break;

                case 3:
                    // Cancel a booked seat
                    System.out.print("Enter seat number to cancel (1-10): ");
                    int cancelSeat = scanner.nextInt();

                    // Validate seat number range
                    if (cancelSeat < 1 || cancelSeat > 10) {
                        System.out.println("Invalid seat number! Please enter 1-10.");
                    } else if (!seats[cancelSeat - 1]) {
                        // Cannot cancel a seat that is not booked
                        System.out.println("Seat " + cancelSeat + " is not booked. Nothing to cancel.");
                    } else {
                        seats[cancelSeat - 1] = false;
                        System.out.println("Seat " + cancelSeat + " cancelled successfully!");
                    }
                    break;

                case 4:
                    System.out.println("\nThank you for using the Bus Booking System. Goodbye!");
                    break;

                default:
                    System.out.println("Invalid choice! Please select 1-4.");
            }

        } while (choice != 4);

        scanner.close();
    }
}
