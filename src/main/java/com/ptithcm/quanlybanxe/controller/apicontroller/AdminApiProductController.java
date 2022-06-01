package com.ptithcm.quanlybanxe.controller.apicontroller;


import com.ptithcm.quanlybanxe.entity.Product;
import com.ptithcm.quanlybanxe.model.ProductDTO;
import com.ptithcm.quanlybanxe.model.Signal;
import com.ptithcm.quanlybanxe.service.CommentService;
import com.ptithcm.quanlybanxe.service.ProductService;
import com.ptithcm.quanlybanxe.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("admin/api/product/")
public class AdminApiProductController {
    private ProductService productService;
    private CommentService commentService;

    public AdminApiProductController(ProductService productService, CommentService commentService) {
        this.productService = productService;
        this.commentService = commentService;
    }

    @GetMapping(value = "all-product")
    public ResponseEntity<List<Product>> getAllProduct(){
        return new ResponseEntity<>(productService.getAll(), HttpStatus.OK);
    }

    @PostMapping("insert-product")
    public ResponseEntity<Signal> insertProduct(@RequestBody ProductDTO productDTO){
        Signal signal = new Signal();
        try {
            productService.insertProduct(productDTO);
            signal.setResponse("OK");
        }catch (Exception e){
            e.printStackTrace();
            signal.setResponse("FAILED");
        }
        return new ResponseEntity<Signal>(signal, HttpStatus.CREATED);
    }

    @PutMapping("update-product")
    public ResponseEntity<Signal> updateProduct(@RequestBody ProductDTO productDTO){
        Signal signal = new Signal();
        try {
            productService.updateProduct(productDTO);
            signal.setResponse("OK");
        }catch (Exception e){
            e.printStackTrace();
            signal.setResponse("FAILED");
        }
        return new ResponseEntity<Signal>(signal, HttpStatus.OK);
    }

    @DeleteMapping("delete-comment-{id}")
    public ResponseEntity<Signal> deleteComment(@PathVariable("id") Integer id){
        Signal signal = new Signal();
        try {
            System.out.println(id);
            commentService.deleteComment(id);
            signal.setResponse("OK");
        } catch (Exception e) {
            e.printStackTrace();
            signal.setResponse("FAILED");

        }
        return new ResponseEntity<Signal>(signal, HttpStatus.OK);
    }
}
