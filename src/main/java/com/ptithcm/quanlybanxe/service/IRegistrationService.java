package com.ptithcm.quanlybanxe.service;

import com.ptithcm.quanlybanxe.model.RegistrationRequest;

public interface IRegistrationService {
    String register(RegistrationRequest request);
    String confirmToken(String token);
    String buildEmail(String name, String link);
}
