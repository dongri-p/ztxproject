package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.dto.StationsDto;
import com.example.demo.mapper.TrainMapper;

@Service
@Qualifier("ts")
public class TrainServiceImpl implements TrainService{
	@Autowired
	private TrainMapper mapper;

	@Override
	public List<StationsDto> getAllstations() {
		return mapper.findAllStations();
	}

}
