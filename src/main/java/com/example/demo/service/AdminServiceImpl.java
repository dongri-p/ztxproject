package com.example.demo.service;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{

	@Override
	public String adminIndex(HttpServletRequest request, Model model) {
		return "/admin/index";
	}

}
