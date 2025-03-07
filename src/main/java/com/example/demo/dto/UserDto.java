package com.example.demo.dto;

import lombok.Data;

@Data
public class UserDto {
	private int id,state;
	private String userid,pwd,email,phone,name,writeday,oldPwd,adminid;
}
