package com.boots.controller;

import com.boots.entity.Category;
import com.boots.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String listCategories(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "category-list";
    }

    @PostMapping
    public String addCategory(@ModelAttribute Category category) {
        categoryService.save(category);
        return "redirect:/category";
    }
}
