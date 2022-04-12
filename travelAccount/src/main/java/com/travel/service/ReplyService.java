package com.travel.service;

import java.util.List;


import com.travel.domain.Criteria;
import com.travel.domain.ReplyVO;

public interface ReplyService {
	
	// 댓글 작성
	public int insert(ReplyVO reply);
	
	// 댓글 조회
	public ReplyVO get(Long boardNo);
	
	// 댓글 수정
	public int update(ReplyVO reply);
	
	// 댓글 삭제
	public int delete(Long replyNo);
	
	// 댓글 목록
	public List<ReplyVO> getList(Criteria cri, Long boardNo);
}
