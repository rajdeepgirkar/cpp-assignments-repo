class Electronics {
    String name;
    public Electronics(String name) { this.name = name; }
    @Override public String toString() { return "Electronics: " + name; }
}

class Clothing {
    String name;
    public Clothing(String name) { this.name = name; }
    @Override public String toString() { return "Clothing: " + name; }
}

class Inventory<T> {
    private T product;
    
    public void addProduct(T product) {
        this.product = product;
    }
    
    public T getProduct() {
        return product;
    }
    
    public void displayProduct() {
        if (product != null) {
            System.out.println("Stored Product: " + product.toString());
        } else {
            System.out.println("Inventory is empty.");
        }
    }
}

public class InventorySystem {
    public static void main(String[] args) {
        System.out.println("=== Testing Electronics Inventory ===");
        Inventory<Electronics> eleInv = new Inventory<>();
        eleInv.addProduct(new Electronics("Smartphone"));
        eleInv.displayProduct();
        
        System.out.println("\n=== Testing Clothing Inventory ===");
        Inventory<Clothing> cloInv = new Inventory<>();
        cloInv.addProduct(new Clothing("T-Shirt"));
        cloInv.displayProduct();
    }
}
