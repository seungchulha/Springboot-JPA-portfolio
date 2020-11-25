package com.seungchul.portfolio.controller;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@AllArgsConstructor
public class ContactController {


    @GetMapping("/contact")
    public String dispMail() {
        return "/contact/contact";
    }

}