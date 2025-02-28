package com.example.demo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.RoutesDto;
import com.example.demo.mapper.RoutesMapper;

@Service("rs")
public class RoutesServiceImpl implements RoutesService {
	@Autowired
	private RoutesMapper mapper;
	
	@Override
	public String routeSearch(@RequestParam String departure, @RequestParam String arrival,
			@RequestParam(required = false) String departureDate,
			@RequestParam(required = false) Integer resnum, Model model) {
		LocalDate today = LocalDate.now();
		
		List<RoutesDto> departingRoutes=mapper.findRoutes(departure, arrival, departureDate, resnum);
		
		model.addAttribute("today", today);
		model.addAttribute("routes", departingRoutes);
		model.addAttribute("resnum", resnum);
		
		// 검색 결과를 보여줄 JSP 파일로 이동
		return "routes/search";
	}

}
