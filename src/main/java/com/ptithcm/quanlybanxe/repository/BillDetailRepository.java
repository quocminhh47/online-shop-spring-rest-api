package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.BillDetail;
import com.ptithcm.quanlybanxe.entity.BillDetail_ID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BillDetailRepository extends JpaRepository<BillDetail, BillDetail_ID> {
}