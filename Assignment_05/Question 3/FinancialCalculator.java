import java.util.List;
import java.util.Arrays;

public class FinancialCalculator {

    public static <T extends Number> void calculateStats(List<T> numbers) {
        if (numbers == null || numbers.isEmpty()) {
            System.out.println("No data provided.");
            return;
        }
        
        double sum = 0.0;
        for (T num : numbers) {
            sum += num.doubleValue();
        }
        double avg = sum / numbers.size();
        
        System.out.println("Data: " + numbers);
        System.out.println("Sum: " + sum);
        System.out.println("Average: " + avg);
        System.out.println();
    }

    public static void main(String[] args) {
        List<Integer> integerTransactions = Arrays.asList(100, 200, 300, 400);
        System.out.println("Integer Transactions:");
        calculateStats(integerTransactions);
        
        List<Double> doubleSalaries = Arrays.asList(55000.50, 60000.75, 45000.00);
        System.out.println("Double Salaries:");
        calculateStats(doubleSalaries);
    }
}
