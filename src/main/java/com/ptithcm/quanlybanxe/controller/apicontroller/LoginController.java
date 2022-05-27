package com.ptithcm.quanlybanxe.controller.apicontroller;


import com.ptithcm.quanlybanxe.model.LoginDTO;
import com.ptithcm.quanlybanxe.model.Signal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {
    @Autowired
    AuthenticationManager authenticationManager;

    @PostMapping("/user/login")
    public ResponseEntity<Signal> authenticateUser(@RequestBody LoginDTO loginDto, ModelMap mm){
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                loginDto.getUsernameOrEmail(), loginDto.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        Signal sign = new Signal("OK");
        return new ResponseEntity<>(sign, HttpStatus.OK);

    }
}
