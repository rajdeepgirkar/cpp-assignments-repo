public class Q27StringLiteral {
    public static void main(String[] args) {

        String str1 = "hello";
        String str2 = "hello";

        boolean status = (str1 == str2);
        System.out.println("String 1: " + str1);
        System.out.println("String 2: " + str2);
        System.out.println("Both variables point to the same object: " + status);
    }
}
