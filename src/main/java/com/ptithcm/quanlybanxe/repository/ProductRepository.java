package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, String> {
    @Query(value = "select P.* from Product P inner join Brand B on P.brand_id=B.id where B.name = :brand ", nativeQuery = true)
    List<Product> findAllProductByBrand(@Param("brand") String brand);
}
