package com.ptithcm.quanlybanxe.entity;

import javax.persistence.*;
@Entity
@Table(name = "Cart_Detail")
public class CartDetail {
    @EmbeddedId
    CartDetail_ID id;
    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "price")
    private Integer price;

    @Column(name = "actived")
    private Boolean actived;

    @ManyToOne
    @MapsId("cartID")
    @JoinColumn(name = "cart_id")
    Cart cart;

    @ManyToOne
    @MapsId("productID")
    @JoinColumn(name = "product_id")
    Product product;

    public CartDetail_ID getId() {
        return id;
    }

    public void setId(CartDetail_ID id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Boolean getActived() {
        return actived;
    }

    public void setActived(Boolean actived) {
        this.actived = actived;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}