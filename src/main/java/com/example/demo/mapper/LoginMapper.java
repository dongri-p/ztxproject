package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.dto.UserDto;

@Mapper
public interface LoginMapper {
	public String loginOk(UserDto udto);
	public String getUserid(UserDto udto);
	public String getPwd(UserDto udto);
	public int chgPwd(@Param("userid") String userid, @Param("pwd") String newPwd);
	public String loginAdmin(UserDto udto);
}
