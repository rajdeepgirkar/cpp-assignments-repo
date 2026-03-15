import java.util.Arrays;
import java.util.Scanner;

public class Q12SortArrAsc {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int arr[] = new int[5];
        System.out.println("Enter 5 integers: ");
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
        }

        Arrays.sort(arr);
        System.out.println("Sorted array: ");
        for (int temp : arr) {
            System.out.println(temp + " ");
        }
    }
}
