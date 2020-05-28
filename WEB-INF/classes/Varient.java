package tarunwebsite.shopInfo;

import java.util.*;

public class Varient {

    int varientId, merchId;
    String varientDescription;

    public Varient() {

    }

    public Varient(int varientId, int merchId, String varientDescription) {
        this.varientId = varientId;
        this.merchId = merchId;
        this.varientDescription = varientDescription;
    }

    public boolean equals(Object o) {
        if(o instanceof Varient) {
            return(((Varient)o).varientId == varientId);
        }
        return false;
    }
    
    public void setMerchId(int merchId) {
        this.merchId = merchId;
    }
    public int getMerchId() {
        return merchId;
    }

    public void setVarientId(int varientId) {
        this.varientId = varientId;
    }
    public int getVarientId() {
        return varientId;
    }

    public void setVarientDescription(String varientDescription) {
        this.varientDescription = varientDescription;
    }
    public String getVarientDescription() {
        return varientDescription;
    }
}