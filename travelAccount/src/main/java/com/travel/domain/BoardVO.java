package com.travel.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	private Long boardNo;
	private String category;
	private String area;
	private String title;
	private String content;
	private String writer;
	private String photo;
	private String plat; // 위도(null 값이 들어가면 안됨!)
	private String plng; // 경도(null 값이 들어가면 안됨!)
	private Date regDate;
	private Date updateDate;
	private int scrapCnt; // 스크랩수
	private int replyCnt; // 댓글수
	
	// 첨부 파일
	private List<BoardAttachVO> attachList;

	
}
