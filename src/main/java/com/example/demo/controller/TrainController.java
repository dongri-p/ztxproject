package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import com.example.demo.service.TrainService;

@Controller
public class TrainController {
	@Autowired
	@Qualifier("ts")
	private TrainService service;
	

}
