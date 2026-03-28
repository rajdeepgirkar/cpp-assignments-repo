import java.util.*;

public class Q6_pos_neg_zero {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number: ");
        int num = sc.nextInt();
        sc.close();

        if (num > 0) {
            System.out.println("The number is Positive");
        } else if (num < 0) {
            System.out.println("The number is Negative");
        } else if (num == 0) {
            System.out.println("The number is Zero");
        }
        else {
            System.out.println("Invalid input!");
        }
        
    }
}
