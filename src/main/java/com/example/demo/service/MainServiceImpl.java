package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MainMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("ms")
public class MainServiceImpl implements MainService {
	@Autowired
	private MainMapper mapper;

	@Override
	public String index(HttpServletRequest request, Model model) {
		System.out.println(mapper); //경고 제거용
		return "/main/index";
	}

}
