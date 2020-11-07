package com.seungchul.portfolio.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TempControllerTest {
    @GetMapping("/temp/home")
    public String tempHome(){
        return "home";
    }
    @GetMapping("/temp/iexcloud")
    public String tempiexcloud(){
        return "iexcloud";
    }
    @GetMapping("/temp/news")
    public String tempnews(){
        return "news";
    }
}
