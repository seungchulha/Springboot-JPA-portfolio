package com.seungchul.portfolio.service;

import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

// @Service 를 넣어줘야 스프링이 컴포넌트 스캔을 통해서 Bean 에 등록을 해준다.
// 빈에 등록 한다는 말은 즉슨 Ioc 를 해준다는 것 --> 메모리에 대신 띄워준다는 것
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public int 회원가입(User user){

        try{
            userRepository.save(user);
            return 1;
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("UserService: 회원가입() : " + e.getMessage() );
        }
        return -1;
    }
}
