package com.tencoding.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tencoding.jpa.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {

}
