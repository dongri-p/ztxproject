package com.example.demo.dto;

import lombok.Data;

@Data
public class ReservDto {
	private int routeid, seat, resnum;
	private String departure, arrival, departureTime, arrivalTime, routeDeparture, selectedSeats;
	
}
