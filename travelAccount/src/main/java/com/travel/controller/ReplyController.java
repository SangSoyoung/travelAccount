package com.travel.controller;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.travel.domain.Criteria;
import com.travel.domain.ReplyVO;
import com.travel.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	// 댓글 등록
	@PostMapping(value="/insert", consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insert(@RequestBody ReplyVO vo){
		
		log.info("댓글 : " + vo);
		
		int insertCount = service.insert(vo);
		log.info("댓글 등록 : " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 목록
	@GetMapping(value="/pages/{boardNo}/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(
			@PathVariable("page") int page,
			@PathVariable("boardNo") Long boardNo){
		log.info("댓글 목록............");
		Criteria cri = new Criteria(page, 12);
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, boardNo), HttpStatus.OK);
	}
	
	// 댓글 조회
	@GetMapping(value="/{replyNo}",
			produces= { 
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(
			@PathVariable("replyNo") Long replyNo
			){
		log.info("댓글 번호 : " + replyNo);
		
		return new ResponseEntity<>(service.get(replyNo), HttpStatus.OK);
	}
	
	// 댓글 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value="/{replyNo}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo,
			@PathVariable("replyNo") Long replyNo
			){
		vo.setReplyNo(replyNo);
		log.info("댓글번호 : " + replyNo);
		
		return service.update(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제
	@DeleteMapping(value="/{replyNo}",
			produces= { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("replyNo") Long replyNo){
		log.info("댓글 삭제 : " + replyNo);
		
		return service.delete(replyNo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
