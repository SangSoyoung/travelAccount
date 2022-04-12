package com.travel.service;

import java.util.List;

import com.travel.domain.AccountExpenseDTO;
import com.travel.domain.AccountVO;
import com.travel.domain.BoardAttachVO;
import com.travel.domain.TravelDateDTO;

public interface AccountService {

	// 여행 날짜 목록 출력
	public TravelDateDTO getTravelDate(Long travelNo);
	//public TravelVO getTravelDate(Long travelNo);
	
	// 여행일별 예산/지출 목록
	public List<AccountVO> getAccount(Long travelNo, String dateTime);
	
	// 특정날짜별 총지출
	public Integer totalByDate(Long travelNo, String dateTime);
	
	// 여행별 총지출
	public Integer totalExpense(Long travelNo);
	
	// 여행별 특정 카테고리별 총지출
	public List<AccountExpenseDTO> totalByCategory(Long travelNo);
	
	
	
	// 특정 지출/예산 첨부파일 조회
	public List<BoardAttachVO> getAttachList(Long accountNo);
		
	// 지출 등록
	public void regExp(AccountVO account);
	// 지출 조회
	public AccountVO getExp(Long accountNo);
	// 지출 수정
	public boolean updateExp(AccountVO account);
	// 지출 삭제
	public boolean deleteExp(Long accountNo);
	
	// 예산 등록
	public void regBdg(AccountVO account);
	// 예산 조회
	public AccountVO getBdg(Long accountNo);
	// 예산 수정
	public boolean updateBdg(AccountVO account);
	// 예산 삭제
	public boolean deleteBdg(Long accountNo);
	
}
