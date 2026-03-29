import java.util.Scanner;

public class Q28_vote {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int age;
        System.out.print("Enter your age: ");
        age = sc.nextInt();

        if (age >= 18){
            System.out.println("You are " + age + " years old, you can vote.");
        }
        else {
            System.out.println("Your age is below 18, you can't vote");
        }
    }
}
