package com.example.demo.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.ReservDto;
import com.example.demo.mapper.ReservMapper;
import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private ReservMapper rmapper;

	@Override
	public String adminIndex(HttpServletRequest request, Model model) {
		return "/admin/index";
	}

	@Override
	public String reservList(String selectedDate, Integer seoulPage, Integer pusanPage, Integer otherPage, Integer page,
			Model model) {
		int itemsPerPage = 5; // 페이지당 항목 수

        // 페이지 번호가 null이거나 1보다 작으면 기본값으로 설정
        if (page == null || page < 1) {
            page = 1;
        }
        if (seoulPage == null || seoulPage < 1) {
        	seoulPage = 1;
        }
        if (pusanPage == null || pusanPage < 1) {
        	pusanPage = 1;
        }
        if (otherPage == null || otherPage < 1) {
            otherPage = 1;
        }

        // 선택한 날짜가 있을 경우 해당 날짜에 맞는 예약 데이터만 가져오기
        List<ReservDto> rsvList;
        if (selectedDate != null && !selectedDate.isEmpty()) {
            rsvList = rmapper.getRsvByDate(selectedDate);  // 특정 날짜의 예약 내역 가져오기
        }
        else {
            rsvList = rmapper.getRsvanow();  // 선택한 날짜가 없으면 현재 이후 예약 내역 가져오기
        }

        // 전체 예약 내역에 대한 페이징 처리
        int totalItems = rsvList.size();
        List<ReservDto> pagedRsvList = paginateList(rsvList, page, itemsPerPage);
        int totalPages = calculateTotalPages(totalItems, itemsPerPage);
        model.addAttribute("rsvList", pagedRsvList);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);

        // seoul, pusan, 기타 출발 항공편 필터링 및 페이징 처리
        List<ReservDto> seoulList = rsvList.stream().filter(rsv -> rsv.getRouteDeparture().equals("seoul")).collect(Collectors.toList());
        int seoulTotalItems = seoulList.size();
        List<ReservDto> seoulRsv = paginateList(seoulList, seoulPage, itemsPerPage);
        int seoulTotalPages = calculateTotalPages(seoulTotalItems, itemsPerPage);
        model.addAttribute("seoulRsv", seoulRsv);
        model.addAttribute("seoulTotalPages", seoulTotalPages);
        model.addAttribute("seoulCurrentPage", seoulPage);

        List<ReservDto> pusanList = rsvList.stream().filter(rsv -> rsv.getRouteDeparture().equals("pusan")).collect(Collectors.toList());
        int pusanTotalItems = pusanList.size();
        List<ReservDto> pusanRsv = paginateList(pusanList, pusanPage, itemsPerPage);
        int pusanTotalPages = calculateTotalPages(pusanTotalItems, itemsPerPage);
        model.addAttribute("pusanRsv", pusanRsv);
        model.addAttribute("pusanTotalPages", pusanTotalPages);
        model.addAttribute("pusanCurrentPage", pusanPage);

        List<ReservDto> otherList = rsvList.stream().filter(rsv -> !rsv.getRouteDeparture().equals("seoul") && !rsv.getRouteDeparture().equals("pusan")).collect(Collectors.toList());
        int otherTotalItems = otherList.size();
        List<ReservDto> otherRsv = paginateList(otherList, otherPage, itemsPerPage);
        int otherTotalPages = calculateTotalPages(otherTotalItems, itemsPerPage);
        model.addAttribute("otherRsv", otherRsv);
        model.addAttribute("otherTotalPages", otherTotalPages);
        model.addAttribute("otherCurrentPage", otherPage);

        // 좌석 수 정보를 추가로 가져오기
        List<Map<String, Object>> availableSeatsList = rmapper.getAvaiSeatCountByRouteid();
        Map<Integer, Integer> availableSeatsMap = new HashMap<>();
        for (Map<String, Object> availableSeat : availableSeatsList) {
            availableSeatsMap.put((Integer) availableSeat.get("flight_id"), ((Long) availableSeat.get("availableSeats")).intValue());
        }
        model.addAttribute("availableSeatsMap", availableSeatsMap);

        model.addAttribute("selectedDate", selectedDate);

        return "/admin/reservList";
	}

	private List<ReservDto> paginateList(List<ReservDto> list, Integer page, int itemsPerPage) {
		int startIndex = (page - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, list.size());
        return (startIndex >= list.size()) ? Collections.emptyList() : list.subList(startIndex, endIndex);
	}
	private int calculateTotalPages(int totalItems, int itemsPerPage) {
        return (int) Math.ceil((double) totalItems / itemsPerPage);
    }

}
