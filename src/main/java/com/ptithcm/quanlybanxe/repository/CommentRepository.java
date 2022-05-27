package com.ptithcm.quanlybanxe.repository;

import com.ptithcm.quanlybanxe.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Integer> {

    @Query(value = "select C.* from Comment C where C.product_id=:ten" , nativeQuery = true)
    List<Comment> findCommentByProductID(@Param("ten") String ten);

}
