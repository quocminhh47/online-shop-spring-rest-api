package com.ptithcm.quanlybanxe.controller;

import com.ptithcm.quanlybanxe.entity.*;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import com.ptithcm.quanlybanxe.service.impl.CartDetailServiceImpl;
import com.ptithcm.quanlybanxe.service.impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api")
public class CartAPI {
    private CartServiceImpl CartService;
    private CartDetailServiceImpl CartDetailService;
    private UserRepository userRepository;
    @Autowired
    public void setUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    public void setCartDetailService(CartDetailServiceImpl cartDetailService) {
        this.CartDetailService = cartDetailService;
    }

    @Autowired
    public void setCartService(CartServiceImpl cartService) {
        CartService = cartService;
    }

    //Tìm thông tin giỏ hàng từ username
    @GetMapping("/cart/{username}")
    public ResponseEntity<Cart> get(@PathVariable String username) {
        try {
            Users user = userRepository.findById(username).get();
            Cart Cart = user.getCart();
            return new ResponseEntity<>(Cart, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    //Show list of items của giỏ hàng
    @GetMapping("/cart/{username}/cartDetails")
    public List<CartDetail> getCartDetailsByCartId(@PathVariable String username) {
        Users user = userRepository.findById(username).get();
        Cart Cart = user.getCart();
        return CartDetailService.findAllByCartId(Cart.getId());
    }

    //1 user sẽ có 1 cart,
    //Method: POST -> Thêm/Sửa.
    //Nếu product đã có trong cart -> Update
    //Nếu product chưa có trong cart -> Add

    //Add product to cart
    @PostMapping("/cart/{username}/cartDetails")
    public CartDetail save(@RequestBody CartDetail CartDetail, @PathVariable String username) {
        Users user = userRepository.findById(username).get();
        CartDetail_ID id = new CartDetail_ID();
        id.setCartID(user.getCart().getId());
        id.setProductID(CartDetail.getProduct().getID());
        CartDetail.setId(id);
        CartDetail.setCart(user.getCart());
        CartDetailService.save(CartDetail);
        return CartDetail;
    }

    //Remove product from cart
    @DeleteMapping("/cart/{username}/cartDetails")
    public CartDetail delete(@RequestBody CartDetail CartDetail, @PathVariable String username) {
        Users user = userRepository.findById(username).get();
        CartDetail_ID id = new CartDetail_ID();
        id.setCartID(user.getCart().getId());
        id.setProductID(CartDetail.getProduct().getID());
        CartDetail.setId(id);
        CartDetail.setCart(user.getCart());
        CartDetailService.delete(CartDetail);
        return CartDetail;
    }
    //Remove product from cart with mobile support
    @DeleteMapping("/cart/{username}/cartDetails/{productId}")
    public CartDetail deleteWithMobileSupport(@PathVariable String username, @PathVariable String productId) {
        Users user = userRepository.findById(username).get();
        CartDetail_ID id = new CartDetail_ID();
        id.setCartID(user.getCart().getId());
        id.setProductID(productId);
        CartDetail cartDetail = new CartDetail();
        cartDetail.setId(id);
        cartDetail.setCart(user.getCart());
        Product product = new Product();
        product.setID(productId);
        cartDetail.setProduct(product);
        CartDetailService.delete(cartDetail);
        return cartDetail;
    }
}
