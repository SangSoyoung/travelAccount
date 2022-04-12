package com.travel.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.travel.domain.AccountExpenseDTO;
import com.travel.domain.AccountVO;
import com.travel.domain.BoardAttachVO;
import com.travel.domain.TravelDateDTO;
import com.travel.mapper.AccountMapper;
import com.travel.mapper.BoardAttachMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AccountServiceImpl implements AccountService {

	
	private AccountMapper mapper;
	private BoardAttachMapper attachMapper;
	
	
	@Override // 여행 날짜 목록 출력
	public TravelDateDTO getTravelDate(Long travelNo) {
		log.info("여행 시작일 & 종료일 .................");
		
		return mapper.getTravelDate(travelNo);
	}

	@Override
	public List<AccountVO> getAccount(Long travelNo, String dateTime) {
		log.info("여행일별 예산/지출 목록 ..................");
		return mapper.getAccount(travelNo, dateTime);
	}

	
	@Override
	public Integer totalByDate(Long travelNo, String dateTime) {
		log.info(travelNo + "번 여행" + dateTime + "일 총 지출");
		
		return mapper.totalByDate(travelNo, dateTime);
	}

	@Override
	public Integer totalExpense(Long travelNo) {
		log.info(travelNo + "번 여행 총 지출");
		
		return mapper.totalExpense(travelNo);
	}

	@Override
	public List<AccountExpenseDTO> totalByCategory(Long travelNo) {
		log.info(travelNo + "번 여행 카테고리별 지출");
		return mapper.totalByCategory(travelNo);
	}

	
	@Transactional
	@Override
	public void regExp(AccountVO account) {
		log.info("지출등록 + 파일 첨부.................");
		mapper.regExp(account);
		
		// 첨부파일
		if(account.getAttachList() == null || account.getAttachList().size() <= 0) {
			return;
		}
		
		account.getAttachList().forEach(attach -> {
			attach.setAccountNo(account.getAccountNo());
			attachMapper.insertA(attach);
		});
	}

	@Override
	public AccountVO getExp(Long accountNo) {
		log.info("지출 조회.................");
		return mapper.getExp(accountNo);
	}
	@Override
	public List<BoardAttachVO> getAttachList(Long accountNo) {
		log.info(accountNo + "첨부 파일 목록.......");
		return attachMapper.findByAno(accountNo);
	}

	
	@Transactional
	@Override
	public boolean updateExp(AccountVO account) {
		log.info("지출 수정 + 파일첨부 수정하기......." + account);
		
		attachMapper.deleteAllA(account.getAccountNo());
		boolean modifyResult = mapper.updateExp(account) == 1;
		
		if(modifyResult && account.getAttachList() != null && account.getAttachList().size() > 0) {
			account.getAttachList().forEach(attach -> {
				
			attach.setAccountNo(account.getAccountNo());
			attachMapper.insertA(attach);
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean deleteExp(Long accountNo) {
		log.info(accountNo + "지출 삭제하기 + 첨부파일 삭제하기.......");
		
		attachMapper.deleteAllA(accountNo);
		return mapper.deleteExp(accountNo) == 1;
	}

	
	
	@Transactional
	@Override
	public void regBdg(AccountVO account) {
		log.info("예산등록");
		mapper.regBdg(account);
	}

	@Override
	public AccountVO getBdg(Long accountNo) {
		log.info("예산 조회.................");
		return mapper.getBdg(accountNo);
	}

	@Transactional
	@Override
	public boolean updateBdg(AccountVO account) {
		log.info("예산 수정 : " + account);
		return mapper.updateExp(account) == 1;
	}

	@Transactional
	@Override
	public boolean deleteBdg(Long accountNo) {
		log.info(accountNo + "예산 삭제");

		return mapper.deleteBdg(accountNo) == 1;
	}
}
