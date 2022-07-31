package com.codingdojo.mvc.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.mvc.models.User;
import com.codingdojo.mvc.requests.UserLogin;
import com.codingdojo.mvc.services.UserService;




@Controller
public class AuthController {

	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String registerView(Model model) {
		if(!model.containsAttribute("newUser")) {
			model.addAttribute("newUser", new User());
		}
		if(!model.containsAttribute("userLogin")) {
			model.addAttribute("userLogin", new UserLogin());
		}
		return "newUser.jsp";
	}
	
	@PostMapping("/register")
	public String registerAction(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult bindingResult,
			RedirectAttributes redirectAttribute,
			HttpSession session,
			Model model) {
		User user=userService.createUser(newUser, bindingResult);
		if(user==null) {
			redirectAttribute.addFlashAttribute("newUser",newUser);
			redirectAttribute.addFlashAttribute("org.springframework.validation.BindingResult.newUser",bindingResult);
			return "redirect:/";
		}else {
			//make user log in automatically just using Session with id
			session.setAttribute("user_id", user.getId());
			return "redirect:/loginChecker";
		}
		
	}
	
	@GetMapping("/loginChecker")
	public String loginChecker() {
		return "loginChecker.jsp";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("userLogin") UserLogin userLogin,
			BindingResult bindingResult,
			RedirectAttributes redirectAttribute,
			HttpSession session,
			Model model
			
			) {
		
		if(bindingResult.hasErrors()) {
			
			redirectAttribute.addFlashAttribute("userLogin",userLogin);
			redirectAttribute.addFlashAttribute("org.springframework.validation.BindingResult.userLogin",bindingResult);
			return "redirect:/";
		}
	
		User user=userService.login(userLogin, bindingResult);

		if(user == null) {
			redirectAttribute.addFlashAttribute("userLogin",userLogin);
			redirectAttribute.addFlashAttribute("org.springframework.validation.BindingResult.userLogin",bindingResult);
			return "redirect:/";
		}else {
			
			//to get user name 
			session.setAttribute("username", user.getUsername()); 
			session.setAttribute("user_id",user.getId());
			return "redirect:/loginChecker";

		}
	}

	
	//logout 
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		 HttpSession session = request.getSession(false);
		    if (session != null) {
		        session.invalidate();
		    }
		    return "redirect:/"; 
		}
	
	
}
	
				
		

	

