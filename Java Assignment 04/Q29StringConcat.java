public class Q29StringConcat {
    public static void main(String[] args) {
        
        String str1 = "hello";
        String str2 = "world";
        String str3 = str1 + str2;

        boolean status = str3.equals(str1);
        // boolean status = (str3 == str1);

        System.out.println(str3);
        System.out.println("Is str3 pointingto the same object as str1? " + status);
    }
}
