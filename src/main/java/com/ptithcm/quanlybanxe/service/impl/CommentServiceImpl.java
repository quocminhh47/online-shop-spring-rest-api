package com.ptithcm.quanlybanxe.service.impl;

import com.ptithcm.quanlybanxe.entity.Comment;
import com.ptithcm.quanlybanxe.entity.Product;
import com.ptithcm.quanlybanxe.entity.Users;
import com.ptithcm.quanlybanxe.model.CommentDTO;
import com.ptithcm.quanlybanxe.repository.CommentRepository;
import com.ptithcm.quanlybanxe.repository.ProductRepository;
import com.ptithcm.quanlybanxe.repository.UserRepository;
import com.ptithcm.quanlybanxe.service.CommentService;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service

public class CommentServiceImpl implements CommentService {
    private ProductRepository productRepository;
    private CommentRepository commentRepository;
    private UserRepository userRepository;

    public CommentServiceImpl(ProductRepository productRepository,
                              CommentRepository commentRepository,
                              UserRepository userRepository) {
        this.productRepository = productRepository;
        this.commentRepository = commentRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Comment saveComment(String productID, CommentDTO commentDTO) {
        String currentUserName = null;
        Product product = productRepository.findById(productID).get();

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            currentUserName = authentication.getName();
        }
        Users users = userRepository.findById("user").get();
        Comment comment = new Comment();
        comment.setProduct(product);
        comment.setUsersComment(users);
        comment.setNoiDung(commentDTO.getNoiDung());
        comment.setCmt_time(new Date());
        return commentRepository.save(comment);


    }

    @Override
    public List<Comment> findAllComment() {
        return commentRepository.findAll();
    }

    @Override
    public List<Comment> findAllCommentByIdProduct(String productID) {
        return commentRepository.findCommentByProductID(productID);
    }

}
