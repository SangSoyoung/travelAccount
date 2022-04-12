package com.travel.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TravelVO {
	
	private Long travelNo;
	private String title;
	private String memo;
	private String area;
	private String startDate;
	private String endDate;
	private String photo;
	private Date regDate;
	private Date updateDate;
	private String id;
	
	private String[] travelDays; // 여행일 저장 배열
	
	// 첨부 파일
	private List<BoardAttachVO> attachList;

}
