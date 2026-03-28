import java.util.*;

public class Q5_next_prev_character {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a character: ");
        char ch = sc.next().charAt(0);
        sc.close();

        char next = (char) (ch + 1);
        char prev = (char) (ch - 1);

        System.out.println("Next character: " + next);
        System.out.println("Previous character: " + prev);
    }
}
