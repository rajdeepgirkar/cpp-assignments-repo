import java.util.Scanner;

public class SumOfNumbers {
    
    public static void calculateSum(int n) {
        int sum = 0;
        for (int i = 0; i <= n ; i++) {
            sum = sum + i;
        }
        System.out.println("The sum of numbers from 1 to " + n + " is: " + sum);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int num = sc.nextInt();
        calculateSum(num);
    }
}
