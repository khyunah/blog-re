package com.tencoding.jpa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tencoding.jpa.dto.BoardSaveRequestDto;
import com.tencoding.jpa.model.Board;
import com.tencoding.jpa.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	@Transactional
	public void 글쓰기(BoardSaveRequestDto dto) {
		Board boardEntity = BoardSaveRequestDto.toEntity(dto);
		boardRepository.save(boardEntity);
	}

	@Transactional
	public Page<Board> 글목록보기(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}

	@Transactional
	public Board 글상세보기(int id) {
		Board board = boardRepository.mFindById(id).orElseThrow(() -> {
			return new RuntimeException("해당글은 삭제 되었습니다.");
		});
		
//		Board board = boardRepository.findById(id).orElseThrow(() -> {
//			return new RuntimeException("해당글은 삭제 되었습니다.");
//		});
		
		// 더티 채킹 할것 - 조회수 증가 
		board.setReadCount(board.getReadCount() + 1);
		
		return board;
	}
	
	@Transactional
	public void 글수정하기(int id, BoardSaveRequestDto dto) {
		Board boardEntity = boardRepository.findById(id).orElseThrow(() -> {
			return new RuntimeException("해당글은 없는 데이터 입니다.");
		});
		boardEntity.setTitle(dto.getTitle());
		boardEntity.setContent(dto.getContent());
		
		// 트랜젝션을 이용하면 이 메서드가 종료되는 시점에 더티체킹 발생
	}
	
	@Transactional
	public int 글삭제하기(int id) {
		// 삭제 첫번째 방법
		// void 인 이유 : 없는 것을 삭제해도 삭제되었다고 나오기때문에 
//		boardRepository.deleteById(id);
		
		// 삭제 두번째 방법
		return boardRepository.mDeleteById(id);
	}
}
