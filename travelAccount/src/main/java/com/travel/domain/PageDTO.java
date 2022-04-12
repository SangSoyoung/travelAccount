package com.travel.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private boolean prev, next; // 이전페이지/이후페이지
	
	private int total; // 전체 데이터 수
	private Criteria cri;
	
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		// 페이지당 
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
