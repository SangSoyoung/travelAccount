package com.travel.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PreviewVO {
	
	private Date today; // 오늘날짜
	private Date yesterday; // 어제날짜
}
