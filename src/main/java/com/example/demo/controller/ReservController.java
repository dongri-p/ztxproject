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
@Qualifier("ress")
public class ReservController {
	
	@Autowired
	private RoutesService rouService;
	
	@Autowired
	private ReservService resService;
		
	@PostMapping("/reserv/booking")
	public String booking(@RequestParam("routeid") int routeid, @RequestParam("resnum") int resnum,
			@RequestParam("routeDeparture") String routeDeparture, @RequestParam("selectedSeats") String selectedSeats) {
		// 예약 처리 로직 추가
		return resService.booking(routeid, resnum, routeDeparture, selectedSeats);
	}
	
	
}