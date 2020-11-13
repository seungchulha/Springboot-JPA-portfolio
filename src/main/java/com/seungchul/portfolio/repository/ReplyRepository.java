package com.seungchul.portfolio.repository;

import com.seungchul.portfolio.dto.ReplySaveRequestDto;
import com.seungchul.portfolio.model.Reply;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface ReplyRepository extends JpaRepository<Reply, Integer> {
    //네이티브 쿼리 만들기

    @Modifying
    @Query(value="INSERT INTO reply(userId, boardId, content, createDate) VALUES (?1, ?2, ?3, now())", nativeQuery = true)
    int mSave(int userId, int boardId, String content);


}
