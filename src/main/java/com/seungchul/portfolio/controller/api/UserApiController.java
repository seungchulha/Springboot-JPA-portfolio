package com.seungchul.portfolio.controller.api;

import com.seungchul.portfolio.dto.ResponseDto;
import com.seungchul.portfolio.model.RoleType;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class UserApiController {

    @Autowired
    private UserService userService;

//    @Autowired
//    private HttpSession session;

    @PostMapping("/auth/joinProc")
    public ResponseDto<Integer> save(@RequestBody User user){ // username, password, email, phone
        System.out.println("UserApiController : save 호출됨");
        // 실제로 DB에 insert 를 하고 아래에서 return 되면 되요.

        //int result = userService.회원가입(user);
        userService.회원가입(user);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

    //기본적인 로그인 방식  spring security 아닌 방식
    //    @PostMapping("/api/user/login")
    //    public ResponseDto<Integer> login(@RequestBody User user, HttpSession session){
    //        System.out.println("UserApiController : login 호출됨");
    //        User principal = userService.로그인(user); // principal (접근 주체)
    //
    //        if(principal != null){
    //            session.setAttribute("principal", principal);
    //        }
    //
    //        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    //    }

    //스프링 시큐리티를 이용해서 로그인

    @PutMapping("/user")
    public ResponseDto<Integer> update(@RequestBody User user){ //@RequestBody 를 넣어야 json 을 받을수 있다, 아닐시 key=value 값, x-www-form-urlencoded 만 받을수 있다
        userService.회원수정(user);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

}
