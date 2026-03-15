public class Q31MulStringLiteral {
    public static void main(String[] args) {
        
        String str1 = "java";
        String str2 = "java";
        String str3 = "java";

        boolean status = (str1.equals(str2) && str2.equals(str3));
        System.out.println("All stings point to the same object: " + status);
    }
}
