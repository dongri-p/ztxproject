package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dto.UserDto;
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

	@Override
	public String userOk(UserDto udto) {
		
		Integer u=mapper.useridCheck(udto.getUserid());
		
		if(u == 0)
		{
			mapper.userOk(udto);
			return "redirect:/login/login";
		}
		else
		{
			return "redirect:/user/user?err=1";
		}
	}
	
}
