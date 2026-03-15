import java.util.Scanner;

public class Q10AvgElementArr {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int arr[] = new int[5];
        double sum = 0;
        System.out.println("Enter 5 integers: ");
        for (int i = 0; i < arr.length; i++) {
            arr[i] = sc.nextInt();
            sum = sum + arr[i];
        }

        double avg = sum / 5;
        System.out.println("The average of the numbers is: " + avg);
    }
}
