package com.ptithcm.quanlybanxe.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "Bill")
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private  Integer ID;

    //Đã duyệt hay chưa duyệt
    @Column(name = "status")
    private Integer status;

    //Lấy ngày giờ hiện tại
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "discount_total")
    private Integer discountTotal;

    @Column(name = "price_total")
    private Integer priceTotal;

    @JsonIgnore
    @OneToMany(mappedBy = "bill")
    Set<BillDetail> billDetails;

    @ManyToOne
    @JoinColumn(name = "user_id")
//    @JsonIgnore
    private Users user;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getDiscountTotal() {
        return discountTotal;
    }

    public void setDiscountTotal(Integer discountTotal) {
        this.discountTotal = discountTotal;
    }

    public Integer getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(Integer priceTotal) {
        this.priceTotal = priceTotal;
    }

    public Set<BillDetail> getBillDetails() {
        return billDetails;
    }

    public void setBillDetails(Set<BillDetail> billDetails) {
        this.billDetails = billDetails;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
}
