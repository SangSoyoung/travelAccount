package com.travel.service;

import static org.junit.Assert.assertNotNull;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.travel.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Ignore
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Ignore
//	public void testGetList() {
//		String category = "'여행정보'";
//		service.getList(category).forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testGetList() {
//		String category = "'여행정보', '여행후기'";
//		service.getList(category, new Criteria(2, 12)).forEach(board -> log.info(board));
//	}
	
	
	@Ignore
	public void testGet() {
		BoardVO board = service.get(3L);
		log.info(board);
	}
	
	@Ignore
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setCategory("여행후기");
		board.setArea("제주도");
		board.setTitle("제주제주test");
		board.setContent("test");
		board.setWriter("ccc");
		board.setPhoto("img.img");
		board.setPlat("");
		board.setPlng("");
		
		service.insertSelectKey(board);
		log.info(board);
		log.info("생성된 게시물 번호: " + board.getBoardNo());
	}
	
	@Ignore
	public void testUpdate() {
		BoardVO board = service.get(9L);

		if(board == null) {
			return; 
		}
		 
		board.setArea("남해");
		board.setTitle("수정수정test");
		board.setPlat(""); // null값이 들어가면 안됨!
		board.setPlng(""); // null값이 들어가면 안됨!

		log.info("수정 결과 : " + service.update(board));
	}
	
	@Ignore
	public void testDelete() {
		log.info("삭제 : " + service.delete(7L));
	}
	
	// 게시물 댓글수순 정렬
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
		
		log.info("오늘 날짜 : " + today);
		log.info("어제 날짜 : " + yesterday);
		
		service.sortListByReply(yesterday, today).forEach(board -> log.info(board));
	}
	
	// 게시물 스크랩수순 정렬
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
		
		service.sortListByScrap(yesterday, today).forEach(board -> log.info(board));
	}
	
}
