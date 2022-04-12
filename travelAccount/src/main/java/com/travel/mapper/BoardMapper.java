package com.travel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;

public interface BoardMapper {

	// 특정 게시판 목록 조회
	public List<BoardVO> getList(String category);
	
	// 특정 게시판 목록 조회 + 페이징 처리 + 검색
	public List<BoardVO> getListWithPaging(@Param("category") String category, @Param("cri") Criteria cri);
	
	// 특정 게시판 게시글 수 파악
	public int getTotalCount(@Param("category") String category, @Param("cri") Criteria cri);
	
	// 특정 게시물 조회
	public BoardVO get(Long boardNo);
	
	// 게시물 등록(insert문이 실행되고, 생성된 PK값을 알아야 하는 경우)
	public void insertSelectKey(BoardVO board);
	
	// 게시물 수정
	public int update(BoardVO board);
	
	// 게시물 삭제
	public int delete(Long boardNo);
	
	
	// 게시물 댓글수순 정렬
	public List<BoardVO> sortListByReply(String yesterday, String today);
	
	// 게시물 스크랩수순 정렬
	public List<BoardVO> sortListByScrap(String yesterday, String today);
	
}
