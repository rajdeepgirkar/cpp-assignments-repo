import java.util.Scanner;

public class Q30_table_loop {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number: ");
        int num = sc.nextInt();

        int i = 1;

        while (true) {
            System.out.println(num + " x " + i + " = " + (num * i));
            i++;
        }
    }
}
