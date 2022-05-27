package com.ptithcm.quanlybanxe.controller;

import com.ptithcm.quanlybanxe.entity.*;
import com.ptithcm.quanlybanxe.repository.BillDetailRepository;
import com.ptithcm.quanlybanxe.repository.BillRepository;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Set;

@RestController
@RequestMapping("/api")
public class BillAPI {
    private UserRepository userRepository;
    private BillRepository billRepository;
    private BillDetailRepository billDetailRepository;
    @Autowired
    public void setUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    @Autowired
    public void setBillRepository(BillRepository billRepository) {
        this.billRepository = billRepository;
    }
    @Autowired
    public void setBillDetailRepository(BillDetailRepository billDetailRepository) {
        this.billDetailRepository = billDetailRepository;
    }

    @GetMapping("/bill/findAllByUsername/{username}")
    public Set<Bill> findAllBillsByUsername(@PathVariable String username) {
        Users user = userRepository.findById(username).get();
        return user.getBills();
    }

    @GetMapping("/bill/{id}")
    public Bill findById(@PathVariable Integer id) {
        return billRepository.findById(id).get();
    }

    @PostMapping("/bill")
    public Bill save(@RequestBody Bill bill) {
        bill.setCreateDate(new Date());
        Bill b = findById(billRepository.save(bill).getID());
        //Role of User null.
        b.setUser(null);
        return b;
    }

    //BillDetail
    @GetMapping("/bill/{id}/billDetail")
    public Set<BillDetail> findAllBillDetailsByBillID(@PathVariable Integer id) {
        return billRepository.findById(id).get().getBillDetails();
    }

    //Unused
    @GetMapping("/bill/{billID}/billDetail/{productID}")
    public BillDetail findBillDetailByID(@PathVariable Integer billID, @PathVariable String productID) {
        BillDetail_ID id = new BillDetail_ID();
        id.setBill_ID(billID);
        id.setProduct_ID(productID);
        return billDetailRepository.findById(id).get();
    }

}
