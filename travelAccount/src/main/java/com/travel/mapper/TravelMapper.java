package com.travel.mapper;

import java.util.List;

import com.travel.domain.AccountVO;
import com.travel.domain.TravelDateDTO;
import com.travel.domain.TravelVO;

public interface TravelMapper {

	// 내 여행 목록
	public List<TravelVO> getTravelList(String id);
	
	// 특정 여행 조회
	public TravelVO get(Long travelNo);
	
	// 여행 등록
	public void insertSelectKey(TravelVO travel);

	// 여행 수정
	public int update(TravelVO travel);
	
	// 여행 삭제
	public int delete(Long travelNo);
	
	
}
