package com.example.demo.service;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;

public interface InquiryService {

	public String inquiryList(HttpSession session,Model model);
	public String inquiryWrite(HttpSession session,Model model);
}
