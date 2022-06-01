package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.dto.ProductConverter;
import com.ptithcm.quanlybanxe.entity.Product;
import com.ptithcm.quanlybanxe.exception.ResourceNotFoundException;
import com.ptithcm.quanlybanxe.model.ProductDTO;
import com.ptithcm.quanlybanxe.repository.ProductRepository;
import com.ptithcm.quanlybanxe.service.ProductService;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductRepository productRepository;
    private ProductConverter productConverter;

    public ProductServiceImpl(ProductRepository productRepository, ProductConverter productConverter) {
        this.productRepository = productRepository;
        this.productConverter = productConverter;
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

    @Override
    public Product insertProduct(ProductDTO productDTO) {
        Product product = new Product();
        product = productConverter.productConvert(productDTO);
        return  productRepository.save(product);

    }

    @Override
    public Product updateProduct(ProductDTO productDTO) {

        Product product = productConverter.productConvert(productDTO);
        return  productRepository.save(product);
    }

    @Override
    public List<Product> findAllProductByBrand(String brand) {
        return productRepository.findAllProductByBrand(brand);
    }
}
