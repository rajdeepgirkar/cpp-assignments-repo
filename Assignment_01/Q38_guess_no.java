import java.util.Random;
import java.util.Scanner;

public class Q38_guess_no {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();

        int target = rand.nextInt(10); // number between 0-9
        int guess;

        System.out.println("Guess a number between 0 and 9:");

        do {
            guess = sc.nextInt();

            if (guess < target) {
                System.out.println("Too low!");
            } 
            else if (guess > target) {
                System.out.println("Too high!");
            } 
            else {
                System.out.println("Correct!");
            }

        } while (guess != target);

        sc.close();
    }
}
