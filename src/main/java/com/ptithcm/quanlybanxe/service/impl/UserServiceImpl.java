package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.ConfirmationToken;
import com.ptithcm.quanlybanxe.entity.Users;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserDetailsService {
    private final static String USER_NOT_FOUND_MSG =
            "user with email %s not found";

    private final UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    private final ConfirmationTokenService confirmationTokenService;

    @Override
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {
        Users users = userRepository.findById(email).orElseThrow(
                () -> new UsernameNotFoundException(
                        String.format(USER_NOT_FOUND_MSG, email)
                )
        );
        return new org.springframework.security.core.userdetails.User(
                users.getUsername(), users.getPassword(), getGrantedAuthorities(users));
    }

    //Handle when user register - and this give token
    public String signUpUser(Users users){
        boolean userExists = userRepository
                .findById(users.getUsername())
                .isPresent();

        if(userExists){
            // TODO check of attributes are the same and
            // TODO if email not confirmed send confirmation email.
            throw  new IllegalStateException("email already taken");
        }

        String encodedPassword = bCryptPasswordEncoder
                .encode(users.getPassword());

        users.setPassword(encodedPassword);

        userRepository.save(users);
        // SEND CONFIRMATION TOKEN
        String token = UUID.randomUUID().toString();
        ConfirmationToken confirmationToken = new ConfirmationToken(
                token,
                LocalDateTime.now(),
                LocalDateTime.now().plusMinutes(15),
                users
        );
        confirmationTokenService.saveConfirmationToken(confirmationToken);

        return token;
    }

    public int enableUser(String email) {
        return userRepository.enableUser(email);
    }

    private Collection<GrantedAuthority> getGrantedAuthorities(Users users){
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        if(users.getRoles().getRole().equalsIgnoreCase("admin")){
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return authorities;
    }

    private String getUserRole(String email){
        Users users = userRepository.findById(email).get();
        String role = users.getRoles().getRole();
        return role.toLowerCase();
    }

}
