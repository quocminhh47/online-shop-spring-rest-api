package com.ptithcm.quanlybanxe.service;

import com.ptithcm.quanlybanxe.entity.Product;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {
    Product saveProduct(Product product);
    List<Product> findAll (Pageable pageable);
    List<Product> getAll ();
    int totalItem();
    Product findProductbyID(String id);
}
