package com.example.demo.service;

import com.example.demo.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;

public interface UserService {
	String user();
	String useridCheck(HttpServletRequest request);
	String userOk(UserDto udto);

}
