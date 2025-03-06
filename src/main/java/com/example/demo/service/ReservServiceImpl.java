package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.ReservMapper;

@Service
@Qualifier("ress")
public class ReservServiceImpl implements ReservService {
	@Autowired
	private ReservMapper resMapper;

	@Override
	public String booking(int routeid, int resnum, String routeDeparture, String selectedSeats) {
		// 예약 처리 로직 추가
		return "/reserv/booking";
	}
		
	
	
}
