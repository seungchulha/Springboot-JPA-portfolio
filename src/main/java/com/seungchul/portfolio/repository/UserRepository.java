package com.seungchul.portfolio.repository;

import com.seungchul.portfolio.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

// JSP 로 생각해보면 DAO 와 같은 개념
// spring LEgacy ==> bean 으로 등록되나요 ?  스프링 ioc 에서 객체를 가지고 있나요? 를 의미하는 건데 injection di 를 통해 하는 것들을
// 자동으로 bean 등록해주는 것
//@Repository 생략가능 원 래는 annotation Repository 가 필요했다
public interface UserRepository extends JpaRepository<User, Integer> {
    // SELECT * FROM email WHERE email = 1?;
    Optional<User> findByUsername(String username);
}


//JPA Naming 전략
//아래와 같은 이름의 함수는 원래 없다 하지만
//select * from user where email = ? AND password =?; 로 자동으로 쿼리문이 작동된다. 그리고 괄호안의 파라미터를 넣어서 적용한다
//User findByEmailAndPassword(String email, String password);

//이런 방법도 있다
//@Query(value="select * from user where email = ?1 AND password =?2", nativeQuery = true)
//User login (String email,String password);