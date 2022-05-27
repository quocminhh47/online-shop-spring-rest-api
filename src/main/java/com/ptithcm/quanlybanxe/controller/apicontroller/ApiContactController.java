package com.ptithcm.quanlybanxe.controller.apicontroller;

import com.ptithcm.quanlybanxe.entity.Contact;
import com.ptithcm.quanlybanxe.entity.ContactID;
import com.ptithcm.quanlybanxe.model.Signal;
import com.ptithcm.quanlybanxe.service.ContactService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user/api/contact")
public class ApiContactController {
    ContactService contactService;

    public ApiContactController(ContactService contactService) {
        this.contactService = contactService;
    }

    @PostMapping(value = "/send-contact")
    public ResponseEntity<Signal> sendContact(@RequestBody ContactID contactID){
        Signal signal = new Signal();
        Contact contact = new Contact();
        contact.setContactID(contactID);
        if(contactService.saveContact(contact)) {
            signal.setResponse("OK");
            return new ResponseEntity<>(signal, HttpStatus.OK);
        }
        else  {
            signal.setResponse("FAILED");

            return new ResponseEntity<>(signal, HttpStatus.EXPECTATION_FAILED);
        }
    }
}
