package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.UserDto;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	@Qualifier("us")
	private UserService service;
	
	@GetMapping("/user/user")
	public String user()
	{
		return service.user();
	}
	
	@GetMapping("/user/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request)
	{
		return service.useridCheck(request);
	}
	
	@PostMapping("/user/userOk")
	public String userOk(UserDto udto)
	{
		return service.userOk(udto);
	}
	
	@GetMapping("/user/userView")
	public String userView(HttpSession session, Model model)
	{
		return service.userView(session, model);
	}
	
}
