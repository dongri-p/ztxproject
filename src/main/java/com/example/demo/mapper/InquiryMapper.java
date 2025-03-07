package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.UserDto;
import java.util.List;

@Mapper
public interface InquiryMapper {
   public List<InquiryDto> inquiryList(@Param("userid") String userid, int index);
   public UserDto getMemberinfo(@Param("userid") String userid);
   public void inquiryWriteOk(InquiryDto idto);
   public InquiryDto readnum(@Param("id") int id);
   public int getChong(String id);
}
