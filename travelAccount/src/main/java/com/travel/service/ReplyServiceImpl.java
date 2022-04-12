package com.travel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.Criteria;
import com.travel.domain.ReplyVO;
import com.travel.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int insert(ReplyVO reply) {
		log.info("댓글등록.........." + reply);
		
		return mapper.insert(reply);
	}

	@Override
	public ReplyVO get(Long replyNo) {
		log.info("댓글조회.........." + replyNo);
		
		return mapper.get(replyNo);
	}

	@Override
	public int update(ReplyVO reply) {
		log.info("댓글수정..........." + reply);
		
		return mapper.update(reply);
	}

	@Override
	public int delete(Long replyNo) {
		log.info("댓글삭제..........." + replyNo);
		
		return mapper.delete(replyNo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long boardNo) {
		log.info("댓글 목록..........." + boardNo);
		
		return mapper.getListWithPaging(cri, boardNo);
	}

}
