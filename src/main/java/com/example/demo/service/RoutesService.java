package com.example.demo.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

public interface RoutesService {
	String routeSearch(
			String departure, String arrival, String departureDate,
			Integer resnum, Model model);
	String resCheck(String routeId, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, Integer resnum, String[] goingSelectedSeats, HttpSession session, Model model);
	String showSeatSelection(int routeId, int resnum, Model model);
	
	
}
