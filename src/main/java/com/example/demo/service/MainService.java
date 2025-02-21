package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface MainService {
	String index(HttpServletRequest request, Model model);

}
