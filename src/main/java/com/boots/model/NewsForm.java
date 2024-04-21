package com.boots.model;



import org.springframework.web.multipart.MultipartFile;

public class NewsForm {
    private String title;
    private String content;
    private MultipartFile image; // Для загрузки файла изображения

    private Long categoryId; // ID выбранной категории
    // Геттеры и сеттеры
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }
    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }
}
