package com.ptithcm.quanlybanxe.controller;

import com.ptithcm.quanlybanxe.entity.*;
import com.ptithcm.quanlybanxe.model.ThongKeDTO;
import com.ptithcm.quanlybanxe.repository.BillDetailRepository;
import com.ptithcm.quanlybanxe.repository.BillRepository;
import com.ptithcm.quanlybanxe.repository.CartDetailRepository;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/api")
public class BillAPI {
    private UserRepository userRepository;
    private BillRepository billRepository;
    private BillDetailRepository billDetailRepository;
    private CartDetailRepository cartDetailRepository;
    @Autowired
    public void setCartDetailRepository(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

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

    //Show all bills of customer
    @GetMapping("/bill/findAllByUsername/{username}")
    public Set<Bill> findAllBillsByUsername(@PathVariable String username) {
        Users user = userRepository.findById(username).get();
        return user.getBills();
    }

    //Show all bills of all customers
    @GetMapping("/bill")
    public List<Bill> findAll() {
        return billRepository.findAll();
    }

    //Show specified bill
    @GetMapping("/bill/{id}")
    public Bill findById(@PathVariable Integer id) {
        return billRepository.findById(id).get();
    }

    //Create bill, unused
    @PostMapping("/bill")
    public Bill save(@RequestBody Bill bill) {
        bill.setCreateDate(new Date());
        Bill b = findById(billRepository.save(bill).getID());
        //Return
        b.setUser(null);
        return b;
    }

    //Update bill
    @PutMapping("/bill")
    public Bill update(@RequestBody Bill bill) {
        Bill b = billRepository.findById(bill.getID()).get();
        b.setStatus(bill.getStatus());
        Bill B = findById(billRepository.save(b).getID());
        B.setUser(null);
        return B;
    }

    //BillDetail

    //Show all items of specified bill
    @GetMapping("/bill/{id}/billDetail")
    public Set<BillDetail> findAllBillDetailsByBillID(@PathVariable Integer id) {
        return billRepository.findById(id).get().getBillDetails();
    }

    //Create bill from cart
    //Because every customer just have one cart, so cart == username
    @PostMapping("/billDetail/{username}")
    public Bill save(@PathVariable String username) {
        Bill bill = new Bill();
        Users user = new Users();
        user.setUsername(username);
        bill.setUser(user);
        bill.setCreateDate(new Date());
        bill.setStatus(0);
        //Call save bill
        Bill Bill = billRepository.save(bill);
        Users u = userRepository.findById(username).get();
        List<CartDetail> cartDetails =cartDetailRepository.findAllByCartId(u.getCart().getId());
        Integer priceTotal = 0;
        //Tổng tiền đã giảm
        Integer discountTotal = 0;
        for(CartDetail c: cartDetails){
            BillDetail billDetail = new BillDetail();
            priceTotal += c.getQuantity() * c.getPrice();
            //Phần trăm
            //100
            //D: 25
            //100 * (25/100) = 25
            discountTotal += c.getQuantity() * (c.getProduct().getPrice() * (c.getProduct().getDiscount())/100) ;
            BillDetail_ID id = new BillDetail_ID();
            id.setBill_ID(Bill.getID());
            id.setProduct_ID(c.getProduct().getID());
            billDetail.setId(id);
            billDetail.setPrice(c.getPrice());
            billDetail.setQuantity(c.getQuantity());
            billDetail.setBill(Bill);
            billDetail.setProduct(c.getProduct());
            //Call save bill detail
            billDetailRepository.save(billDetail);
        }
        //Update priceTotal
        Bill.setPriceTotal(priceTotal);
        Bill.setDiscountTotal(discountTotal);
        Bill.setUser(user);
        billRepository.save(Bill);
        //Delete cart
        cartDetailRepository.deleteAll(cartDetails);
        return Bill;
    }

    @PostMapping("/bill/thongKeDoanhThu")
    public List<Bill> thongKeDoanhThu(@RequestBody ThongKeDTO thongKeDTO) throws ParseException {
        List<Bill> list = billRepository.findAll();
        List<Bill> bills = new ArrayList<>();
        for(Bill b: list){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date start = sdf.parse(sdf.format(thongKeDTO.getStart()));
            Date end = sdf.parse(sdf.format(thongKeDTO.getEnd()));
            Date date = sdf.parse(sdf.format(b.getCreateDate()));
            int result1 = start.compareTo(date);//-1, before
            int result2 = end.compareTo(date);//1, after
            if(result1 <= 0 && result2 >= 0){
                bills.add(b);
            }
        }
        return bills;
    }




}
