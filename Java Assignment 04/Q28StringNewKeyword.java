public class Q28StringNewKeyword {
    public static void main(String[] args) {

        String str1 = new String("hello");
        String str2 = new String("hello");

        boolean equalOperator = (str1 == str2);
        boolean equalMethod = str1.equals(str2);
        
        System.out.println("Using == : " + equalOperator);
        System.out.println("Using .equals(): " + equalMethod );
    }
}
