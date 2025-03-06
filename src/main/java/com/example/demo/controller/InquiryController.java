package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {

	@Autowired
	@Qualifier("iq")
	private InquiryService service;
	
	@GetMapping("/inquiry/inquiryMain")
	public String inquiryMain()
	{
		return "/inquiry/inquiryMain";
	}
	
	@GetMapping("/inquiry/inquiryList")
	public String inquiryList(HttpSession session,Model model)
	{
		return service.inquiryList(session,model);
	}
	
	@GetMapping("/inquiry/inquiryWrite")
	public String inquiryWrite(HttpSession session,Model model)
	{
		return service.inquiryWrite(session,model);
	}
	
	@GetMapping("/inquiry/inquiryWriteOk")
	public String inquiryWriteOk(InquiryDto idto, HttpSession session,Model model)
	{
		return service.inquiryWriteOk(idto,session,model);
	}
	
}
