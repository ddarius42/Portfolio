package com.javasolo.javaproject.controllers;

import com.javasolo.javaproject.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    // Bring user service functions to the controller
    // @Autowired
    // private UserService userService;

    @GetMapping("/")
    public String loginRegister() {
        return "login.jsp";
    }
}
