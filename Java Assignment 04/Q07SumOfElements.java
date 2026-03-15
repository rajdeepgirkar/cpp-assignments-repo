import java.util.Scanner;

public class Q07SumOfElements {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int arr[] = new int[5];
        System.out.println("Enter 5 integers: ");
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
        }

        int sum = 0;
        for (int temp : arr) {
            sum = sum + temp;
        }
        System.out.println("The sum of all numbers is: "+ sum);
    }
}
