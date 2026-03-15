import java.util.Scanner;

public class Age {
    
    public static void checkAgeCategory(int age) {

        if (age < 18){
            System.out.println("You are a minor.");
        }
        else if (age >= 18 && age < 60){
            System.out.println("You are an adult.");
        }
        else if (age >= 60){
            System.out.println("You are a senior citizen.");
        }
        else{
            System.out.println("Invalid age.");
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter your age: ");
        int n = sc.nextInt();

        checkAgeCategory(n);

    }
}
