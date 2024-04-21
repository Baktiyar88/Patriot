package com.boots.controller;

import com.boots.entity.User;
import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public String userProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName(); // Получаем имя текущего пользователя

        Optional<User> optionalUser = userService.findUserByUsername(username);
        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            model.addAttribute("user", user); // Добавляем пользователя в модель под именем "user"
        } else {
            // Обработка случая, когда пользователь не найден
            return "redirect:/error";
        }
        return "profile";
    }


    @PostMapping("/profile")
    public String updateUserProfile(User user, RedirectAttributes redirectAttributes) {
        boolean updateSuccess = userService.updateUser(user);
        if(updateSuccess) {
            redirectAttributes.addFlashAttribute("successMessage", "Профиль успешно обновлен");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Ошибка при обновлении профиля");
        }
        return "redirect:/profile";
    }
}

