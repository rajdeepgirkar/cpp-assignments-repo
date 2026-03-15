import java.util.Scanner;

public class Sum {

    public static int sumOfTwoNumbers(int a, int b) {
        int sum = a + b;
        return sum;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Enter first number: ");
        int c = sc.nextInt();

        System.out.print("Enter second second: ");
        int d = sc.nextInt();

        int result = sumOfTwoNumbers(c, d);

        System.out.println("Sum of " + c + " and " + d + " is " + result);
    }
}
