package com.seungchul.portfolio.controller.api;

import com.seungchul.portfolio.config.auth.PrincipalDetail;
import com.seungchul.portfolio.dto.ResponseDto;
import com.seungchul.portfolio.model.Board;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.service.BoardService;
import com.seungchul.portfolio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
public class BoardApiController {

    @Autowired
    private BoardService boardService;

    @PostMapping("/api/board")
    public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal){
        boardService.글쓰기(board, principal.getUser());
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

    @DeleteMapping("/api/board/{id}")
    public ResponseDto<Integer> deleteById(@PathVariable int id){
        boardService.글삭제하기(id);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

    //여기서 잠깐!!!!!!
    //위의 DeleteMapping 의 주소랑 같은데????
    // 정답은 : method 가 달라서 영향이 없습니다. 안심해도 됩니다!!!
    @PutMapping("/api/board/{id}")
    public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Board board){
        boardService.글수정하기(id, board);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

}
