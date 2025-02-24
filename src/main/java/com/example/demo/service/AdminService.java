package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface AdminService {
	String adminIndex(HttpServletRequest request, Model model);

}
