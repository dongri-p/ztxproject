package com.example.demo.dto;

import lombok.Data;

@Data
public class ReservDto {
	private int reservid;
	private int routeid, seatid, resnum, charge, payment, state, resid;
	private String routeDeparture, routeArrival, routeTime, routeArrivalTime, selectedSeats, reservday, PNR;
	
	// 기본 생성자
	public ReservDto() {
		
	}
	
	// 예약 DTO 생성자 (선택적으로 작성 가능)
	public ReservDto(int routeid, String routeDeparture, String routeArrival, String routeTime,
			String routeArrivalTime, int resnum, String PNR) {
		this.routeid = routeid;
		this.routeDeparture = routeDeparture;
		this.routeArrival = routeArrival;
		this.routeTime = routeTime;
		this.routeArrivalTime = routeArrivalTime;
		this.resnum = resnum;
		this.PNR = PNR;
	}
	
}
