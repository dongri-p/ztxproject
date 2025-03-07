package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dto.InquiryDto;
import com.example.demo.dto.UserDto;
import com.example.demo.mapper.InquiryMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryMapper mapper;

    @Override
    public String inquiryList(HttpSession session,HttpServletRequest request,Model model) {
        
    	String id=request.getParameter("id");
    	
    	int page=1;
    	if(request.getParameter("page")!=null)
    	{
    		page=Integer.parseInt(request.getParameter("page"));
    	}
    	
    	int index=(page-1)*20;
    	
    	int istart,iend,chong;
    	
    	istart=page/10;
    	if(page%10==0)
    		istart--;
    	
    	istart=istart*10+1;
    	iend=istart+9;
    	
    	chong=mapper.getChong(id);
    	
    	if(iend>chong)
    		iend=chong;
    	
    	model.addAttribute("id",id);
    	model.addAttribute("istart",istart);
    	model.addAttribute("iend",iend);
    	model.addAttribute("chong",chong);
    	
    	String userid = (session.getAttribute("userid") != null) 
                        ? session.getAttribute("userid").toString() 
                        : "guest"; // ✅ 비회원일 경우 기본값 설정

        List<InquiryDto> inquiries = mapper.inquiryList(userid, index);
        model.addAttribute("mapAll", inquiries);
        return "/inquiry/inquiryList";
    }


    @Override
    public String inquiryWrite(HttpSession session, Model model) 
    {
        if (session.getAttribute("userid") != null) {
            String userid = session.getAttribute("userid").toString();
            UserDto udto = mapper.getMemberinfo(userid);
            model.addAttribute("udto", udto);
        }
        return "/inquiry/inquiryWrite";
    }

    @Override
    public String inquiryWriteOk(InquiryDto idto, HttpSession session, Model model) 
    {
        String userid = (session.getAttribute("userid") != null) 
                        ? session.getAttribute("userid").toString() 
                        : "guest";

        idto.setUserid(userid);
        if (!userid.equals("guest")) 
        {
            idto.setPwd(null);
        }

        mapper.inquiryWriteOk(idto);
        return "redirect:/inquiry/inquiryList";
    }


	@Override
	public String inquiryMyList(HttpSession session, Model model) 
	{
		
		
		return "inquiry/inquiryMyList";
	}
}
