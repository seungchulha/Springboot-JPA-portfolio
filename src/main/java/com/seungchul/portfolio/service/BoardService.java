package com.seungchul.portfolio.service;

import com.seungchul.portfolio.model.Board;
import com.seungchul.portfolio.model.Reply;
import com.seungchul.portfolio.model.RoleType;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.repository.BoardRepository;
import com.seungchul.portfolio.repository.ReplyRepository;
import com.seungchul.portfolio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private ReplyRepository replyRepository;

    @Transactional
    public void 글쓰기(Board board, User user){ //받는것 2가지 title, content
        board.setCount(0);
        board.setUser(user);
        boardRepository.save(board);
    }

    @Transactional(readOnly = true)
    public Board 글상세보기(int id){
        return boardRepository.findById(id)
            .orElseThrow(()->{
                return new IllegalArgumentException("글 상세보기 실패 : 글 아이디를 찾을수 없습니다. ");
        });
    }

    @Transactional(readOnly = true)
    public Page<Board> 글목록(Pageable pageable) {
        return boardRepository.findAll(pageable);
    }


    @Transactional
    public void 글삭제하기(int id){
         boardRepository.deleteById(id);
    }

    @Transactional
    public void 글수정하기(int id, Board requestBoard){
        Board board = boardRepository.findById(id) // 영속화 시키기
                .orElseThrow(()->{
                    return new IllegalArgumentException("글 찾기 실패 : 글 아이디를 찾을수 없습니다. ");
                }); // 영속화 시키기 완료
        board.setTitle(requestBoard.getTitle());
        board.setContent(requestBoard.getContent());
        //해당 함수로 종료시에( 즉슨 Service가 종료 될 때) 트랜잭션이 종료됩니다. 이때 더티 체킹이 일어나면서 --> 자동 업데이트가 db 쪽으로 flush 됩니다 즉슨 commit 이된다는 뜻입니다
    }

    @Transactional
    public void 댓글쓰기(User user, int boardId, Reply requestReply){

        Board board = boardRepository.findById(boardId).orElseThrow(()->{
            return new IllegalArgumentException("댓글 쓰기 실패 : 게시글 id를 찾을 수 없습니다.");
        });

        requestReply.setUser(user);
        requestReply.setBoard(board);

        replyRepository.save(requestReply);
    }
}
