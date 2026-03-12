#include <iostream>
using namespace std;

class TollBooth {
private:
    int totalVehicles;
    double totalRevenue;

public:
    TollBooth() {
        totalVehicles = 0;
        totalRevenue = 0;
    }

    void reset() {
        totalVehicles = 0;
        totalRevenue = 0;
        cout << "Booth statistics reset successfully.\n";
    }

    void vehiclePayingToll(int vehicleType, double tollAmount) {
        totalVehicles++;
        totalRevenue += tollAmount;

        if(vehicleType == 1)
            cout << "Standard Car added. Toll collected: Rs." << tollAmount << endl;
        else if(vehicleType == 2)
            cout << "Truck added. Toll collected: Rs." << tollAmount << endl;
        else if(vehicleType == 3)
            cout << "Bus added. Toll collected: Rs." << tollAmount << endl;
    }

    int getTotalVehicles() {
        return totalVehicles;
    }

    double getTotalRevenue() {
        return totalRevenue;
    }
};

int main() {
    TollBooth booth;
    int choice;

    const double CAR_TOLL = 180;
    const double TRUCK_TOLL = 300;
    const double BUS_TOLL = 350;

    do {
        cout << "\n--- Toll Booth Menu ---\n";
        cout << "1. Add Standard Car and Collect Toll\n";
        cout << "2. Add Truck and Collect Toll\n";
        cout << "3. Add Bus and Collect Toll\n";
        cout << "4. Display Total Vehicles Passed\n";
        cout << "5. Display Total Revenue Collected\n";
        cout << "6. Reset Booth Statistics\n";
        cout << "7. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch(choice) {
            case 1:
                booth.vehiclePayingToll(1, CAR_TOLL);
                break;

            case 2:
                booth.vehiclePayingToll(2, TRUCK_TOLL);
                break;

            case 3:
                booth.vehiclePayingToll(3, BUS_TOLL);
                break;

            case 4:
                cout << "Total Vehicles Passed: " << booth.getTotalVehicles() << endl;
                break;

            case 5:
                cout << "Total Revenue Collected: Rs." << booth.getTotalRevenue() << endl;
                break;

            case 6:
                booth.reset();
                break;

            case 7:
                cout << "Exiting program...\n";
                break;

            default:
                cout << "Invalid choice!\n";
        }

    } while(choice != 7);

    return 0;
}
