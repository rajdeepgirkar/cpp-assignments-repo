public class Q34_prime_no {
    public static void main(String[] args) {

        int num;
        System.out.println("Prime numbers from 1 to 100: ");

        for (num = 1; num <= 100; num++) {
            if (num <= 1) {
                continue;
            }
            boolean prime = true;
            for (int i = 2; i * i <= num; i++) {
                if (num % i == 0) {
                    prime = false;
                    break;
                }
            }

            if (prime) {
                System.out.println(num);
            }
        }
    }
}
