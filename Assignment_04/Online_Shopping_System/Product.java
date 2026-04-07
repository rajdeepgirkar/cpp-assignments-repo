package Online_Shopping_System;

public class Product {
    private int productId;
    private String productName;
    private String price;

    public Product(int productId, String productName, String price) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
    }

    public double getNumericPrice() throws NumberFormatException {
        return Double.parseDouble(price);
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getPriceString() {
        return price;
    }
}
