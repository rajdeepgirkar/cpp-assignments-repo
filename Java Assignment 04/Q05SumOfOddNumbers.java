import java.util.Scanner;

public class Q05SumOfOddNumbers {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a number: ");
        int n = sc.nextInt();

        int sum = 0;
        for (int i = 1; i <= n; i++) {
            if (i % 2 != 0) {
                System.out.println(i);
                sum = sum + i;
            }
        }
        System.out.println("The sum of odd numbers from 1 to " + n + " is: " + sum);

    }
}
