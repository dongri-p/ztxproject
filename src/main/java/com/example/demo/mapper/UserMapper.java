package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	public Integer useridCheck(String userid);
	public void userOk(UserDto udto);
	public UserDto userView(String userid);
	public void updateOk(String email, String userid);
	public String pwdCheck(String userid);
}
