package com.example.demo.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;
import com.example.demo.mapper.RoutesMapper;

import jakarta.servlet.http.HttpSession;

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
	
	@Override
	public String resCheck(@RequestParam String routeId, @RequestParam String routeDeparture,
			@RequestParam String routeArrival, @RequestParam String routeTime,
			@RequestParam String routeArrivalTime, @RequestParam Integer resnum, // 선택된 인원
			@RequestParam(required = false, defaultValue = "") String[] goingSelectedSeats,  // 가는편 좌석 배열 기본값
			HttpSession session, Model model) {
		// 가는편 정보를 모델에 추가
		model.addAttribute("routeId", routeId);
		model.addAttribute("routeDeparture", routeDeparture);
		model.addAttribute("routeArrival", routeArrival);
		model.addAttribute("routeTime", routeTime);
		model.addAttribute("routeArrivalTime", routeArrivalTime);
		// 인원 정보 모델에 추가
		model.addAttribute("resnum", resnum);
		// 세션에 가는편과 오는편 비행기 ID를 저장합니다.
		session.setAttribute("routeId", routeId);
		model.addAttribute("goingSelectedSeats", goingSelectedSeats);
		// 선택 확인 페이지로 이동
		
		return "routes/resCheck";
	}
	
	@GetMapping("routes/seats")
	public String showSeatSelection(
			@RequestParam int routeId,
			@RequestParam int resnum,  // 추가된 부분
			Model model) {
		List<SeatDto> avaiSeats = mapper.getAvaiSeats(routeId);
		// 좌석 데이터의 크기를 출력하여 데이터가 조회되는지 확인
		System.out.println("Available seats count: " + avaiSeats.size());
		
		model.addAttribute("seats", avaiSeats);
		model.addAttribute("routeId", routeId);
		model.addAttribute("resnum", resnum);  // 추가된 부분
		
		return "routes/seats";  // 이 경로에 JSP가 있어야 함
	}
	
	@PostMapping("/confirmSeats")
	public String confirmSeats(
			@RequestParam int routeId,
			@RequestParam String selectedSeats,
			@RequestParam int resnum,  // 추가된 부분
			HttpSession session, Model model) {
		String[] seatArray = selectedSeats.split(",");
		if (seatArray.length != resnum) {
			model.addAttribute("errorMessage", "선택한 좌석 수가 탑승객 수와 일치하지 않습니다.");
			
			return "flight/seats"; // 에러 메시지를 표시하고 좌석 선택 페이지로 돌아갑니다.
		}
		// 선택한 좌석과 탑승객 수 세션에 저장
		model.addAttribute("goingSelectedSeats", seatArray);  // 가는편 좌석 배열
		// 오는편 좌석 선택을 위해 필요한 데이터 전달
		// 예를 들어, 오는편 flightId 등을 세션 또는 모델에 저장
		System.out.println("가는편 선택한 좌석: " + selectedSeats);
		// 오는편 좌석 선택 페이지로 리다이렉트
		return "redirect:/flights/seatsReturn?&resnum=" + resnum;
	}
	
	
}
