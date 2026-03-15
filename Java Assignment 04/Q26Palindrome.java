import java.util.Scanner;

public class Q26Palindrome {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a string: ");
        String word = sc.nextLine();

        String palindrome = word.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
        String reverse = "";
        for (int i = palindrome.length() - 1; i >= 0; i--) {
            reverse = reverse + palindrome.charAt(i);
        }

        if (palindrome.equals(reverse)) {
            System.out.println("The string '" + word + "' is a palindrome.");
        } else {
            System.out.println("The string '" + word + "' is not a palindrome.");
        }
    }
}
