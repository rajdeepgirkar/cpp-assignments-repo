import java.util.Scanner;

public class Q25VowelCount {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter a string: ");
        String word = sc.nextLine();

        int count = 0;
        for (int i = 0; i < word.length(); i++) {
            char vowel = word.charAt(i);
            if (vowel == 'a' || vowel == 'e' || vowel == 'i' || vowel == 'o' || vowel == 'u'
                || vowel == 'A' || vowel == 'E' || vowel == 'I' || vowel == 'O' || vowel == 'U'
            ) {
                count++;
            }
        }
        System.out.println("The number of vowels in '" + word + "' is: " + count);
    }
}
