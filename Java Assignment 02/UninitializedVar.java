public class UninitializedVar {
    public static void main(String[] args) { 
        byte a = 0;
        short b = 12;
        int c = 123;
        long d = 1234567890123456789l;
        float e = 12.34f;
        double f = 12.34567;
        char g = 'G'; 
        Boolean h = true;

        System.out.println("byte a: " + a);
        System.out.println("short b: " + b);
        System.out.println("int c: " + c);
        System.out.println("long d: " + d);
        System.out.println("float e: " + e);
        System.out.println("double f: " + f);
        System.out.println("char g: " + g);
        System.out.println("boolean h: " + h);
    }
}
