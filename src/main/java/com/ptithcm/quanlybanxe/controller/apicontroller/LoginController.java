package com.ptithcm.quanlybanxe.controller.apicontroller;


import com.ptithcm.quanlybanxe.entity.BillDetail;
import com.ptithcm.quanlybanxe.entity.BillDetail_ID;
import com.ptithcm.quanlybanxe.entity.Users;
import com.ptithcm.quanlybanxe.model.LoginDTO;
import com.ptithcm.quanlybanxe.model.Signal;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@RestController
public class LoginController {
    AuthenticationManager authenticationManager;
    private  UserRepository userRepository;
    @Autowired
    public void setAuthenticationManager(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }
    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping("/user/login")
    public ResponseEntity<Signal> authenticateUser(@RequestBody LoginDTO loginDto, ModelMap mm){
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                loginDto.getUsernameOrEmail(), loginDto.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        Signal sign = new Signal("OK");
        return new ResponseEntity<>(sign, HttpStatus.OK);

    }
    @GetMapping("/user/{username}")
    public Users findById(@PathVariable String username) {
        return userRepository.findById(username).get();
    }
}
