import java.util.Scanner;

public class Q04PrintEvenNo {
    
    public static void printEvenNumbers(int n) {
        
        int i = 1;

        while(i <= n){
            if(i % 2 == 0){
                System.out.println(i);
            }
            i++;
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int a;
        System.out.println("Enter a number: ");
        a = sc.nextInt();

        printEvenNumbers(a);
    }
}
