package com.seungchul.portfolio.repository;

import com.seungchul.portfolio.model.Board;
import com.seungchul.portfolio.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public interface BoardRepository extends JpaRepository<Board, Integer> {

}
