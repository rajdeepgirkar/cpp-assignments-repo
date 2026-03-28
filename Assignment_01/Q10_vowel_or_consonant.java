import java.util.*;

public class Q10_vowel_or_consonant {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a character: ");
        char ch = sc.next().charAt(0);

        // ch = Character.toLowerCase(ch);

        if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) {
            if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u'
                || ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U') {
                    System.out.println(ch + " is a Vowel");
            } 
            else {
                System.out.println(ch + " is a Consonant");
            }
        } 
        else {
            System.out.println("Invalid input");
        }

        sc.close();
    }
}
