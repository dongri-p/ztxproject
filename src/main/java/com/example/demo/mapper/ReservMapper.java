package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.ReservDto;

@Mapper
public interface ReservMapper {
	void addReserv(ReservDto resDto);
	int getSeatid(String trim, int routeid);
	void upTrainSeatAvai(@Param("routeid") int routeid, @Param("seatid") int seatid,
			@Param("reservid") int reservid);
	void upRouteSeat(int routeid, int resnum);
	
	
}
