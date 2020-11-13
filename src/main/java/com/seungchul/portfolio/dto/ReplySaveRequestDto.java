package com.seungchul.portfolio.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplySaveRequestDto {
    private int userId;
    private int boardId;
    private String content;

    //데이터트랜스퍼오브젝트를 쓸때의 장점은 내가 필요한 데이터를 한방에 받을수 있고 공급할수있다.
}
