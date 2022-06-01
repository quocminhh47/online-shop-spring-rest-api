package com.ptithcm.quanlybanxe.controller.apicontroller;

import com.ptithcm.quanlybanxe.entity.*;
import com.ptithcm.quanlybanxe.model.ProductOutput;
import com.ptithcm.quanlybanxe.repository.BrandRepository;
import com.ptithcm.quanlybanxe.repository.CategoryRepository;
import com.ptithcm.quanlybanxe.service.ProductService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/product")
public class ApiProductController {
    private ProductService productService;
    private BrandRepository brandRepository;
    private CategoryRepository categoryRepository;

    public ApiProductController(ProductService productService, BrandRepository brandRepository, CategoryRepository categoryRepository) {
        this.productService = productService;
        this.brandRepository = brandRepository;
        this.categoryRepository = categoryRepository;
    }
    @GetMapping("")
    public ResponseEntity<List<Product>> showProductByBrand(@RequestParam("brand") String brandName) {
        return ResponseEntity.ok(productService.findAllProductByBrand(brandName));
    }

    @GetMapping(value = "/all-product")
    public ResponseEntity<List<Product>> getAllProduct(){
        return new ResponseEntity<>(productService.getAll(), HttpStatus.OK);
    }

    @GetMapping("/show")
    public ProductOutput showProduct(@RequestParam("page") int page, @RequestParam("limit") int limit) {
        ProductOutput result = new ProductOutput();
        result.setPage(page);
        Pageable pageable = PageRequest.of(page - 1, limit);
        result.setListResult(productService.findAll(pageable));
        result.setTotalPage((int) Math.ceil((double) (productService.totalItem() / (double) limit)));
        return result;
    }

    @GetMapping(value = "/detail-{id}")
    public ResponseEntity<Product> getProductById(@PathVariable("id") String id) {
        return new ResponseEntity<>(productService.findProductbyID(id), HttpStatus.OK);
    }

    @GetMapping(value = "/brand")
    public List<Brand> getAllBrand(){
        return brandRepository.findAll();
    }

    @GetMapping(value = "/category")
    public List<Category> getAllCategory(){
        return  categoryRepository.findAll();
    }


}
