package com.ptithcm.quanlybanxe.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;
@Getter
@Setter
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

    //
    @JsonIgnore
    @OneToMany(mappedBy = "bill")
    Set<BillDetail> billDetails;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonIgnore
    private Users user;
}
