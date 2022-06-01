package com.ptithcm.quanlybanxe.model;

public class ProductDTO {
    private String id;
    private String name;
    private Integer brand_id;
    private Integer cc;
    private Integer type_id;
    private Integer price;
    private Integer quantity;
    private String status;
    private String description;
    private String photo;
    private String photo2;
    private String photo3;
    private String photo4;
    private Integer discount;

    public ProductDTO(String id, String name, Integer brand_id, Integer cc, Integer type_id, Integer price, Integer quantity, String status, String description, String photo, String photo2, String photo3, String photo4, Integer discount) {
        this.id = id;
        this.name = name;
        this.brand_id = brand_id;
        this.cc = cc;
        this.type_id = type_id;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.description = description;
        this.photo = photo;
        this.photo2 = photo2;
        this.photo3 = photo3;
        this.photo4 = photo4;
        this.discount = discount;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getCc() {
        return cc;
    }

    public void setCc(Integer cc) {
        this.cc = cc;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public ProductDTO() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(Integer brand_id) {
        this.brand_id = brand_id;
    }


    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }


    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhoto2() {
        return photo2;
    }

    public void setPhoto2(String photo2) {
        this.photo2 = photo2;
    }

    public String getPhoto3() {
        return photo3;
    }

    public void setPhoto3(String photo3) {
        this.photo3 = photo3;
    }

    public String getPhoto4() {
        return photo4;
    }

    public void setPhoto4(String photo4) {
        this.photo4 = photo4;
    }

}
