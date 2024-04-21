package com.boots.repository;

import com.boots.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    // Удален дублирующий метод, оставлен метод возвращающий Optional
    Optional<User> findByUsername(String username);

    // Метод для поиска пользователя по электронной почте
    Optional<User> findByEmail(String email);
}
