package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface LoginService {
	String login(HttpServletRequest request, Model model);
	
}
