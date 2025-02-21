package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.example.demo.service.MainService;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	@Autowired
	@Qualifier("ms")
	private MainService service;
	
	@GetMapping("/")
	public String home() {
		return "redirect:/main/index";
	}
	
	@GetMapping("/main/index")
	public String index(HttpServletRequest request, Model model) {
		return service.index(request, model);
	}
	
}
