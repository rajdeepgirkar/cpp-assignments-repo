public class Grade {
    public static void main(String[] args) {
        int maths = 85;
        int science= 75;
        int history = 65;
        int avg;

        avg = (maths + science + history)/3;
        
        System.out.println("Marks in Maths = " + maths);
        System.out.println("Marks in Science = " + science);
        System.out.println("Marks in History = " + history);
        System.out.println("Average Marks = " + avg);

        if(avg >= 90 && avg <= 100){
            System.out.println("Grade A");
        }
        else if(avg >= 70 && avg < 90){
            System.out.println("Grade B");
        }
        else if(avg >= 50 && avg < 70){
            System.out.println("Grade C");
        }
        else if(avg >= 30 && avg < 50){
            System.out.println("Grade D");
        }
        else if(avg < 30){
            System.out.println("Failed");
        }
        else{
            System.out.println("Invalid Grade");
        }
    }
}
