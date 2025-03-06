package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface ReservService {
	String booking(int routeid, int resnum, String routeDeparture, String selectedSeats);
	
	
}