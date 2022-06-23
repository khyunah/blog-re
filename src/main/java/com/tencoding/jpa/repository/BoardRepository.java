package com.tencoding.jpa.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.tencoding.jpa.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {
	
	@Query(value = "SELECT * FROM board WHERE id = :id", nativeQuery = true)
	Optional<Board> mFindById(int id);
	
	// 네이티브 쿼리
	@Modifying	// 수정, 삭제, 저장하는 쿼리에서 사용해줘야 한다.
	@Query(value = "DELETE FROM board WHERE id = :id", nativeQuery = true)	// :id 하면 void mDeleteById(int id);에있는게 자동 세팅
	int mDeleteById(int id);
}
