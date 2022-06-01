package com.ptithcm.quanlybanxe.controller.registration;

import com.ptithcm.quanlybanxe.entity.Cart;
import com.ptithcm.quanlybanxe.entity.Users;
import com.ptithcm.quanlybanxe.model.RegistrationRequest;
import com.ptithcm.quanlybanxe.model.Signal;
import com.ptithcm.quanlybanxe.repository.BillRepository;
import com.ptithcm.quanlybanxe.repository.CartRepository;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import com.ptithcm.quanlybanxe.service.IRegistrationService;
import com.ptithcm.quanlybanxe.service.impl.CartServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.User;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping(path = "/v1/api")
public class  RegistrationController  {
    private final IRegistrationService registrationService;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private UserRepository userRepository;

    public RegistrationController(IRegistrationService registrationService) {
        this.registrationService = registrationService;
    }

    @PostMapping("/registration")
    public ResponseEntity<Signal> register(@RequestBody RegistrationRequest request, ModelMap mm){
        Signal signal = new Signal();
        try {
            registrationService.register(request);
            signal.setResponse("OK");
            Cart cart = new Cart();
            cart.setCreateDate(new Date());
            cart.setStatus(0);
            ;

            Users u = userRepository.findById(request.getEmail()).get();
            u.setCart(cartRepository.save(cart));
            userRepository.save(u);

            mm.addAttribute("mess","Confirm mail để hoàn tất");
        } catch (Exception e){
            signal.setResponse("FAILED");
            e.printStackTrace();
            mm.addAttribute("mess","Lỗi, thử lại");
        }
        return new ResponseEntity<>(signal, HttpStatus.OK);
    }

    @GetMapping(path = "/registration/confirm")
    public String confirm(@RequestParam("token") String token) {
        return registrationService.confirmToken(token);
    }
}
