package tarunwebsite.shopInfo;

import java.io.*;
import java.util.*;

public class CartItem {

    Item item;
    int quantity, cartId;

    public CartItem() {
    }

    public CartItem(Item item, int quantity, int cartId) {
        this.item = item;
        this.quantity = quantity;
        this.cartId = cartId;
    }

    public boolean equals(Object o) {
            return (((CartItem)o).cartId == cartId);
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public int getQuantity() {
        return quantity;
    }

    public void setItem(Item item) {
        this.item = item;
    }
    public Item getItem() {
        return item;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    public int getCartId() {
        return cartId;
    }
}