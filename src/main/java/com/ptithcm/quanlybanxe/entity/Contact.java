package com.ptithcm.quanlybanxe.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Getter
@Setter
@Entity
@Table(name="Contact")
public class Contact implements Serializable{
    @EmbeddedId
    private ContactID contactID;

}
