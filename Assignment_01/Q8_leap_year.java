import java.util.Scanner;

public class Q8_leap_year {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter valid year: ");
        int year = sc.nextInt();
        sc.close();

        if((year % 4 == 0) && (year % 100 != 0)){
            System.out.println(year + " is a leap year.");
        }
        else{
            System.out.println(year + " is not a leap year.");
        }
    }
}
