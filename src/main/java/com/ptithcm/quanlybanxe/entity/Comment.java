package com.ptithcm.quanlybanxe.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "Comment")
public class Comment {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Integer id;
    @Column(name = "ten")
    private String ten;
    @Column(name = "email")
    private String email;
    @Column(name = "noidung")
    private String noiDung;
    @Column(name = "CMT_TIME")
    private Date cmt_time;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users usersComment;
}
