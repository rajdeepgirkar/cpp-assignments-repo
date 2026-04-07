import java.util.Scanner;

public class ExpressionEvaluator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Expression Evaluator ---");
        
        System.out.print("Enter number a: ");
        int a = scanner.nextInt();
        
        System.out.print("Enter number b: ");
        int b = scanner.nextInt();
        
        System.out.print("Enter number c: ");
        int c = scanner.nextInt();
        
        System.out.println("\n--- Evaluation Results ---");
        
        // 1. (a + b) * c
        int result1 = (a + b) * c;
        System.out.println("1. (a + b) * c");
        System.out.println("   Calculation: (" + a + " + " + b + ") * " + c);
        System.out.println("   Result: " + result1);
        System.out.println("   Explanation: Parentheses execute first (addition), followed by multiplication.");
        
        // 2. a > b && b > c
        boolean result2 = (a > b) && (b > c);
        System.out.println("\n2. a > b && b > c");
        System.out.println("   Evaluation: " + a + " > " + b + " && " + b + " > " + c);
        System.out.println("   Result: " + result2);
        System.out.println("   Explanation: Logical AND (&&) returns true only if BOTH relational expressions are true.");
        
        // 3. a % b
        System.out.println("\n3. a % b");
        if (b != 0) {
            int result3 = a % b;
            System.out.println("   Calculation: " + a + " % " + b);
            System.out.println("   Result: " + result3);
            System.out.println("   Explanation: Modulo operator (%) returns the remainder of a divided by b.");
        } else {
            System.out.println("   Cannot perform modulo operation because b is 0.");
        }
        
        scanner.close();
    }
}
