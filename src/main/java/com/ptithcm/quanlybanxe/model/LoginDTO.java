package com.ptithcm.quanlybanxe.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
public class LoginDTO {
    private String usernameOrEmail;
    private String password;
}
