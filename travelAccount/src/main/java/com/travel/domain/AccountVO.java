package com.travel.domain;



import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class AccountVO {
	
	private Long accountNo; // 등록번호
	private Long travelNo; // 여행번호
	private char type; // 유형(예산/지출)
	private String title; // 항목명
	private String memo; // 메모
	private Long money; // 금액
	private char prepMoney; // 준비비용 여부
	private char method; // 지불방식
	private String category; // 카테고리
	private String photo; // 사진
	private String dateTime; // 일시
	private String plat; // 위치정보(위도)
	private String plng; // 위치정보(경도)
	private Date regDate; // 등록일
	private Date updateDate; // 수정일
	
	// 첨부 파일
	private List<BoardAttachVO> attachList;
	
}
