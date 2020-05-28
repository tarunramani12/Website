package tarunwebsite.shopInfo;

public class Item {
    
    int varientId, merchId;
    String merchName, imagePath, varientDescription;
    double price;
    public Item() {
    }

    public Item (int varientId, int merchId, String merchName, String varientDescription, double price, String imagePath) {
        this.merchId = merchId;
        this.varientId = varientId;
        this.merchName = merchName;
        this.imagePath = imagePath;
        this.price = price;
        this.varientDescription = varientDescription;
    }
    
    public void setMerchId (int merchId) {
        this.merchId = merchId;
    }
    public int getMerchId() {
        return merchId;
    }

    public void setVarientDescriiption (String varientDescription) {
        this.varientDescription = varientDescription;
    }
    public String getVarientDescription() {
        return varientDescription;
    }

    public void setVarientId (int varientId) {
        this.varientId = varientId;
    }
    public int getVarientId() {
        return varientId;
    }

    public void setMerchName (String merchName) {
        this.merchName = merchName;
    }
    public String getMerchName() {
        return merchName;
    }

    public void setImagePath (String imagePath) {
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


    public boolean equals(Object o) {
        if (o instanceof Item) {
            return (((Item)o).varientId == varientId);
        }
        return false;
    }
}