package com.ptithcm.quanlybanxe.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Getter
@Setter
@Embeddable
public class CartDetail_ID implements Serializable {
    @Column(name = "product_id")
    String productID;
    @Column(name = "cart_id")
    Integer cartID;
}
