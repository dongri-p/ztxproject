package com.example.demo.dto;

import lombok.Data;

@Data
public class SeatDto {
    private int tseatid, routeid;
    private String seatnum;
    private double surcharge;
    private boolean reserv; // 필드 이름 변경
}
