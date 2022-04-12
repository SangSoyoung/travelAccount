package com.travel.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.travel.domain.Criteria;
import com.travel.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] boardNoArr = {325L, 326L, 327L, 328L, 329L };
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Ignore
	public void testMapper() {
		log.info(mapper);
	}
	
	@Ignore
	public void insertTest() {
		
		IntStream.rangeClosed(1, 12).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			// 게시물 번호
			vo.setBoardNo(boardNoArr[i % 5]);
			vo.setReply("댓글 테스트" + i);
			vo.setReplyer("replyer" + i);
			
			mapper.insert(vo);
		});
	}
	
	@Ignore
	public void getTest() {
		Long targetRno = 5L;
		ReplyVO vo = mapper.get(targetRno);
		log.info(vo);
	}
	
	@Ignore
	public void deleteTest() {
		Long targetRno = 21L;
		mapper.delete(targetRno);
	}
	
	@Ignore
	public void updateTest() {
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.get(targetRno);

		vo.setReply("댓글 수정 테스트");
		int count = mapper.update(vo);
		log.info("댓글 수정 : " + count);
	}
	
	@Test
	public void listTest() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.getListWithPaging(cri, boardNoArr[0]);
		replies.forEach(reply -> log.info(reply));
	}
	
	
	
}
