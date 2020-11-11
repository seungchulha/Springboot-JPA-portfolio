package com.seungchul.portfolio.service;

import com.seungchul.portfolio.model.RoleType;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


// @Service 를 넣어줘야 스프링이 컴포넌트 스캔을 통해서 Bean 에 등록을 해준다.
// 빈에 등록 한다는 말은 즉슨 Ioc 를 해준다는 것 --> 메모리에 대신 띄워준다는 것
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

//    @Transactional
//    public int 회원가입(User user){
//
//        try{
//            userRepository.save(user);
//            return 1;
//        }catch(Exception e){
//            e.printStackTrace();
//            System.out.println("UserService: 회원가입() : " + e.getMessage() );
//        }
//        return -1;
//    }

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Transactional
    public void 회원가입(User user){
        String rawPassword = user.getPassword();
        String encPassword = encoder.encode(rawPassword); // 해쉬가 되었다!!
        user.setPassword(encPassword);
        user.setRole(RoleType.USER);
        userRepository.save(user);
    }

//    @Transactional(readOnly = true) //select 할 때 트랜잭션 시작, 서비스 종료시에 트랜잭션 종료 ( 정합성 유지 /)
//    public User 로그인(User user){
//        return userRepository.findByEmailAndPassword(user.getEmail(), user.getPassword());
//    }
}
