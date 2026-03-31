import java.util.Scanner;

public class Q36_lcm {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a number: ");
        int a = sc.nextInt();
        System.out.println("Enter a number: ");
        int b = sc.nextInt();

        int gcd = a, tempB = b;

        // Find GCD using Euclidean algorithm
        while (tempB != 0) {
            int temp = tempB;
            tempB = gcd % tempB;
            gcd = temp;
        }

        int lcm = (a * b) / gcd;

        System.out.println("LCM = " + lcm);
        sc.close();
    }
}
