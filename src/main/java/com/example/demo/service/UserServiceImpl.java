package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UserMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("us")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;

	@Override
	public String user() {
		
		return "/user/user";
	}

	@Override
	public String useridCheck(HttpServletRequest request) {
		
		String userid=request.getParameter("userid");
		
		return mapper.useridCheck(userid).toString();
	}
	
}
