package com.seungchul.portfolio.controller;

import com.seungchul.portfolio.config.auth.PrincipalDetail;
import com.seungchul.portfolio.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BoardController {

//    @GetMapping({"","/"})
//    public String index(@AuthenticationPrincipal PrincipalDetail principal){ //컨트롤러 에서 세션을 어떻게 찾는지?
//        // /WEB-INF/views/index.jsp
//        System.out.println(principal.getUsername());
//        //System.out.println("로그인 사용자 아이디 : " + principal.getUsername());
//        return "index";
//    }

    @Autowired
    private BoardService boardService;


    @GetMapping({"","/"})
    public String index(Model model, @PageableDefault(size=3, sort="id", direction = Sort.Direction.DESC) Pageable pageable){ //컨트롤러 에서 세션을 어떻게 찾는지?
        // /WEB-INF/views/index.jsp
        model.addAttribute("boards", boardService.글목록(pageable));
        return "index"; // viewResolver 작동 !! 상단의 모델을 들고 간다.
    }

    @GetMapping("/board/{id}")
    public String findById(@PathVariable int id, Model model){
        model.addAttribute("board", boardService.글상세보기(id));
        return "board/detail";
    }

    @GetMapping("/board/{id}/updateForm") // model 은 해당 데이터를 가지고 뷰 까지 이동하는 것
    public String updateForm(@PathVariable int id, Model model){
        model.addAttribute("board", boardService.글상세보기(id));
        return "board/updateForm";
    }

    // User 권한이 필요 // 글쓰기 창
    @GetMapping("/board/saveForm")
    public String saveForm(){
        return "board/saveForm";
    }

    //////////////////// 강의 이후 내가 만든 페이지 ////////////////////////
    @GetMapping("/news/globalIssue")
    public String globalIssue(){
        return "/contents/globalIssue";
    }
}

