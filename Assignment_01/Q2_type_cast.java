public class Q2_type_cast {
    public static void main(String[] args) {
        
        int a = 9;
        double b = 2.5;

        double sum = a + b;
        double div = a / b;
        int type_cast = (int) div;

        System.out.println(a + " + " + b + " = " + sum);
        System.out.println(a + " / " + b + " = " + div);
        System.out.println("Type Casting = " + type_cast);
    }
}
