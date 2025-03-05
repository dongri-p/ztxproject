package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.RoutesDto;
import com.example.demo.dto.SeatDto;

@Mapper
public interface RoutesMapper {

	List<RoutesDto> findRoutes(String departure, String arrival, String departureDate, Integer resnum);
	List<SeatDto> getAvaiSeats(int flightId);
	
	
	
}
