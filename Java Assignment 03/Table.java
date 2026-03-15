import java.util.Scanner;

public class Table {

    public static void printMultiplicationTable(int n) {
        int result;
        for (int i = 1; i <= 10; i++) {
            result = n*i;
            System.out.println(n + " x " + i + " = " + result);
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int num = sc.nextInt();
        printMultiplicationTable(num);
    }
}
 