import java.util.Scanner;

public class Q24_large_digit {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number: ");
        int num = sc.nextInt();

        int maxDigit = 0;

        num = Math.abs(num);       // handles negative numbers

        while (num > 0) {
            int digit = num % 10;   // get last digit
            if (digit > maxDigit) {
                maxDigit = digit;
            }
            num = num / 10;   // remove last digit
        }

        System.out.println("Largest digit = " + maxDigit);
        sc.close();
    }
}
