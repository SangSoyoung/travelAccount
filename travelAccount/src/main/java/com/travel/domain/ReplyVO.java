package com.travel.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long replyNo;
	private Long boardNo;
	private String reply;
	private String replyer;
	private Date regDate;
	private Date updateDate;

}
