package com.example.demo.controller;

import com.example.demo.service.ReservService;
import com.example.demo.service.RoutesService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservController {
	
	@Autowired
	private RoutesService rouService;
	
	@Autowired
	@Qualifier("ress")
	private ReservService resService;
		
	@PostMapping("/reserv/reservCheck")
	public String reservCheck(@RequestParam("routeid") int routeid, @RequestParam("routeDeparture") String routeDeparture,
			@RequestParam("routeArrival") String routeArrival, @RequestParam("routeTime") String routeTime,
			@RequestParam("routeArrivalTime") String routeArrivalTime, @RequestParam("selectedSeats") String selectedSeats,
			@RequestParam("resnum") int resnum, Model model) {
		// 예약 처리 로직 추가
		return resService.reservCheck(routeid, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, selectedSeats, model);
	}
	
	@PostMapping("/reserv/reservConfirm")
	public String reservConfirm(@RequestParam("routeid") int routeid, @RequestParam("routeDeparture") String routeDeparture,
			@RequestParam("routeArrival") String routeArrival, @RequestParam("routeTime") String routeTime,
			@RequestParam("routeArrivalTime") String routeArrivalTime, @RequestParam("selectedSeats") String selectedSeats,
			@RequestParam("resnum") int resnum, Model model) {
		// 예약 처리 로직 추가
		return resService.reservConfirm(routeid, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, selectedSeats, model);
	}
	
	
}