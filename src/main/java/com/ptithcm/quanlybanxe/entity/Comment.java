package com.ptithcm.quanlybanxe.entity;


import javax.persistence.*;
import java.time.LocalDateTime;

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
    @Column(name = "cmt_time")
    private LocalDateTime cmt_time;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users usersComment;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public LocalDateTime getCmt_time() {
        return cmt_time;
    }

    public void setCmt_time(LocalDateTime cmt_time) {
        this.cmt_time = cmt_time;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Users getUsersComment() {
        return usersComment;
    }

    public void setUsersComment(Users usersComment) {
        this.usersComment = usersComment;
    }
}
