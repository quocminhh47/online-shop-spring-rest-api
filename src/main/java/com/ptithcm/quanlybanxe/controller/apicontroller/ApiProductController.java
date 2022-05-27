package com.ptithcm.quanlybanxe.controller.apicontroller;

import com.ptithcm.quanlybanxe.entity.*;
import com.ptithcm.quanlybanxe.model.ProductOutput;
import com.ptithcm.quanlybanxe.service.ProductService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/product/")
public class ApiProductController {
    private ProductService productService;

    public ApiProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping(value = "all-product")
    public ResponseEntity<List<Product>> getAllProduct(){
        return new ResponseEntity<>(productService.getAll(), HttpStatus.OK);
    }

    @GetMapping("show")
    public ProductOutput showProduct(@RequestParam("page") int page, @RequestParam("limit") int limit) {
        ProductOutput result = new ProductOutput();
        result.setPage(page);
        Pageable pageable = PageRequest.of(page - 1, limit);
        result.setListResult(productService.findAll(pageable));
        result.setTotalPage((int) Math.ceil((double) (productService.totalItem() / (double) limit)));
        return result;
    }

    @GetMapping(value = "detail-{id}")
    public ResponseEntity<Product> getProductById(@PathVariable("id") String id) {
        return new ResponseEntity<>(productService.findProductbyID(id), HttpStatus.OK);
    }

}
