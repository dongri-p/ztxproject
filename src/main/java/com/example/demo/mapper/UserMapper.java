package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	public Integer useridCheck(String userid);

}
