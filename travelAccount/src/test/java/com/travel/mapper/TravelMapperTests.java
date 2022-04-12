package com.travel.mapper;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.travel.domain.AccountExpenseDTO;
import com.travel.domain.AccountVO;
import com.travel.domain.TravelDateDTO;
import com.travel.domain.TravelVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TravelMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private TravelMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private AccountMapper amapper;

	
	@Ignore
	public void getDateTest() {
		log.info("여행 기간 얻기......");
		TravelDateDTO travel = amapper.getTravelDate(2L);
		log.info(travel);
	}
	
	@Ignore
	public void getAccountTest() {
		log.info("여행일별 예산/지출 목록..........");
		List<AccountVO> vo = amapper.getAccount(2L, "2022-04-06");
		log.info(vo);
	}
	
	@Ignore
	public void getTravelListTest() {
		log.info("내 여행 목록..........");
		List<TravelVO> vo = mapper.getTravelList("aaa");
		vo.forEach(i -> log.info(i));
	}
	
	@Ignore
	public void getTravelProfileTest() {
		log.info("여행 프로필 조회..........");
		TravelVO vo = mapper.get(2L);
		log.info(vo);
	}
	
	@Test
	public void getTotalExpenseTest() {
		List<AccountExpenseDTO> ae = amapper.totalByCategory(2L);
		ae.forEach(i -> log.info(i));
		
	}
	
	
	
}
