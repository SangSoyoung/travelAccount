package com.travel.mapper;

import java.util.List;

import com.travel.domain.BoardAttachVO;

public interface BoardAttachMapper {

	// 특정 게시물 첨부파일 등록
	public void insert(BoardAttachVO vo);
	// 특정 여행 첨부파일 등록
	public void insertT(BoardAttachVO vo);
	// 특정 예산/지출 첨부파일 등록
	public void insertA(BoardAttachVO vo);
	
	
	// 첨부파일 삭제
	public void delete(String uuid);
	
	// 특정 게시물 첨부파일 목록
	public List<BoardAttachVO> findByBno(Long boardNo);
	// 특정 여행 첨부파일 목록
	public List<BoardAttachVO> findByTno(Long travelNo);
	// 특정 예산/지출 첨부파일 목록
	public List<BoardAttachVO> findByAno(Long accountNo);
	
	// 게시글 삭제시, 첨부파일 모두 삭제
	public void deleteAll(Long boardNo);
	// 여행 삭제시, 첨부파일 모두 삭제
	public void deleteAllT(Long travelNo);
	// 예산/지출 삭제시, 첨부파일 모두 삭제
	public void deleteAllA(Long accountNo);

}
