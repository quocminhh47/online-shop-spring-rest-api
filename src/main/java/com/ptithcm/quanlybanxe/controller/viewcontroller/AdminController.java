package com.ptithcm.quanlybanxe.controller.viewcontroller;

import com.ptithcm.quanlybanxe.entity.Bill;
import com.ptithcm.quanlybanxe.model.ThongKeDTO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/home")
    public String home() {
        return "admin/home";
    }

    @GetMapping("/bill")
    public String bill(ModelMap mm, Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        //Check login
        String url = "http://localhost:8080/api/bill";
        ResponseEntity<Bill[]> response =
                restTemplate.getForEntity(
                        url,
                        Bill[].class);
        Bill[] bills = response.getBody();
        Integer priceTotal = 0;
        for (Bill b : bills) {
            priceTotal += (b.getPriceTotal());
        }
        mm.addAttribute("bills", bills);
        mm.addAttribute("priceTotal", priceTotal);
        return "admin/bill/bill";
    }

    @GetMapping("/bill/salesStatistics")
    public String thongKeDoanhThu(ModelMap mm) {
        mm.addAttribute("thongKeDTO", new ThongKeDTO());
        return "admin/bill/billForm";
    }

    @PostMapping("/bill/salesStatistics")
    public String xuLyThongKeDoanhThu(ModelMap mm, HttpServletRequest req) throws ParseException {
        String start = req.getParameter("start");
        String end = req.getParameter("end");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date start1 = sdf.parse(start);
        Date end1 = sdf.parse(end);
        System.out.println(start1);

        RestTemplate restTemplate = new RestTemplate();
        String url = "http://localhost:8080/api/bill/thongKeDoanhThu";
        HttpEntity<ThongKeDTO> http = new HttpEntity<>(new ThongKeDTO(start1, end1));
        Bill[] bills = restTemplate.exchange(url, HttpMethod.POST, http, Bill[].class).getBody();
        Integer priceTotal = 0;
        for (Bill b : bills) {
            priceTotal += (b.getPriceTotal());
        }
        mm.addAttribute("bills", bills);
        mm.addAttribute("priceTotal", priceTotal);
        return "admin/bill/bill";
    }

    @GetMapping("/bill/approveOrder")
    public String approveOrder(ModelMap mm, Principal principal) {
        RestTemplate restTemplate = new RestTemplate();
        //Check login
        String url = "http://localhost:8080/api/bill";
        ResponseEntity<Bill[]> response =
                restTemplate.getForEntity(
                        url,
                        Bill[].class);
        Bill[] bills = response.getBody();
        mm.addAttribute("bills", bills);
        return "admin/bill/approveOrder";
    }

    //Hưng
    @GetMapping("/product")
    public String showProducts() {
        return "admin/product";
    }

    @GetMapping("edit/product-{id}")
    public String editProduct(@PathVariable("id") String id, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        return "admin/editProduct";
    }

    @GetMapping("/insert/product")
    public String insertProduct() {
        return "admin/insertProduct";
    }

    @GetMapping("/comment")
    public String showComment() {
        return "admin/comment";
    }

    @GetMapping("/delete/comment-{id}")
    public String deleteComment(@PathVariable("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("id", id);
        return "admin/deleteComment";
    }


}
