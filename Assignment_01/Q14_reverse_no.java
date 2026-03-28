import java.util.*;

public class Q14_reverse_no {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number: ");
        int num = sc.nextInt();

        int reverse = 0;
        while (num != 0) {
            int digit = num % 10;        // get last digit
            reverse = reverse * 10 + digit;
            num = num / 10;              // remove last digit
        }

        System.out.println("Reversed number: " + reverse);
        sc.close();
    }
}
