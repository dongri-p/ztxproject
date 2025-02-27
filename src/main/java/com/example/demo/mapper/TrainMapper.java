package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.StationsDto;

@Mapper
public interface TrainMapper {
	List<StationsDto> findAllStations();

}
