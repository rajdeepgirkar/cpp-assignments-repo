public class Q30StringPool {
    public static void main(String[] args) {
        
        String str1 = new String("hello");
        String str2 = str1.intern();
        String str3 = "hello";

        System.out.println(str1);
        System.out.println(str2);
        System.out.println(str3);

        boolean status = str2.equals(str3);
        // boolean status = str3.equals(str2);
        System.out.println("Is str2 and str3 pointing to the same object? " + status);
    }
}
