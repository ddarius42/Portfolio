package com.caniborrow.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.caniborrow.models.LoginUser;
import com.caniborrow.models.User;
import com.caniborrow.services.UserService;

@Controller
public class UserController {
     //Bring user service functions to the controller
     @Autowired
     private UserService userService;

	//Login page 
    @GetMapping("/")
    public String loginPage(@ModelAttribute("newLogin") LoginUser user) {
        return "login.jsp";
    }
    
    //Login User
    @PostMapping("/login")
    public String loginUser(@Valid @ModelAttribute("newLogin")LoginUser loginUser,
    			BindingResult result,
    			HttpSession session) {
    	//Authenticate User
    	userService.verifyLogin(loginUser, result);
    	if (result.hasErrors()){
    		return "login.jsp";
    	}
    	//Put User in session
    	User LoggedInUser= userService.findByEmail(loginUser.getEmail());
    	session.setAttribute("loggedInUser", LoggedInUser);
    	return "redirect:/dashboard";
    	
    }
    
    //Registration Page
    @GetMapping("/register")
    public String registerPage(@ModelAttribute("newUser") User newUser) {
    	return "registration.jsp";
    }
    
    //Register User
    @PostMapping("/registration")
    public String registerUser(@Valid @ModelAttribute("newUser")User user,
    		BindingResult result,
    		HttpSession session) {
    	//validate user login
    	userService.validate(user, result);
    	if(result.hasErrors()) {
    		return "registration.jsp";
    	}
    	
    	//Register User
    	userService.createUser(user);
    	
    	//session user
    	session.setAttribute("loggedInUser", user);
    	
    	return "redirect:/dashboard";
    
    }
    
    //Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}