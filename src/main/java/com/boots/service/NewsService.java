package com.boots.service;

import com.boots.entity.News;
import com.boots.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class NewsService {

    private final NewsRepository newsRepository;


    public List<News> findByCategoryId(Long categoryId) {
        return newsRepository.findByCategoryId(categoryId);
    }


    public List<News> findAll() {
        return newsRepository.findAll();
    }

    @Autowired
    public NewsService(NewsRepository newsRepository) {
        this.newsRepository = newsRepository;
    }

    public List<News> getAllNews() {
        return newsRepository.findAll();
    }

    public Optional<News> getNewsById(Long id) {
        return newsRepository.findById(id);
    }

    public News saveNews(News news) {
        return newsRepository.save(news);
    }

    public void deleteNews(Long id) {
        newsRepository.deleteById(id);
    }

    public News save(News news) {
        return newsRepository.save(news);
    }

    public Optional<News> findById(Long id) {
        return newsRepository.findById(id);
    }

    public void deleteById(Long id) {
        newsRepository.deleteById(id);
    }

}
