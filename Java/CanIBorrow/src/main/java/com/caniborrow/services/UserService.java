package com.caniborrow.services;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.caniborrow.models.LoginUser;
import com.caniborrow.models.User;
import com.caniborrow.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	//validate user duplicate email and Password match Registration
	public void validate(User newUser, Errors errors) {
		//email
		if(userRepo.findByEmail(newUser.getEmail())!= null) {
			errors.rejectValue("email", "taken", "This email has already been taken. Please Log in!");
		}
		
		//Password
		if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			errors.rejectValue("confirmPassword", "mismatch", "Passwrods did not mathc please try again!");
		}
	}
	
	//Authenticate User Login
	public boolean verifyLogin(LoginUser newLogin,Errors errors) {
		User user=userRepo.findByEmail(newLogin.getEmail());
		
		if(user==null) {
			errors.rejectValue("email", "incorrect", "This email does not exist. Try Again or Register!");
			return false;
		}
		
		else {
			if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
				errors.rejectValue("password", "incorrect", "Password incorect. Try again!");
				return false;
			}
			return true;
		}
	}
	
	
	//Register User
			public User createUser(User newUser){
				String hashedPassword=(BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt() ));
				newUser.setPassword(hashedPassword);
				return userRepo.save(newUser);
			}
			
	//Find user by email
			public User findByEmail(String email) {
				return userRepo.findByEmail(email);
			}
	
	//Find by id
			public User findById(Long id) {
				return userRepo.findById(id).orElse(null);
			}


}
