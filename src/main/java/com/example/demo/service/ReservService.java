package com.example.demo.service;

import org.springframework.ui.Model;

public interface ReservService {
	String reservCheck(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, String selectedSeats, Model model);
	String reservConfirm(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, String selectedSeats, Model model);
	
	
}