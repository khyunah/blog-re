package com.tencoding.jpa.dto;

import com.tencoding.jpa.model.Board;

import lombok.Data;

@Data
public class BoardSaveRequestDto {
	
	private String title;
	private String content;
	
	// 한단계 추가
	// 들어온 보드타입을 entity로 반환하는 작업
	public static Board toEntity(BoardSaveRequestDto dto) {
		Board boardEntity = Board.builder()
				.title(dto.getTitle())
				.content(dto.getContent())
				.build();
		return boardEntity;
	}
}
