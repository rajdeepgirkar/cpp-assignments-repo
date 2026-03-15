import java.util.Scanner;

public class Bonus {
    public static void main(String[] args) {
            
        Scanner sc = new Scanner(System.in);
        int n;

        do {
            System.out.println("Enter a number from 1 to 5");
            System.out.println("Problem 1: Grade Evaluation System");
            System.out.println("Problem 2: Leap Year Check");
            System.out.println("Problem 3: Day of the week");
            System.out.println("Problem 4: Identify Default Values of Variables ");
            System.out.println("Case 5: Exit");
            n = sc.nextInt();

            switch (n) {
                case 1:
                    Grade.main(args);
                    break;
                case 2:
                    LeapYear.main(args);
                    break;
                case 3:
                    Days.main(args);
                    break;
                case 4:
                    UninitializedVar.main(args);
                    break;
                case 5:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid case.");;
            }
        }while (true);
    }
}
