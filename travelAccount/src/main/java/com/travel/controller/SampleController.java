package com.travel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.travel.domain.SampleVO;

import lombok.extern.log4j.Log4j;


@RestController
@Log4j
@RequestMapping("/sample")
public class SampleController {

	@GetMapping(value="/getText", produces = "text/plain; charset=utf-8")
	public String text() {
		return "hello~안녕";
	}
	
	@GetMapping(value="/getSample")
	public SampleVO getSample() {
		log.info("getSample............");
		return new SampleVO(112, "스타", "로드");
	}
	
	@GetMapping("/getSampleList")
	public List<SampleVO> getSampleList(){
		List<SampleVO> list = new ArrayList<>();
		int i = 0;
		while(i < 3) {
			SampleVO s = new SampleVO(++i, "길동"+i, "홍");
			list.add(s);
		}
		return list;
	}
	
	@GetMapping("/getSampleMap")
	public Map<String, SampleVO> getMap(){
		Map<String, SampleVO> map = new HashMap<>();
		map.put("First", new SampleVO(111, "James", "Dean"));
		
		return map;
	}
	
	// Json 데이터 처리
	@PostMapping("/sendSingle")
	public SampleVO sendSingle(@RequestBody SampleVO sample) {
		log.info("sendSingle.............");
		log.info(sample);
		return sample;
	}
	
	
	// List 데이터 처리
	@PostMapping("/sendList")
	public List<SampleVO> sendList(@RequestBody List<SampleVO> sampleList){
		log.info("sendList.............");
		log.info(sampleList);
		return sampleList;
	}
	
	// Map 데이터 처리
	@PostMapping("/sendMap")
	public Map<String, SampleVO> sendMap(@RequestBody Map<String, SampleVO> sampleMap){
		log.info("sendMap.............");
		log.info(sampleMap);
		return sampleMap;
	}
	
	// Form 데이터 처리 
	@RequestMapping("/sendFrom") // post/get 방식 모두 받음
	public SampleVO sendForm(SampleVO sample) { 
		// 파라미터가 json이 아니라 쿼리스트링으로 넘어오기 때문에 RequestBody 필요없음
		log.info("sendForm.....");
		log.info(sample);
		
		return sample;
	}
	
	
}
