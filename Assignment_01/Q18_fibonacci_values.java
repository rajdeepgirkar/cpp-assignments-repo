import java.util.*;

public class Q18_fibonacci_values {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter the maximum value: ");
        int limit = sc.nextInt();

        int a = 0, b = 1;

        System.out.println("Fibonacci Series up to " + limit + ":");

        while (a <= limit) {
            System.out.print(a + " ");

            int next = a + b;
            a = b;
            b = next;
        }

        sc.close();
    }
}
