package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.demo.dto.InquiryDto;
import com.example.demo.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {

    @Autowired
    private InquiryService service;

    @GetMapping("/inquiry/inquiryList")
    public String inquiryList(HttpSession session,HttpServletRequest request, Model model) {
        return service.inquiryList(session,request,model);
    }

    @GetMapping("/inquiry/inquiryWrite")
    public String inquiryWrite(HttpSession session, Model model) {
        return service.inquiryWrite(session, model);
    }

    @PostMapping("/inquiry/inquiryWriteOk")
    public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) {
        return service.inquiryWriteOk(idto, session, model);
    }
    
    @GetMapping("/inquiry/inquiryMyList")
    public String inquiryMyList(HttpSession session, Model model) {
        return service.inquiryMyList(session, model);
    }
}
