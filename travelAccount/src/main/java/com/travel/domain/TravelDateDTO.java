package com.travel.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TravelDateDTO {
	
	private Long travelNo;
	
	private Date startDate;
	private Date endDate;
	
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private boolean prev, next; // 이전페이지/이후페이지

}
