package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface CartRepository extends JpaRepository<Cart, Integer> {

}
