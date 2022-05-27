package com.ptithcm.quanlybanxe.controller.apicontroller;


import com.ptithcm.quanlybanxe.entity.Users;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("api/login/")
public class ApiLogin {
    private UserRepository userRepository;

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public void setbCryptPasswordEncoder(BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @PostMapping("checkLogin")
    public Users login(@RequestBody Users user) {
        Optional<Users> u = userRepository.findById(user.getUsername());
        if(!u.isEmpty()){
            if(bCryptPasswordEncoder.matches(user.getPassword(), u.get().getPassword())){
                return u.get();
            }
        }
        return null;
    }
}
