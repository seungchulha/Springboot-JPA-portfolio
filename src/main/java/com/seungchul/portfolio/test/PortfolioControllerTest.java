package com.seungchul.portfolio.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
// 스프링이 com.seungchul.portfolio 패키지 이하를 스캔해서 모든 파일을 메모리에 new 하는 것이 아닌 특정 Annotation 이 붙어있는 클래스 파일들을 new 해서 (ioc) 스프링 컨테이너를 관리해줍니다.
public class PortfolioControllerTest {

    @GetMapping("/test/hello")
    public String hello(){
        return "<h1>hello spring boot<h2>";
    }
}
