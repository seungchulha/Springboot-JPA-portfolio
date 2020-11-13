package com.seungchul.portfolio.controller.api;

import com.seungchul.portfolio.config.auth.PrincipalDetail;
import com.seungchul.portfolio.dto.ReplySaveRequestDto;
import com.seungchul.portfolio.dto.ResponseDto;
import com.seungchul.portfolio.model.Board;
import com.seungchul.portfolio.model.Reply;
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

    //원래는 데이터를 받을 때 컨트롤러에서 dto를 만들어주는 것이 좋다.
    //dto를 굳이 사용하지 않는 이유는 !!! 굳이 이러한 조그마한 프로젝트에서 dto까지 만들어가며 할 필요가없다
    //하지만 프로젝트가 커지면 필드가 많아지며 넘어오는 수 많은 것들을 오브젝트로 처리하는 것은 좋지 못하다.
//    @PostMapping("/api/board/{boardId}/reply")
//    public ResponseDto<Integer> replySave(@PathVariable int boardId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalDetail principal){
//
//        boardService.댓글쓰기(principal.getUser(), boardId, reply);
//        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
//    }
    @PostMapping("/api/board/{boardId}/reply")
    public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto){
        boardService.댓글쓰기(replySaveRequestDto);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }


}
