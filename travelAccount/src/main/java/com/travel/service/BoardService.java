package com.travel.service;

import java.util.List;

import com.travel.domain.BoardAttachVO;
import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;

public interface BoardService {

	// 특정 게시판 목록 조회
	//public List<BoardVO> getList(String category);
	
	// 특정 게시판 목록 조회 + 페이지 처리 + 검색
	public List<BoardVO> getList(String category, Criteria cri);
	
	// + 게시물 페이지 수
	//public BoardPageDTO getListPage(String category, Criteria cri);
	
	// 특정 게시판 게시글 수 파악
	public int getTotal(String category, Criteria cri);
	
	// 특정 게시물 조회
	public BoardVO get(Long boardNo);
	// 특정 게시물 첨부파일 조회
	public List<BoardAttachVO> getAttachList(Long boardNo);
	
	
	// 게시물 등록(insert문이 실행되고, 생성된 PK값을 알아야 하는 경우)
	public void insertSelectKey(BoardVO board);
	
	// 게시물 수정
	public boolean update(BoardVO board);
	
	// 게시물 삭제
	public boolean delete(Long boardNo);
	

	
	// 게시물 댓글수순 정렬
	public List<BoardVO> sortListByReply(String yesterday, String today);
	
	// 게시물 스크랩수순 정렬
	public List<BoardVO> sortListByScrap(String yesterday, String today);

}
