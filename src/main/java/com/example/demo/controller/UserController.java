package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.service.UserService;

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
	
}
