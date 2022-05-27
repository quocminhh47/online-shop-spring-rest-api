package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<Users, String> {
    @Transactional
    @Modifying
    @Query("UPDATE Users s " +
            "SET s.enabled = TRUE WHERE s.username = ?1") //username = email
    int enableUser(String email);

}
