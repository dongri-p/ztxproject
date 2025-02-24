package com.example.demo.service;

import jakarta.servlet.http.HttpServletRequest;

public interface UserService {
	String user();
	String useridCheck(HttpServletRequest request);

}
