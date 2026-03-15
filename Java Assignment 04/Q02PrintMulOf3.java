import java.util.Scanner;

public class Q02PrintMulOf3 {
    
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);
        int n;
        int mul;
        System.out.println("Enter a number: ");
        n = sc.nextInt();

        for (int i = 1; i <= n; i++){
            mul = i * 3;
            if (mul <= n){
                System.out.println(mul);
            }
            
        }
    }
}
