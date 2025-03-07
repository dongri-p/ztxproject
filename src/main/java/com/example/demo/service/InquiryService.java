package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.InquiryDto;

import jakarta.servlet.http.HttpSession;

public interface InquiryService {
	public String inquiryList(HttpSession session,Model model);
	public String inquiryWrite(HttpSession session,Model model);
	public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model);
	public String inquiryMyList(HttpSession session,Model model);
}
