import java.util.Scanner;

class Patient {
    int patientId;
    String patientName;
    int age;
    String disease;

    // Constructor to initialize patient details
    public Patient(int patientId, String patientName, int age, String disease) {
        this.patientId = patientId;
        this.patientName = patientName;
        this.age = age;
        this.disease = disease;
    }

    // Method to display patient details
    public void displayDetails() {
        System.out.println("Patient ID: " + patientId);
        System.out.println("Name: " + patientName);
        System.out.println("Age: " + age);
        System.out.println("Disease: " + disease);
        System.out.println("Senior Citizen: " + (isSeniorCitizen() ? "Yes" : "No"));
        System.out.println("--------------------");
    }

    // Method to check if patient is 60 or older
    public boolean isSeniorCitizen() {
        return age >= 60;
    }
}

public class PatientRecordSystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("--- Hospital Patient Record System ---");
        System.out.println();
        
        Patient[] patients = new Patient[3];
        
        // Creating objects for at least 3 patients
        for (int i = 0; i < 3; i++) {
            System.out.println("Enter details for Patient " + (i + 1) + ":");
            System.out.print("ID: ");
            int id = scanner.nextInt();
            scanner.nextLine(); // consume newline
            System.out.print("Name: ");
            String name = scanner.nextLine();
            System.out.print("Age: ");
            int age = scanner.nextInt();
            scanner.nextLine(); // consume newline
            System.out.print("Disease: ");
            String disease = scanner.nextLine();
            
            patients[i] = new Patient(id, name, age, disease);
            System.out.println();
        }

        // Displaying patient details
        System.out.println("Patient Details:");
        System.out.println("--------------------");
        for (Patient p : patients) {
            p.displayDetails();
        }
        
        scanner.close();
    }
}
