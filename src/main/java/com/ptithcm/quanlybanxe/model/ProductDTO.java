package com.ptithcm.demospringboot.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
    private String id;
    private String name;
    private Integer brand_id;
    private Integer cc;
    private Integer type_id;
    private BigDecimal price;
    private Integer quantity;
    private String status;
    private String description;
    private String photo;
    private String photo2;
    private String photo3;
    private String photo4;
    private Float discount;

}
