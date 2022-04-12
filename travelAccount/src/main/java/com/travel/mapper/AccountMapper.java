package com.travel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.domain.AccountExpenseDTO;
import com.travel.domain.AccountVO;
import com.travel.domain.TravelDateDTO;

public interface AccountMapper {

	// 여행 시작일, 종료일
	public TravelDateDTO getTravelDate(Long travelNo);
		
	// 여행일별 예산/지출 목록
	public List<AccountVO> getAccount(@Param("travelNo") Long travelNo, @Param("dateTime") String dateTime);
	
	// 특정날짜별 총지출
	public Integer totalByDate(@Param("travelNo") Long travelNo, @Param("dateTime") String dateTime);
	
	// 여행별 총지출
	public Integer totalExpense(Long travelNo);
	
	// 여행별 특정 카테고리별 총지출
	public List<AccountExpenseDTO> totalByCategory(@Param("travelNo") Long travelNo);
	
	// 지출 등록
	public int regExp(AccountVO account);
	// 지출 조회
	public AccountVO getExp(Long accountNo);
	// 지출 수정
	public int updateExp(AccountVO account);
	// 지출 삭제
	public int deleteExp(Long accountNo);
	
	// 예산 등록
	public void regBdg(AccountVO account);
	// 예산 조회
	public AccountVO getBdg(Long accountNo);
	// 예산 수정
	public int updateBdg(AccountVO account);
	// 예산 삭제
	public int deleteBdg(Long accountNo);
	
}
