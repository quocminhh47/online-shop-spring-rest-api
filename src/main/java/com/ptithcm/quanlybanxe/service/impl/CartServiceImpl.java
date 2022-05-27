package com.ptithcm.quanlybanxe.service.impl;
import com.ptithcm.quanlybanxe.entity.Cart;
import com.ptithcm.quanlybanxe.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl {
    private CartRepository cartRepository;
    @Autowired
    public void setCartRepository(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart findById(Integer id){
        return cartRepository.findById(id).get();
    }
}
