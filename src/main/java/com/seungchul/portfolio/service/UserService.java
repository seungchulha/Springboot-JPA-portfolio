package com.seungchul.portfolio.service;

import com.seungchul.portfolio.model.RoleType;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


// @Service 를 넣어줘야 스프링이 컴포넌트 스캔을 통해서 Bean 에 등록을 해준다.
// 빈에 등록 한다는 말은 즉슨 Ioc 를 해준다는 것 --> 메모리에 대신 띄워준다는 것
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired // 얘를 걸면 아래에서 해쉬화 한다
    private BCryptPasswordEncoder encoder;


    @Transactional(readOnly = true)
    public User 회원찾기(String username){
        User user = userRepository.findByUsername(username).orElseGet(()->{
            return new User();
        });
        return user;
    }

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

    @Transactional
    public void 회원수정(User user){
        // 수정시에는 영속성 컨텍스트 User 오브젝트를 영속화 시키고, 영속화된 User 오브젝트를 수정
        // select를 해서 User 옵젝트를 DB로 부터 가져오는 이유는 영속화를 하기 위해서!!
        // 영속화된 오브젝트를 변경하면 자동으로 DB에 update문을 날려주거든요!!!
        User persistance = userRepository.findById(user.getId()).orElseThrow(()->{
            return new IllegalArgumentException("회원찾기 실패");
        });

        //validation check .. updateForm.jsp 의 비밀번호 수정에 oAuth 값에 따라 비밀번호 수정이 가능하게 하는 부분 보호하는 shell => oauth 필드 에 값이 없으면 수정 가능
        if(persistance.getOauth() == null || persistance.getOauth().equals("")){
            String rawPassword = user.getPassword();
            String encPassword = encoder.encode(rawPassword);
            persistance.setPassword(encPassword);
            persistance.setEmail(user.getEmail());
        }


        persistance.setPhone(user.getPhone());

        // 회원 수정 함수 종료시 = 서비스 종료 = 트랜잭션 종료 = commit 이 자동으로 됩니다.
        // 영속화된 persistance 객체의 변화가 감지되면 더티체킹 이 되어서 변화된것들을 update 문을 날려줍니다.
    }
}
