package com.travel.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.domain.BoardAttachVO;
import com.travel.domain.TravelVO;
import com.travel.mapper.BoardAttachMapper;
import com.travel.mapper.TravelMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class TravelServiceImpl implements TravelService {
	
	private TravelMapper mapper;
	private BoardAttachMapper attachMapper;
	
	@Override
	public List<TravelVO> getTravelList(String id) {
		log.info("내 여행 목록..........");
		
		return mapper.getTravelList(id);
	}
	
	

	@Override
	public TravelVO get(Long travelNo) {
		log.info("여행 프로필 조회..........");
		return mapper.get(travelNo);
	}
	@Override
	public List<BoardAttachVO> getAttachList(Long travelNo) {
		log.info(travelNo + "첨부 파일 목록.......");
		return attachMapper.findByTno(travelNo);
	}
	
	
	@Transactional
	@Override
	public void insertSelectKey(TravelVO travel) {
		log.info("여행 등록 + 파일 첨부.......");
		mapper.insertSelectKey(travel);
		
		// 첨부파일
		if(travel.getAttachList() == null || travel.getAttachList().size() <= 0) {
			return;
		}
		
		travel.getAttachList().forEach(attach -> {
			attach.setTravelNo(travel.getTravelNo());
			attachMapper.insertT(attach);
		});
	}

	@Transactional
	@Override
	public boolean update(TravelVO travel) {
		log.info("여행 수정 + 파일첨부 수정하기......." + travel);
		
		attachMapper.deleteAllT(travel.getTravelNo());
		boolean modifyResult = mapper.update(travel) == 1;
		
		if(modifyResult && travel.getAttachList() != null && travel.getAttachList().size() > 0) {
			travel.getAttachList().forEach(attach -> {
				
			attach.setTravelNo(travel.getTravelNo());
			attachMapper.insertT(attach);
			});
		}
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean delete(Long travelNo) {
		log.info(travelNo + " 여행 삭제하기 + 첨부파일 삭제하기.......");
		
		attachMapper.deleteAllT(travelNo);
		return mapper.delete(travelNo) == 1;
	}
	
	
	
	
	




}
