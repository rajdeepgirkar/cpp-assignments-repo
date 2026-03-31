import java.util.Scanner;

public class Q29_menu_driven {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\nMenu driven program");
            System.out.println("1. Add");
            System.out.println("2. Subtract");
            System.out.println("3. Exit");
            System.out.print("Enter your choice: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    {
                        System.out.println("\nAddition");
                        System.out.println("Enter a number: ");
                        int a = sc.nextInt();
                        System.out.println("Enter a number: ");
                        int b = sc.nextInt();
                        System.out.println("Sum = " + (a + b));
                        break;
                    }
                case 2:
                    {
                        System.out.println("\nSubtraction");
                        System.out.println("Enter a number: ");
                        int a = sc.nextInt();
                        System.out.println("Enter a number: ");
                        int b = sc.nextInt();
                        System.out.println("Difference = " + (a - b));
                        break;
                    }
                case 3:
                    System.out.println("Exiting...");
                    break;
                default:
                    System.out.println("Invalid choice!");
                    break;
            }

        } while (choice != 3);

        sc.close();
    }
}
