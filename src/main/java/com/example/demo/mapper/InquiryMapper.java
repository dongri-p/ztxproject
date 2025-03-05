package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.InquiryDto;

@Mapper
public interface InquiryMapper {
	ArrayList<HashMap> inquiryList(String userid);
	void writeOk(InquiryDto idto);
	
}
