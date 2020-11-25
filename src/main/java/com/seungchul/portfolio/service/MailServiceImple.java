package com.seungchul.portfolio.service;

import com.seungchul.portfolio.handler.MailHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import org.apache.groovy.util.Maps;

import java.util.Map;


@Service
public class MailServiceImple implements MailService {

    @Autowired
    private JavaMailSender sender;

    public Map<String, Object> send(String email, String customerEmail, String title, String body) {

        MailHandler mail;
        try {
            mail = new MailHandler(sender);
            mail.setFrom(customerEmail, customerEmail);
            mail.setTo(email);
            mail.setSubject(title);
            mail.setText(body);
            mail.send();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        String resultCode = "S-1";
        String msg = "메일이 발송되었습니다.";

        return Maps.of("resultCode", resultCode, "msg", msg);

        //groovy ==> Map<String, Object> rs = new HashMap<>();
        //rs.put("resultCode", resultCode);
        //rs.put("msg", msg);
        //return rs; 해야하는 것을 한방에 해결해준다

    }
}
