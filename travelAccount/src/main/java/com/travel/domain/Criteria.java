package com.travel.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 데이터 수
	
	private String type; // 검색 옵션
	private String keyword; // 검색 키워드
	
	// 페이징
	public Criteria() {
		this(1, 12);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 검색
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
	// 검색 파라미터 url 형태 변환
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
