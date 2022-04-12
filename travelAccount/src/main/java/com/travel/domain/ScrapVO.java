package com.travel.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ScrapVO {
	
	private Long scrapNo;
	private Long boardNo;
	private String scraper;
	private Date scrapDate;
}
