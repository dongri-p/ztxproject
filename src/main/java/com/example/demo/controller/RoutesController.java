package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.SeatDto;
import com.example.demo.service.RoutesService;

import jakarta.servlet.http.HttpSession;

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
	
	@PostMapping("/routes/resCheck")
	public String resCheck(
			@RequestParam String routeId,
			@RequestParam String routeDeparture,
			@RequestParam String routeArrival,
			@RequestParam String routeTime,
			@RequestParam String routeArrivalTime,
			@RequestParam Integer resnum, // 선택된 인원
			@RequestParam(required = false, defaultValue = "") String[] goingSelectedSeats,  // 가는편 좌석 배열 기본값
			HttpSession session, Model model) {
				
		return service.resCheck(routeId, routeDeparture, routeArrival, routeTime, routeArrivalTime, resnum, goingSelectedSeats, session, model);
	}
	
	@GetMapping("routes/seats")
	public String showSeatSelection(@RequestParam int routeId, @RequestParam int resnum, Model model) {
		return service.showSeatSelection(routeId, resnum, model);
	}
	
	@PostMapping("/confirmSeats")
	public String confirmSeats(
			@RequestParam int flightId,
			@RequestParam String seatClass,
			@RequestParam String selectedSeats,
			@RequestParam int passengers,  // 추가된 부분
			HttpSession session, Model model) {
		String[] seatArray = selectedSeats.split(",");
		if (seatArray.length != passengers) {
			model.addAttribute("errorMessage", "선택한 좌석 수가 탑승객 수와 일치하지 않습니다.");
			
			return "flight/seats"; // 에러 메시지를 표시하고 좌석 선택 페이지로 돌아갑니다.
		}
		// 선택한 좌석과 탑승객 수 세션에 저장
		model.addAttribute("goingSelectedSeats", seatArray);  // 가는편 좌석 배열
		// 오는편 좌석 선택을 위해 필요한 데이터 전달
		// 예를 들어, 오는편 flightId 등을 세션 또는 모델에 저장
		System.out.println("가는편 선택한 좌석: " + selectedSeats);
		// 오는편 좌석 선택 페이지로 리다이렉트
		return "redirect:/flights/seatsReturn?seatClass=" + seatClass + "&passengers=" + passengers;
	}
	

}
