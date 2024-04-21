package com.boots.repository;

import com.boots.entity.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List; // Добавьте этот импорт

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {
    List<News> findByCategoryId(Long categoryId); // Теперь 'List' должен быть распознан
    // Обратите внимание на использование нижнего подчеркивания
    //List<News> findByCategory_Id(Long categoryId); // Обратите внимание на использование нижнего подчеркивания

}
