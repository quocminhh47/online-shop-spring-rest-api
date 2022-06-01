package com.ptithcm.quanlybanxe.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class BillDetail_ID implements Serializable {
    @Column(name="bill_id")
    Integer bill_ID;
    @Column(name = "product_id")
    String product_ID;

    public Integer getBill_ID() {
        return bill_ID;
    }

    public void setBill_ID(Integer bill_ID) {
        this.bill_ID = bill_ID;
    }

    public String getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(String product_ID) {
        this.product_ID = product_ID;
    }
}
