package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.Roles;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Roles, Integer > {
    Roles findByRole(String role);

}
