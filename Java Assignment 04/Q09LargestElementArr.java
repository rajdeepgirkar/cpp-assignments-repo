import java.util.Arrays;
import java.util.Scanner;

public class Q09LargestElementArr {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int arr[] = new int[5];
        System.out.println("Enter 5 integers: ");
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
        }

        Arrays.sort(arr);
        int largest = arr[arr.length -1];
        System.out.println("The largest element is: " + largest);
    }
}
