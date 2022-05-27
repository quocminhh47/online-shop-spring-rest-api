package com.ptithcm.quanlybanxe.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
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
}