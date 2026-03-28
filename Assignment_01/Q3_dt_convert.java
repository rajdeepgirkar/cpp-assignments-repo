public class Q3_dt_convert {
    public static void main(String[] args) {

        int i = 21;
        double d = 131.75;

        // int to double is implicit casting
        double int_to_double = i;

        // double to int is explicit casting
        int double_to_int = (int) d;

        System.out.println("Original int value = " + i);
        System.out.println("Original double value = " + d);
        System.out.println("int to double = " + int_to_double);         // .0 will be added 
        System.out.println("double to int = " + double_to_int);         // .75 will be removed

    }
}
