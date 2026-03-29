import java.util.Scanner;

public class Q27_marks {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int m1, m2, m3, m4, m5;

        System.out.println("Enter marks of 5 subjects");
        System.out.print("1] C++ :  ");
        m1 = sc.nextInt();
        System.out.print("2] DBT :  ");
        m2 = sc.nextInt();
        System.out.print("3] OOP Java :  ");
        m3 = sc.nextInt();
        System.out.print("4] DSA Java :  ");
        m4 = sc.nextInt();
        System.out.print("5] Web Tech :  ");
        m5 = sc.nextInt();

        int total = m1 + m2 + m3 + m4 + m5;
        double percentage = total / 5.0;

        char grade;

        if (percentage >= 75)
            grade = 'A';
        else if (percentage >= 60)
            grade = 'B';
        else if (percentage >= 40)
            grade = 'C';
        else
            grade = 'F';

        System.out.println("Total = " + total);
        System.out.println("Percentage = " + percentage);
        System.out.println("Grade = " + grade);

        sc.close();
    }
}
