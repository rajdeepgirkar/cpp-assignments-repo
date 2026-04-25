import java.util.List;
import java.util.Arrays;

public class ReportGenerator {
    
    public static <T> void generateReport(List<T> dataSet) {
        System.out.println("--- Report ---");
        for (T data : dataSet) {
            System.out.println(data);
        }
        System.out.println("--------------\n");
    }

    public static void main(String[] args) {
        List<Double> sales = Arrays.asList(450.50, 1200.00, 320.75);
        List<String> employees = Arrays.asList("Alice", "Bob", "Charlie");
        List<Integer> productIds = Arrays.asList(101, 102, 103);
        
        System.out.println("Sales Report:");
        generateReport(sales);
        
        System.out.println("Employee Report:");
        generateReport(employees);
        
        System.out.println("Product ID Report:");
        generateReport(productIds);
    }
}
