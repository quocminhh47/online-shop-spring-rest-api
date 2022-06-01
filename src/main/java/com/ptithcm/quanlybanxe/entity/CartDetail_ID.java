package com.ptithcm.quanlybanxe.entity;


import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class CartDetail_ID implements Serializable {
    @Column(name = "product_id")
    String productID;
    @Column(name = "cart_id")
    Integer cartID;

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public Integer getCartID() {
        return cartID;
    }

    public void setCartID(Integer cartID) {
        this.cartID = cartID;
    }
}
