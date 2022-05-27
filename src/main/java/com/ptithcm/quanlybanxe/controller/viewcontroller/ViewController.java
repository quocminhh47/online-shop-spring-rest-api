package com.ptithcm.quanlybanxe.controller.viewcontroller;

import com.ptithcm.quanlybanxe.entity.Bill;
import com.ptithcm.quanlybanxe.entity.BillDetail;
import com.ptithcm.quanlybanxe.entity.CartDetail;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import java.security.Principal;

@Controller
public class ViewController {
    @GetMapping("/home")
    public String home() {
        return "web/index";
    }
    @GetMapping("/login")
    public String login() {
        return "web/login";
    }

    @GetMapping(value = "/home/detail-{id}.htm")
    public String getDetailItem(@PathVariable("id") String id, ModelMap mm) {
        mm.addAttribute("id", id);
        return "web/detail-product";
    }

    @GetMapping("/user/registration")
    public String register() {
        return "admin/registration";
    }

    @GetMapping("/user/contact")
    public String contact() {
        return "web/contact";
    }

    //Cart
    @GetMapping("/user/checkout")
    public String checkout(ModelMap mm, Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        //Check login
        String url = "http://localhost:8080/api/cart/"+principal.getName()+"/cartDetails";
        ResponseEntity<CartDetail[]> response =
                restTemplate.getForEntity(
                        url,
                        CartDetail[].class);
        CartDetail[] cartDetails = response.getBody();
        float totalPrice = 0;
        if(cartDetails.length > 0){
            for (CartDetail c: cartDetails) {
                totalPrice = totalPrice + (c.getPrice() * c.getQuantity());
            }
        }

        mm.addAttribute("cartDetails", cartDetails);
        mm.addAttribute("totalPrice", totalPrice);
        return "web/cart/checkout";
    }

    //Show all bills
    @GetMapping("/user/showAllBills")
    public String showAllBills(ModelMap mm, Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        //Check login
        String url = "http://localhost:8080/api/bill/findAllByUsername/"+principal.getName();
        ResponseEntity<Bill[]> response =
                restTemplate.getForEntity(
                        url,
                        Bill[].class);
        Bill[] bills = response.getBody();
        mm.addAttribute("bills", bills);
        return "web/bill/showAllBills";
    }

    //Show all items of bill
    @GetMapping("/user/bill/{id}")
    public String showAllBills(ModelMap mm, @PathVariable("id") Integer id) {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/api/bill/"+id+"/billDetail";
        ResponseEntity<BillDetail[]> response =
                restTemplate.getForEntity(
                        url,
                        BillDetail[].class);
        BillDetail[] billDetails = response.getBody();
        mm.addAttribute("billDetails", billDetails);

        RestTemplate restTemplate2 = new RestTemplate();

        String url2 = "http://localhost:8080/api/bill/"+id;
        ResponseEntity<Bill> response2 =
                restTemplate2.getForEntity(
                        url2,
                        Bill.class);
        Bill bill = response2.getBody();
        mm.addAttribute("bill", bill);
        return "web/bill/billDetail";
    }
    @PostMapping("/user/bill")
    public String saveBill() {
        RestTemplate restTemplate = new RestTemplate();

        return "web/bill/showAllBills";
    }

}
