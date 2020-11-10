package com.seungchul.portfolio.repository;

import com.seungchul.portfolio.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

// JSP 로 생각해보면 DAO 와 같은 개념
// spring LEgacy ==> bean 으로 등록되나요 ?  스프링 ioc 에서 객체를 가지고 있나요? 를 의미하는 건데 injection di 를 통해 하는 것들을
// 자동으로 bean 등록해주는 것
//@Repository 생략가능 원 래는 annotation Repository 가 필요했다
public interface UserRepository extends JpaRepository<User, Integer> {

}
