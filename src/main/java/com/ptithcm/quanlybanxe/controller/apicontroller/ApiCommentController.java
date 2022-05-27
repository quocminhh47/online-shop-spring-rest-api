package com.ptithcm.quanlybanxe.controller.apicontroller;

import com.ptithcm.quanlybanxe.entity.Comment;
import com.ptithcm.quanlybanxe.model.CommentDTO;
import com.ptithcm.quanlybanxe.model.Signal;
import com.ptithcm.quanlybanxe.service.CommentService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "api/comment/")
public class ApiCommentController {

    CommentService commentService;

    public ApiCommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @PostMapping(value = "save-{productID}")
    public ResponseEntity<Signal> saveComment(@PathVariable("productID") String productID,
                                              @RequestBody CommentDTO commentDTO) {
       Signal signal = new Signal();
        try {
            System.out.println(productID);
            commentService.saveComment(productID, commentDTO);
            signal.setResponse("OK");
        } catch (Exception e) {
            e.printStackTrace();
            signal.setResponse("FAILED");

        }
        return new ResponseEntity<Signal>(signal, HttpStatus.CREATED);
    }

    @GetMapping(value = "product-{productID}")
    public ResponseEntity<List<Comment>> findAllCmtById(@PathVariable("productID") String productID) {
        return new ResponseEntity<>(commentService.findAllCommentByIdProduct(productID), HttpStatus.OK);
    }

    @GetMapping("all-comment")
    public List<Comment> findAllCMT() {
        return commentService.findAllComment();
    }


}
