import java.util.Arrays;
import java.util.Scanner;

public class Q14SearchIndex {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int arr[] = new int[5];
        System.out.println("Enter 5 integers:\n");
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
        }

        Arrays.sort(arr);
        System.out.println("Enter the number to search: ");
        int search = sc.nextInt();
        System.out.println("Sorted array: ");
        for (int temp : arr) {
            System.out.println(temp + " ");
        }

        int index = Arrays.binarySearch(arr, search);
        if (index >= 0) {
            System.out.println("\nThe number " + search + " is found at index " + index);
        } else {
            System.out.println("Not Found");
        }
    }
}
