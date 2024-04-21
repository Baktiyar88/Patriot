package com.boots.config;

import com.boots.entity.Category;
import com.boots.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class DataInitializer {

    @Autowired
    private CategoryRepository categoryRepository;

    @EventListener
    public void appReady(ApplicationReadyEvent event) {
        List<String> categories = Arrays.asList("Спорт", "Политика", "Мир");
        categories.forEach(name -> {
            // Изменено с isEmpty() на !isPresent() для совместимости с Java 8
            if (!categoryRepository.findByName(name).isPresent()) {
                Category category = new Category();
                category.setName(name);
                categoryRepository.save(category);
            }else {
                // Логирование может помочь понять, почему данные пытаются добавиться повторно
                System.out.println("Категория уже существует: " + name);
            }
        });
    }
}
