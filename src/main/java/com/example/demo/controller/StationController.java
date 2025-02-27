package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.StationsDto;
import com.example.demo.service.TrainService;

@RestController
public class StationController {
	
	@Autowired
	@Qualifier("ts")
	private TrainService tservice;
	
	@GetMapping("/train/stations")
    public List<StationsDto> getAllAirports() {
        return tservice.getAllstations();
    }

}
