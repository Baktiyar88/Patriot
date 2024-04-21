package com.boots.controller;



import com.boots.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;




import com.boots.service.CommentService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;


    @GetMapping("/admin")
    public String userList(Model model) {
        model.addAttribute("allUsers", userService.allUsers());
        return "admin";
    }


    @DeleteMapping("/admin/comments/delete/{commentId}")
    @PreAuthorize("hasRole('ADMIN')")
    public String deleteComment(@PathVariable Long commentId, RedirectAttributes redirectAttributes) {
        try {
            commentService.deleteComment(commentId);
            redirectAttributes.addFlashAttribute("successMessage", "Comment deleted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting comment");
        }
        return "redirect:/news" ;  // Redirect to the page where you list comments or to any other relevant page
    }



    @PostMapping("/admin")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,
                              Model model) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/admin";
    }

    @GetMapping("/admin/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }

    @PostMapping("/admin/changeRole")
    public String changeUserRole(@RequestParam("userId") Long userId,
                                 @RequestParam("roleName") String roleName,
                                 @RequestParam("action") String action) {
        if ("add".equals(action)) {
            userService.addRoleToUser(userId, roleName);
        } else if ("remove".equals(action)) {
            userService.removeRoleFromUser(userId, roleName);
        }
        return "redirect:/admin";
    }

}

