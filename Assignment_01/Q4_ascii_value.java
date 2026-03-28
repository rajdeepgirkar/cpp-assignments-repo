import java.util.*;

public class Q4_ascii_value {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a character: ");
        char ch = sc.next().charAt(0);
        sc.close();

        int ascii = (int) ch;

        System.out.println("ASCII Value = " + ascii);
    }
}
