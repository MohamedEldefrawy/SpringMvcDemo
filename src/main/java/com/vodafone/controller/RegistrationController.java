package com.vodafone.controller;

import com.vodafone.model.User;
import com.vodafone.model.dto.CreateUser;
import com.vodafone.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/users")
public class RegistrationController {
    private final UserService userService;

    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("registration.htm")
    public String registration(Model model) {
        model.addAttribute("user", new CreateUser());
        return "registration";
    }

    @PostMapping("registration.htm")
    public String addUser(@Valid @ModelAttribute("user") CreateUser user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            Map<String, Object> model = bindingResult.getModel();
            System.out.println(model);
            return "registration";
        }

        User newUser = new User();
        newUser.setFirstName(user.getFirstName());
        newUser.setLastName(user.getLastName());
        newUser.setSalary(user.getSalary());
        userService.save(newUser);
        return "redirect:/users/users.htm";
    }

    @GetMapping("/users.htm")
    public String getUsers(Model model) {
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "users";
    }
}
