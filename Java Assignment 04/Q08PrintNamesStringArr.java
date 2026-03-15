import java.util.Scanner;

public class Q08PrintNamesStringArr {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String names[] = new String[4];
        System.out.println("Enter 4 names: ");

        for (int i = 0; i < names.length; i++) {
            names[i] = sc.next();
        }

        System.out.println("\n");
        for (String name : names) {
            System.out.println(name);
        }
    }
}
