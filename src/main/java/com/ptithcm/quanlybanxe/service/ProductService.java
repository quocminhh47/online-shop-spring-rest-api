package com.ptithcm.quanlybanxe.service;

import com.ptithcm.quanlybanxe.entity.Product;
import com.ptithcm.quanlybanxe.model.ProductDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {
    Product saveProduct(Product product);
    List<Product> findAll (Pageable pageable);
    List<Product> getAll ();
    int totalItem();
    Product findProductbyID(String id);
    Product insertProduct(ProductDTO productDTO);
    Product updateProduct(ProductDTO productDTO);
    List<Product> findAllProductByBrand(String brand);
}
