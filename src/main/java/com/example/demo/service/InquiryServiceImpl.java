package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.InquiryMapper;

import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("iq")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper mapper;

	@Override
	public String inquiryList(HttpSession session, Model model) 
	{
		
			return "/inquiry/inquiryList";
		
	}

	@Override
	public String inquiryWrite(HttpSession session, Model model) 
	{
		return "redirect:/inquiry/inquiryWrite";
	}
}
