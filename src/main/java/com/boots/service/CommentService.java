package com.boots.service;

import com.boots.entity.Comment;
import com.boots.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    private final CommentRepository commentRepository;

    @Autowired
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public List<Comment> getCommentsByNewsId(Long newsId) {
        return commentRepository.findByNewsId(newsId);
    }

    public Comment saveComment(Comment comment) {
        return commentRepository.save(comment);
    }

    public void deleteComment(Long commentId) {
        commentRepository.deleteById(commentId);
    }


    public List<Comment> findByNewsId(Long newsId) {
        return commentRepository.findByNewsId(newsId);
    }

    public Comment save(Comment comment) {
        return commentRepository.save(comment);
    }



}
