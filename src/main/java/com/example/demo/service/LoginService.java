package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface LoginService {
	String login(HttpServletRequest request, Model model);
	String loginOk(UserDto udto, HttpServletRequest request, HttpServletResponse response, HttpSession session);
	String logout(HttpSession session);
	String fUserid();
	String getUserid(UserDto udto);
	String fPassword();
	String getPwd(UserDto udto) throws Exception;
	
}
