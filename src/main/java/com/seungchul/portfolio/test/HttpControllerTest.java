package com.seungchul.portfolio.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


//사용자가 요청 할때 --> HTML 파일로 응답해줄때 @Controller
//
//사용자가 요청 할때 --> 거기에 대한 응답을 해줌(Data를 응답해줍니다) @RestController
@RestController
public class HttpControllerTest {

    //http://localhost:8081/http/get (select)
    @GetMapping("/http/get")
    public String getTest(Member m){
        return "get 요청 :    " + m.getId() + " , " + m.getUsername() + " , " + m.getPassword() + " , " + m.getEmail();
    }

    //인터넷 브라우저 요청은 무조건 get 만 할수 있다
    //http://localhost:8081/http/post (insert)
    //json 데이터 형식으로 보내면 parsing 할수 있다 //MessageConverter (스프링부트) 가 해독해주는 역할
    @PostMapping("/http/post")
    public String postTest(@RequestBody Member m){
        return "post 요청 : " + m.getId() + " , " + m.getUsername() + " , " + m.getPassword() + " , " + m.getEmail();
    }

    //http://localhost:8081/http/put (update)
    @PutMapping("/http/put")
    public String putTest(@RequestBody Member m){
        return "put 요청 : " + m.getId() + " , " + m.getUsername() + " , " + m.getPassword() + " , " + m.getEmail();
    }

    //http://localhost:8081/http/delete (delete)
    @DeleteMapping("/http/delete")
    public String deleteTest(){
        return "delete 요청";
    }
}
