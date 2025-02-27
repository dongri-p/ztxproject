package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;
import com.example.demo.mapper.LoginMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper mapper;

	@Override
	public String login(HttpServletRequest request, Model model)
	{
		
		String err=request.getParameter("err");
		
		model.addAttribute("err", err);
		
		return "/login/login";
	}

	@Override
	public String loginOk(UserDto udto, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
	{
		return "redirect:/main/index";
	}
	
	@Override
	public String logout(HttpSession session)
	{	
		session.invalidate();
		
		return "redirect:/main/index";
	}

	@Override
	public String fUserid()
	{
		return "/login/fUserid";
	}
	
	@Override
	public String getUserid(UserDto udto)
	{
		String userid=mapper.getUserid(udto);
		if(userid == null)
		{
			System.out.println("null");
		}
		else
		{
			System.out.println(userid.length());
		}
		System.out.println("userid:"+userid);
		
		return userid;
	}
	

}
