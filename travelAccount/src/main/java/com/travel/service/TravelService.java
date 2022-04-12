package com.travel.service;

import java.util.List;
import com.travel.domain.AccountVO;
import com.travel.domain.BoardAttachVO;
import com.travel.domain.TravelDateDTO;
import com.travel.domain.TravelVO;

public interface TravelService {
	
	// 내 여행 목록
	public List<TravelVO> getTravelList(String id);
	
	// 특정 여행 조회
	public TravelVO get(Long travelNo);
	// 특정여행 첨부파일 조회
	public List<BoardAttachVO> getAttachList(Long travelNo);
		
	// 여행 등록
	public void insertSelectKey(TravelVO travel);

	// 여행 수정
	public boolean update(TravelVO travel);
	
	// 여행 삭제
	public boolean delete(Long travelNo);
	
	
	
	
	

	
	
	

	
}
