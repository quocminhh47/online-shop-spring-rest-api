package com.ptithcm.quanlybanxe.dto;

import com.ptithcm.quanlybanxe.entity.Brand;
import com.ptithcm.quanlybanxe.entity.Category;
import com.ptithcm.quanlybanxe.entity.Product;
import com.ptithcm.quanlybanxe.model.ProductDTO;
import com.ptithcm.quanlybanxe.repository.BrandRepository;
import com.ptithcm.quanlybanxe.repository.CategoryRepository;
import com.ptithcm.quanlybanxe.repository.ProductRepository;
import org.springframework.stereotype.Service;


@Service
public class ProductConverter {
    private final ProductRepository productRepository;
    private final BrandRepository brandRepository;
    private final CategoryRepository categoryRepository;

    public ProductConverter(ProductRepository productRepository, BrandRepository brandRepository, CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.brandRepository = brandRepository;
        this.categoryRepository = categoryRepository;
    }

    public Product productConvert(ProductDTO productDTO){
        Integer currentBrand_id = productDTO.getBrand_id();
        Integer currentType_id = productDTO.getType_id();

        Brand brand = brandRepository.findById(currentBrand_id).get();
        Category category = categoryRepository.findById(currentType_id).get();

        Product product = new Product();
        product.setID(productDTO.getId());
        product.setName(productDTO.getName());
        product.setBrand(brand);
        product.setCategory(category);
        product.setPrice(productDTO.getPrice());
        product.setCc(productDTO.getCc());
        product.setDescription(productDTO.getDescription());
        product.setQuantity(productDTO.getQuantity());
        product.setStatus(productDTO.getStatus());
        product.setUrlImage(productDTO.getPhoto());
        product.setUrlImage2(productDTO.getPhoto2());
        product.setUrlImage3(productDTO.getPhoto3());
        product.setUrlImage4(productDTO.getPhoto4());
        product.setDiscount(productDTO.getDiscount());

        return product;
    }
}
