package tarunwebsite.shopInfo;

import java.util.*;

public class Product {

    String merchName, merchDescription, imagePath;
    int merchId, totalVarients;
    double price;
    Vector<String> images;
    Vector<Varient> varients;

    public Product() {
    }

    public Product(int merchId, String merchName, String merchDescription, String imagePath, double price, int totalVarients, Vector<Varient> varients, Vector<String> images) {
        this.merchId = merchId;
        this.merchName = merchName;
        this.merchDescription = merchDescription;
        this.imagePath = imagePath;
        this.price = price;
        this.totalVarients = totalVarients;
        this.varients = varients;
        this.images = images;
    }

    public boolean equals(Object o) {
        if(o instanceof Product) {
            return(((Product)o).merchId == merchId);
        }
        return false;
    }

    public void setMerchId(int merchId) {
        this.merchId = merchId;
    }
    public int getMerchId() {
        return merchId;
    }

    public void setMerchName(String merchName) {
        this.merchName = merchName;
    }
    public String getMerchName() {
        return merchName;
    }

    public void setMerchDescription(String merchDescription) {
        this.merchDescription = merchDescription;
    }
    public String getMerchDescription() {
        return merchDescription;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    public String getImagePath() {
        return imagePath;
    }

    public void setPrice (double price) {
        this.price = price;
    }
    public double getPrice() {
        return price;
    }

    public void setTotalVarients(int totalVarients) {
        this.totalVarients = totalVarients;
    }
    public int getTotalVarients() {
        return totalVarients;
    }

    public void setVarients(Vector<Varient> varients) {
        this.varients = varients;
    }
    public Vector<Varient> getVarients() {
        return varients;
    }

    public void setImages(Vector<String> images) {
        this.images = images;
    }
    public Vector<String> getImages() {
        return images;
    }
}