import java.util.*;

public class Q9_calculator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter first number: ");
        double n1 = sc.nextDouble();

        System.out.print("Enter second number: ");
        double n2 = sc.nextDouble();

        System.out.print("Enter operator (+, -, *, /): ");
        char op = sc.next().charAt(0);

        double result;

        switch (op) {
            case '+':
                result = n1 + n2;
                System.out.println("Result: " + result);
                break;

            case '-':
                result = n1 - n2;
                System.out.println("Result: " + result);
                break;

            case '*':
                result = n1 * n2;
                System.out.println("Result: " + result);
                break;

            case '/':
                if (n2 != 0) {
                    result = n1 / n2;
                    System.out.println("Result: " + result);
                } else {
                    System.out.println("zero is not divisible");
                }
                break;

            default:
                System.out.println("Invalid operator");
        }

        sc.close();
    }
}
