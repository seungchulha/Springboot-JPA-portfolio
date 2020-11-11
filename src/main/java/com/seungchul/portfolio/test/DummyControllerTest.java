package com.seungchul.portfolio.test;

import com.seungchul.portfolio.model.RoleType;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;
import java.util.function.Supplier;

@RestController
public class DummyControllerTest {

    @Autowired // userrepository 타입으로 스프링이 관리하는 객체가 있다면 이 값에 넣어주라는 도구임 // 의존성 주입
    private UserRepository userRepository;

    @DeleteMapping("/dummy/user/{id}")
    public String delete(@PathVariable int id){
        try {
            userRepository.deleteById(id);
        }catch (EmptyResultDataAccessException e){
            return "삭제에 실패하였습니다. 해당 id 는 DB에 없습니다.";
        }
        return "삭제되었습니다. id : " + id;
    }

    // Q: 밑에도 같은 주소인 메소드가 있는데 충돌이 안나나요?  A: 아래는 get 위에는 put 알아서 구별합니다
    // phoneNum, password 만 수정 할수 있도록 해보자
    @Transactional // 함수 종료시 commit 되는 것이 @Transactional
    @PutMapping("/dummy/user/{id}")
    //내가 보낸 json 데이터를 요청 ==> Java Object(MessageConverter 의 Jackson 라이브러리가 로 변환해서 받아준다.
    //위에 과정에 필요한 annotation 이 @RequestBody 입니다
    public User updateUser(@PathVariable int id,@RequestBody User requestUser){
        System.out.println("id : " + id);
        System.out.println("password : " + requestUser.getPassword());
        System.out.println("phoneNum : " + requestUser.getPhone());


        User user = userRepository.findById(id).orElseThrow(()->{
            return new IllegalArgumentException("수정에 실패하였습니다.");
        });

        user.setPassword(requestUser.getPassword());
        user.setPhone(requestUser.getPhone());

        //save 는 원래 insert 할때 쓰는 밸류입니다
        //save 함수는 id 를 전달하지 않으면 insert를 해주고
        //save 함수는 id 를 전달하면 해당 id 에 대한 데이터가 있으면 update를 해주고
        //save 함수는 id 를 전달하면 해당 id 에 대한 데이터가없으면  insert 합니다
        //userRepository.save(user);

        //save 를 안하고도 update 되게 한다 ( @Transactional )
        //더티 체킹
        return user;
    }

    //http://localhost:8000/blog/dummy/user
    @GetMapping("/dummy/users")
    public List<User> lists(){
        return userRepository.findAll();
    }

    //한 페이지당 2건의 데이터를 리턴 받아보자!!!
    //알아둬야할 기능 pageable
    @GetMapping("/dummy/user")
    public Page<User> pageList(@PageableDefault(size=2, sort="id", direction = Sort.Direction.DESC) Pageable pageable){
        Page<User> pagingUser = userRepository.findAll(pageable);

        //분기처리
//        if(pagingUser.isFirst()){
//
//        }
//        if(pagingUser.isLast()){
//
//        }
        List<User> users = pagingUser.getContent();
        return pagingUser;
    }

    //주소로 {id} parameter를 전달 받을 수 있음.
    // http://localhost:8000/blog/dummy/user/5
    @GetMapping("/dummy/user/{id}")
    public User detail(@PathVariable int id){
        userRepository.findById(id);

        // user/4 를 검색할시 데이터베이스에서 해당값을 못찾으면 user 가 null 될 것이다.
         //그럼 return null 이 되면 프로그램에 문제가 있을 것이다.
        // Optional 로 User 객체를 감싸서 가져 오니 null 인지 아닌지 판단해서 return 하게 하는 것
        User user = userRepository.findById(id).orElseThrow(new Supplier<IllegalArgumentException>() {
            @Override
            public IllegalArgumentException get(){
                return new IllegalArgumentException("해당 유저는 없습니다. id : " + id);
            }
        });

        //user 객체는 자바 object 이다
        //요청은 웹브라우저에서 했다. //RestController 는 html 파일이 아닌 Data 를 return 해준다.
        //고로 웹브라우저가 이해할수 있는 데이터로 변환해주어야하는데 이 변환 결과물이 -> json 이다 (Gson 라이브러리)
        //스프링부트 에서는  messageConverter 라는 것이 응답시 자동 작동 한다
        //만약 자바 오브젝트를 리턴하게 되면 MessageConverter 가 Jacson 라이브러리를 호출해서
        //user 오브젝트를 json 으로 변환해서 브라우저에게 던져줍니다.
        return user;

        //람다식 샘플 위의 것을 간략하게 만든 자바 1.8 부터 가능해진 람다식 표현
        //User user = userRepository.findById(id).orElseThrow(()->{
        //    return new IllegalArgumentException("해당 유저는 없습니다. id : " + id);
        //});
        //return user;
    }
    //http://localhost:8000/blog/dummy/join (요청)
    //http의 body 에 username, password, email, phonenum 데이터를 가지고 (요청)
    @PostMapping("/dummy/join")
    public String join(User user){ //key=value 형태의 값을 받는다는 것(약속된 규칙)
        System.out.println("id : " + user.getId());
        System.out.println("username  : " + user.getUsername());
        System.out.println("password  : " + user.getPassword());
        System.out.println("email  : " + user.getEmail());
        System.out.println("phoneNum  : " + user.getPhone());
        System.out.println("role : " + user.getRole());
        System.out.println("createDate : " + user.getCreateDate());

        user.setRole(RoleType.USER);
        userRepository.save(user);
        return "회원가입이 완료되었습니다.";
    }
}

// 1. Get 요청 (select 요청 경우 사용)
// ex ) http://localhost:8000/blog/user?username=ssar
// 특징 : body 로 데이터를 담아 보내지 않는다

//2. Post, Put, Delete 요청 ( 데이터를 변경 )
//- 데이터를 담아 보내야 할 것이 많음.
//- username, password, email, address, gender, createDate
//- form 태그 method='Post'
//- form 한계 --> get, post 요청 밖에 못한다....
//- Put, Delete 는 form 태그로 처리하지 못함
//- 이 경우 자바스크립트 요청을 해야한다. // 통일성이 떨어진다.
// 데이터는 모두 key, value 로 전송된다
// 통일 시키는 방법 : 자바스크립트로 ajax 요청 뒤에 데이터는 json 으로 통일 !!

// 스프링에서 form: form 태그 라는 것이 있는데 이것은 post, put, delete, get 모든 요청이 가능하다
// <%@ taglib prefix="form" url="http://www.springframework.org/tags/form" %>
// <form:form></form:form>
// 기본값은 post

//3. Object 로 데이터 받기
// post 방식의 key=value (x-www-form-urlencoded)
// username = ssar
// password = 1234

// key, value 가 아닌 데이터는 반드시 @RequestBody 로 받아줘야한다 . 아닐시 데이터를 안받아준다