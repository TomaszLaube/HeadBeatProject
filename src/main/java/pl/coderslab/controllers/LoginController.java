package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.models.User;
import pl.coderslab.services.UserService;
import pl.coderslab.util.BCrypt;

@Controller
@RequestMapping("/login")
@SessionAttributes({"loggedUser"})
public class LoginController {
    @Autowired
    UserService userService;
    @GetMapping("")
    public String loginUser() {
        return "homeViews/login";
    }

    @PostMapping("")
    public String loggedUser(@RequestParam String username, @RequestParam String password, Model model) {
        User temp = (User) userService.findByUsername(username);
        if (temp != null && BCrypt.checkpw(password, temp.getPassword())) {
            model.addAttribute("loggedUser", temp);
            if (temp.getUsername().equals("admin")) {
                return "redirect:/admin";
            }
            return "redirect:/home";
        } else {
            model.addAttribute("notLogged", true);
            return "homeViews/login";
        }
    }
}
