import java.util.Scanner;

public class Q25_swap_wo_var {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("a = ");
        int a = sc.nextInt();
        System.out.print("b = ");
        int b = sc.nextInt();

        a = a + b;
        b = a - b;
        a = a - b;

        System.out.println("Swap values: ");
        System.out.println("a = " + a + ", b = " + b);
        sc.close();
    }
}
