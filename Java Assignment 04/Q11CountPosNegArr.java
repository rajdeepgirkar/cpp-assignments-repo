import java.util.Scanner;

public class Q11CountPosNegArr {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int arr[] = new int[6];
        int positive = 0;
        int negative = 0;

        System.out.println("Enter 6 integers: ");
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
        }

        for (int temp : arr) {
            if (temp > 0) {
                positive++;
            } else if (temp < 0) {
                negative++;
            }
        }

        System.out.println("Positive numbers: " + positive);
        System.out.println("Negative numbers: " + negative);
    }
}
