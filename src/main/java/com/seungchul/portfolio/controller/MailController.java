package com.seungchul.portfolio.controller;

import com.seungchul.portfolio.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class MailController {
    @Autowired
    private MailService mailService;

    @RequestMapping("/contact/contact")
    public String showSend(){
        return "contact/contact";
    }

    @RequestMapping("/contact/doSend")
    @ResponseBody // 누구한테 보낼건지, 제목이 뭔지, 내용이 뭔지
    public String doSend(String email, String customerEmail, String title, String body){
        Map<String, Object> sendRs = mailService.send(email, customerEmail, title, body);
        return (String)sendRs.get("msg");
    }

}
