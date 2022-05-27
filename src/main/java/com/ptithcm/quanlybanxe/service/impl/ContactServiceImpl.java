package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.Contact;
import com.ptithcm.quanlybanxe.repository.ContactRepository;
import com.ptithcm.quanlybanxe.service.ContactService;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
@RequiredArgsConstructor
public class ContactServiceImpl implements ContactService {
    private final ContactRepository contactRepository;
    private final JavaMailSender javaMailSender;

    @Override
    public Boolean saveContact(Contact contact) {
        try {
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper =
                    new MimeMessageHelper(mimeMessage, "utf-8");
            helper.setText(contact.getContactID().getMessage());
            helper.setTo("quocminhh47@gmail.com");
            helper.setSubject("Customer contact");
            helper.setFrom(contact.getContactID().getEmail());
            javaMailSender.send(mimeMessage);
            contactRepository.save(contact);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
