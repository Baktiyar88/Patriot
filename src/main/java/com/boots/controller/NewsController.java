package com.boots.controller;


import com.boots.entity.News;
import com.boots.entity.Comment;
import com.boots.entity.Category;
import com.boots.service.NewsService;
import com.boots.service.CommentService;
import com.boots.service.CategoryService;
import com.boots.model.NewsForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.springframework.ui.Model;
import java.util.List;
import org.springframework.security.core.Authentication;
import com.boots.service.UserService;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;
import com.boots.util.PathUtils;


import org.springframework.web.multipart.MultipartFile;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.IOException;
import org.apache.commons.lang3.StringUtils;



// Импорты для ваших собственных классов NewsForm и News




@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/news/add")
    public String showAddNewsForm(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        model.addAttribute("newsForm", new NewsForm()); // Если используете форму с DTO
        return "addNews";
    }



    @GetMapping("/category/{categoryId}")
    public String listNewsByCategory(@PathVariable Long categoryId, Model model) {
        List<News> newsList = newsService.findByCategoryId(categoryId);
        model.addAttribute("newsList", newsList);
        model.addAttribute("categories", categoryService.findAll());  // Убедитесь, что категории тоже загружаются
        return "news-list";  // Имя вашего JSP файла
    }


    @GetMapping
    public String listNews(Model model, Authentication authentication) {
        List<News> newsList = newsService.findAll();
        List<Category> categories = categoryService.findAll();
        model.addAttribute("newsList", newsList);
        model.addAttribute("categories", categories);
        // Проверка наличия роли АДМИН у текущего пользователя
        boolean isAdmin = authentication.getAuthorities().stream()
                .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ROLE_ADMIN"));

        model.addAttribute("isAdmin", isAdmin);

        return "news-list";
    }



@GetMapping("/{id}")
public String newsDetail(@PathVariable Long id, Model model) {
    News news = newsService.findById(id).orElse(null);
    List<Comment> comments = commentService.findByNewsId(id);
    model.addAttribute("news", news);
    model.addAttribute("comments", comments);
    // Добавляем новый пустой комментарий в модель для формы
    model.addAttribute("comment", new Comment());
    return "news-detail";
}



//@PostMapping("/add")
//public String addNews(@ModelAttribute NewsForm newsForm, RedirectAttributes redirectAttributes) {
//    MultipartFile file = newsForm.getImage();
//    if (!file.isEmpty()) {
//        String fileName = PathUtils.cleanPath(file.getOriginalFilename());
//
//        // Создание директории для загрузки, если она не существует
//        Path uploadDirectory = Paths.get("uploads");
//        if (!Files.exists(uploadDirectory)) {
//            try {
//                Files.createDirectories(uploadDirectory);
//            } catch (IOException e) {
//                e.printStackTrace();
//                redirectAttributes.addFlashAttribute("message", "Ошибка при создании директории для загрузки.");
//                return "redirect:/news/add";
//            }
//        }
//
//        // Сохранение файла в директории
//        Path path = uploadDirectory.resolve(fileName);
//        try {
//            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//
//            // После успешного сохранения файла, сохраните данные новости (включая путь к файлу) в базе данных
//            News news = new News();
//            news.setTitle(newsForm.getTitle());
//            news.setContent(newsForm.getContent());
//            // Здесь сохраняем только имя файла или относительный путь для упрощения доступа к файлу
//            news.setImagePath(fileName);
//            newsService.save(news);
//
//            redirectAttributes.addFlashAttribute("message", "Новость с фотографией успешно добавлена!");
//        } catch (IOException e) {
//            e.printStackTrace();
//            redirectAttributes.addFlashAttribute("message", "Ошибка при загрузке файла.");
//            return "redirect:/news/add";
//        }
//    } else {
//        redirectAttributes.addFlashAttribute("message", "Файл для загрузки не может быть пустым.");
//    }
//    return "redirect:/news";
//}

    @PostMapping("/add")
    public String addNews(@ModelAttribute NewsForm newsForm, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            List<Category> categories = categoryService.findAll();
            redirectAttributes.addFlashAttribute("categories", categories);
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.newsForm", bindingResult);
            redirectAttributes.addFlashAttribute("newsForm", newsForm);
            return "redirect:/news/add";
        }

        String fileName = null;
        MultipartFile file = newsForm.getImage();
        if (file != null && !file.isEmpty()) {
            fileName = PathUtils.cleanPath(file.getOriginalFilename());
            Path uploadDirectory = Paths.get("uploads");

            if (!Files.exists(uploadDirectory)) {
                try {
                    Files.createDirectories(uploadDirectory);
                } catch (IOException e) {
                    redirectAttributes.addFlashAttribute("message", "Не удалось создать директорию для загрузки.");
                    return "redirect:/news/add";
                }
            }

            Path filePath = uploadDirectory.resolve(fileName);
            try {
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException e) {
                redirectAttributes.addFlashAttribute("message", "Ошибка при сохранении файла.");
                return "redirect:/news/add";
            }
        }

        News news = new News();
        news.setTitle(newsForm.getTitle());
        news.setContent(newsForm.getContent());
        if (fileName != null) {
            news.setImagePath(fileName);
        }

        Category category = categoryService.findById(newsForm.getCategoryId()).orElse(null);
        news.setCategory(category);

        newsService.save(news);

        redirectAttributes.addFlashAttribute("message", "Новость успешно добавлена!");
        return "redirect:/news";
    }

    @PostMapping("/{id}/edit")
    public String editNews(@PathVariable Long id, @ModelAttribute News news) {
        News existingNews = newsService.findById(id).orElse(null);
        if (existingNews != null) {
            existingNews.setTitle(news.getTitle());
            existingNews.setContent(news.getContent());
            newsService.save(existingNews);
        }
        return "redirect:/news";
    }
    @PostMapping("/{newsId}/comment")
    public String addComment(@PathVariable Long newsId, @Valid @ModelAttribute Comment comment, BindingResult result, Authentication authentication, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            // Обрабатываем ошибки валидации
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.comment", result);
            redirectAttributes.addFlashAttribute("comment", comment);
            return "redirect:/news/" + newsId;
        }
        return newsService.findById(newsId).map(news -> {
            String username = authentication.getName();
            return userService.findUserByUsername(username).map(user -> {
                comment.setUser(user);
                comment.setNews(news);
                commentService.save(comment);
                return "redirect:/news/" + newsId;
            }).orElse("redirect:/login");
        }).orElse("redirect:/news");

    }


    @PostMapping("/{id}/delete")
    public String deleteNews(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            newsService.deleteById(id);
            redirectAttributes.addFlashAttribute("successMessage", "Новость успешно удалена");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Ошибка при удалении новости");
        }
        return "redirect:/news";
    }




}
