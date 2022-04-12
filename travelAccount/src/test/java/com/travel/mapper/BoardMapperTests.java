package com.travel.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.travel.domain.BoardVO;
import com.travel.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Ignore
	public void testGetList() {
		String category = "'여행정보', '여행후기'"; // 값 그대로 넣기 ${ }
		mapper.getList(category).forEach(board -> log.info(board));
	}
	
	@Ignore
	public void testPaging() {
		
		Criteria cri = new Criteria();
		// 12개씩 2페이지
		cri.setPageNum(2);
		cri.setAmount(12);
		
		String category = "'여행정보', '여행후기'";
		
		List<BoardVO> list = mapper.getListWithPaging(category, cri);
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("test");
		cri.setType("TC");
		
		String category = "'여행정보', '여행후기'";
		List<BoardVO> list = mapper.getListWithPaging(category, cri);
		list.forEach(board -> log.info(board));
	}
	
	
	@Ignore
	public void testGet() {
		BoardVO board = mapper.get(1L);
		log.info(board);
	}
	
	@Ignore
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setCategory("여행후기");
		board.setArea("양양");
		board.setTitle("양양test");
		board.setContent("test");
		board.setWriter("bbb");
		board.setPhoto("img.img");
		board.setPlat("");
		board.setPlng("");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
	@Ignore
	public void testUpdate() {
		BoardVO board = mapper.get(3L);
		board.setCategory("여행정보");
		board.setArea("경주");
		board.setTitle("수정test");
		board.setContent("수정test");
		board.setPhoto("img.img");
		board.setPlat("");
		board.setPlng("");
		
		int count = mapper.update(board);
		log.info("수정 : " + count);
	}
	
	@Ignore
	public void testDelete() {
		int count = mapper.delete(5L);
		log.info("삭제 : " + count);
	}
	
	@Ignore
	public void testSortListByReply() {
		// 오늘 날짜 구하기
		Date tdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		String today = sdf.format(tdate);
		// 어제 날짜 구하기
		Date yDate = new Date();
		yDate = new Date(yDate.getTime()+(1000*60*60*24*-1));
		String yesterday = sdf.format(yDate);
		
		//String yesterday = "2022-03-24";
		//String today = "2022-03-25";
		log.info("오늘 날짜 : " + today);
		log.info("어제 날짜 : " + yesterday);
		
		mapper.sortListByReply(yesterday, today).forEach(board -> log.info(board));
	}
	
	
	@Ignore
	public void testSortListByScrap() {
		// 오늘 날짜 구하기
		Date tdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		String today = sdf.format(tdate);
		// 어제 날짜 구하기
		Date yDate = new Date();
		yDate = new Date(yDate.getTime()+(1000*60*60*24*-1));
		String yesterday = sdf.format(yDate);
		
		log.info("오늘 날짜 : " + today);
		log.info("어제 날짜 : " + yesterday);
		
		mapper.sortListByScrap(yesterday, today).forEach(board -> log.info(board));
	}
	
	
}
