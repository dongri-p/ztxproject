package com.example.demo.service;

import org.springframework.ui.Model;

public interface RoutesService {
	String routeSearch(
			String departure, String arrival, String departureDate,
			Integer resnum, Model model);
	
	
}
