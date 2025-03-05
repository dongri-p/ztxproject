package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	public Integer useridCheck(String userid);
	public void userOk(UserDto udto);
	public UserDto userView(String userid);
	public void chgEmail(String email, String userid);
}
