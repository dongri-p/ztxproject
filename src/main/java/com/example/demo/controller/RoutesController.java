package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.RoutesService;

@Controller
public class RoutesController {
	@Autowired
	@Qualifier("rs")
	private RoutesService service;
	
	@GetMapping("/routes/search")
	public String routeSearch(@RequestParam String departure, @RequestParam String arrival,
			@RequestParam(required = false) String departureDate,
			@RequestParam(required = false) Integer resnum, Model model) {
		return service.routeSearch(departure, arrival, departureDate, resnum, model);
	}

}
