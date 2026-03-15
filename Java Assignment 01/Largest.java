public class Largest {
    public static void main(String[]args){
        int a = 25;
        int b = 7;
        int c = 14;
        
        if(a > b && a > c){
            System.out.println("largest = " + a);
        }

        else if(b > a && b > c){
            System.out.println("largest = " + b);
        }

        else{
            System.out.println("largest = " + c);
        }

    }
}
