package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.Contact;
import com.ptithcm.quanlybanxe.entity.ContactID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepository extends JpaRepository<Contact, ContactID> {

}
