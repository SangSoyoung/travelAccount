package com.travel.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BoardPageDTO {

	private int boardCnt;
	private List<BoardVO> list;
}
