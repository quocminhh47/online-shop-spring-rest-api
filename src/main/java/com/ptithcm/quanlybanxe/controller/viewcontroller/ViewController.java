package com.ptithcm.quanlybanxe.controller.viewcontroller;

import com.ptithcm.quanlybanxe.entity.*;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;

@Controller
public class ViewController {
    //Cart

    //Show cart
    @GetMapping("/user/cart")
    public String cart(ModelMap mm, Principal principal) {
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

        RestTemplate restTemplate2 = new RestTemplate();
        String url2 = "http://localhost:8080/api/cart/"+principal.getName();
        ResponseEntity<Cart> response2 =
                restTemplate2.getForEntity(
                        url2,
                        Cart.class);
        Cart cart = response2.getBody();
        mm.addAttribute("cart", cart);

        mm.addAttribute("cartDetails", cartDetails);
        mm.addAttribute("totalPrice", totalPrice);
        return "web/cart/cart";
    }

    //Show all bills of the user
    @GetMapping("/user/bill")
    public String bill(ModelMap mm, Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        //Check login
        String url = "http://localhost:8080/api/bill/findAllByUsername/"+principal.getName();
        ResponseEntity<Bill[]> response =
                restTemplate.getForEntity(
                        url,
                        Bill[].class);
        Bill[] bills = response.getBody();
        mm.addAttribute("bills", bills);
        return "web/bill/bill";
    }

    //Show bill and all items of bill
    @GetMapping("/user/bill/{id}")
    public String billDetail(ModelMap mm, @PathVariable("id") Integer id) {
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
    //Create bill and bill detail
    @PostMapping("/user/bill")
    public RedirectView saveBill( Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/api/billDetail/"+principal.getName();
        HttpEntity<Bill> http = new HttpEntity<>(new Bill());
        Bill b = restTemplate.exchange(url, HttpMethod.POST, http, Bill.class).getBody();
        return new RedirectView("/user/bill/"+b.getID());
    }

    //Home, login, registration and product
    @GetMapping("/home")
    public String home() {
        return "web/index";
    }

    @GetMapping("/login")
    public String login() {
        return "web/login";
    }

    @GetMapping("/login2")
    public String login2() {
        return "web/login2";
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

    @GetMapping(value = "/home/product")
    public String getAllProductByBrand(@RequestParam("brand") String brandName,
                                       ModelMap modelMap){
        modelMap.addAttribute("brandName", brandName);
        return "web/index2";
    }

}
