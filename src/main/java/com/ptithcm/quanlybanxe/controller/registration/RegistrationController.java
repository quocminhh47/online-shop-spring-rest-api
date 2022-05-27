package com.ptithcm.quanlybanxe.controller.registration;

import com.ptithcm.quanlybanxe.model.RegistrationRequest;
import com.ptithcm.quanlybanxe.model.Signal;
import com.ptithcm.quanlybanxe.service.IRegistrationService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/v1/api")
@AllArgsConstructor
public class  RegistrationController  {
    private final IRegistrationService registrationService;

    @PostMapping("/registration")
    public ResponseEntity<Signal> register(@RequestBody RegistrationRequest request, ModelMap mm){
        Signal signal = new Signal();
        try {
            registrationService.register(request);
            signal.setResponse("OK");
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
