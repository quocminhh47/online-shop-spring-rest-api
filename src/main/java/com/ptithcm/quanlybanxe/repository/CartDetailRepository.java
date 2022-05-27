package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.CartDetail;
import com.ptithcm.quanlybanxe.entity.CartDetail_ID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CartDetailRepository extends JpaRepository<CartDetail, CartDetail_ID> {
    @Query("SELECT c FROM CartDetail c WHERE c.cart.id =?1")
    List<CartDetail> findAllByCartId(Integer id);
}
