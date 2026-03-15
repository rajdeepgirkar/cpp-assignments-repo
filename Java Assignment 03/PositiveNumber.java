import java.util.Scanner;

public class PositiveNumber {
    
    public static void askForPositiveNumber() {
        Scanner sc = new Scanner(System.in);
        
        int i;
        do { 
            System.out.println("Enter a positive number: ");
            i = sc.nextInt();
        } while (i <= 0 );

        System.out.println("You entered a positive number: " + i);
    }

    public static void main(String[] args) {
        askForPositiveNumber();
    }
}
