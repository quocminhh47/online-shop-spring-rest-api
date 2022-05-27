package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.Product;
import com.ptithcm.quanlybanxe.exception.ResourceNotFoundException;
import com.ptithcm.quanlybanxe.repository.ProductRepository;
import com.ptithcm.quanlybanxe.service.ProductService;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    private ProductRepository productRepository;


    public ProductServiceImpl(ProductRepository productRepository) {
        super();
        this.productRepository = productRepository;
    }

    @Override
    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> findAll(Pageable pageable) {
        List<Product> products = productRepository.findAll(pageable).getContent();
        return products;
    }

    @Override
    public List<Product> getAll() {
        return productRepository.findAll();
    }

    @Override
    public int totalItem() {
        return (int) productRepository.count();
    }

    @Override
    public Product findProductbyID(String id) {
        return productRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Product", "ID", id));
    }
}
