package com.ptithcm.quanlybanxe.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Product")
public class Product {
    @Id
    @Column(name = "id")
    private String ID;

    @Column(name = "name")
    private String name;


    @Column(name = "cc")
    private String cc;


    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "status")
    private String status;

    @Column(name = "description")
    private String description;

    @Column(name = "photo")
    private String urlImage;

    @Column(name = "photo2")
    private String urlImage2;

    @Column(name = "photo3")
    private String urlImage3;

    @Column(name = "photo4")
    private String urlImage4;

    @Column(name = "discount")
    private Float discount;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private Category category;


    @OneToMany(mappedBy = "product")
    private Set<Comment> comments;



}
