package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.domain.BoardAttachVO;
import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;
import com.travel.mapper.BoardAttachMapper;
import com.travel.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper mapper;
	
	private BoardAttachMapper attachMapper;
	
//	@Override
//	public List<BoardVO> getList(String category) {
//		log.info(category + " 게시판 게시물 목록보기......");
//		return mapper.getList(category);
//	}
	
	@Override
	public List<BoardVO> getList(String category, Criteria cri) {
		log.info(category + " 게시판 게시물 목록 보기 + 페이지 처리......" + cri);
		return mapper.getListWithPaging(category, cri);
	}
	
//	@Override
//	public BoardPageDTO getListPage(String category, Criteria cri) {
//		
//		return new BoardPageDTO(
//				mapper.getCountBoard(category, cri), 
//				mapper.getListWithPaging(category, cri)
//				);
//	}

	@Override
	public int getTotal(String category, Criteria cri) {
		log.info(category + "게시물 수");
		return mapper.getTotalCount(category, cri);
	}
	
	@Override
	public BoardVO get(Long boardNo) {
		log.info(boardNo + " 게시물 상세보기.......");
		return mapper.get(boardNo);
	}
	@Override
	public List<BoardAttachVO> getAttachList(Long boardNo) {
		log.info(boardNo + "첨부 파일 목록.......");
		return attachMapper.findByBno(boardNo);
	}
	
	

	@Transactional
	@Override
	public void insertSelectKey(BoardVO board) {
		
		log.info("게시물 등록하기 + 파일첨부 등록하기......." + board);
		
		mapper.insertSelectKey(board);
		
		// 첨부파일
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setBoardNo(board.getBoardNo());
			attachMapper.insert(attach);
		});
		
	}

	
	@Transactional
	@Override
	public boolean update(BoardVO board) {
		
		log.info("게시물 수정하기 + 파일첨부 수정하기......." + board);
		
		attachMapper.deleteAll(board.getBoardNo());
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				
			attach.setBoardNo(board.getBoardNo());
			attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	
	@Transactional
	@Override
	public boolean delete(Long boardNo) {
		
		log.info(boardNo + " 게시물 삭제하기 + 첨부파일 삭제하기.......");
		
		attachMapper.deleteAll(boardNo);
		return mapper.delete(boardNo) == 1;
	}

	
	
	
	
	
	@Override
	public List<BoardVO> sortListByReply(String yesterday, String today) {
		log.info(yesterday + " 부터 " + today 
				+ " 댓글순 게시글 목록보기.......");
		return mapper.sortListByReply(yesterday, today);
	}

	@Override
	public List<BoardVO> sortListByScrap(String yesterday, String today) {
		log.info(yesterday + " 부터 " + today 
				+ " 스크랩순 게시글 목록보기.......");
		return mapper.sortListByScrap(yesterday, today);
	}

	


}
