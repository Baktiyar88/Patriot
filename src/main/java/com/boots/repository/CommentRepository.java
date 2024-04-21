package com.boots.repository;

import com.boots.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    // Находим комментарии по идентификатору новости
    List<Comment> findByNewsId(Long newsId);

    @Transactional
    void deleteById(Long id);
}