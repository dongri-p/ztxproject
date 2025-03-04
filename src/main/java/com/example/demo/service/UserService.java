package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface UserService {
	String user();
	String useridCheck(HttpServletRequest request);
	String userOk(UserDto udto);
	String userView(HttpSession session, Model model);
	String chgEmail(HttpSession session, HttpServletRequest request);

}
