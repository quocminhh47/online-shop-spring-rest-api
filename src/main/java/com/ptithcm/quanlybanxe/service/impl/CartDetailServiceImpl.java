package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.CartDetail;
import com.ptithcm.quanlybanxe.repository.CartDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartDetailServiceImpl {
    private CartDetailRepository cartDetailRepository;

    @Autowired
    public void setCartDetailRepository(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public  List<CartDetail> findAllByCartId(Integer id) {
        return cartDetailRepository.findAllByCartId(id);
    }
    public void save(CartDetail cartDetail){
        cartDetailRepository.save(cartDetail);
    }
    public void delete(CartDetail cartDetail){
        cartDetailRepository.delete(cartDetail);
    }

}
