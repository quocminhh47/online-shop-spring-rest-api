package com.ptithcm.quanlybanxe.service;

import com.ptithcm.quanlybanxe.entity.Comment;
import com.ptithcm.quanlybanxe.model.CommentDTO;

import java.util.List;

public interface CommentService {
    Comment saveComment(String productID, CommentDTO commentDTO);
    List<Comment> findAllComment();
    List<Comment> findAllCommentByIdProduct(String productID);
    //Add comment
    Comment addComment(Comment comment);
    void deleteComment(Integer id);
    Comment findCommentByID(Integer id);

}
