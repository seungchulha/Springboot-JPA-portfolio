package com.seungchul.portfolio.config.auth;

import com.seungchul.portfolio.model.User;
import lombok.Data;
import lombok.Getter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

// 스프링 시큐리티가 로그인 요청을 가로채서 로그인을 진행하고 완료가 되면 UserDetails 타입의 오브젝트를 스프링 시큐리티의 고유한 세션 저장소에 저장을 해준다.
@Data
public class PrincipalDetail implements UserDetails {

    private User user; // 객체를 품고 있는 것을 컴포지션 이라고 한다

    public PrincipalDetail(User user){
        this.user = user;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    // 계정이 만료되지 않았는 지를 리턴한다 . (true: 만료안됨)
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    //계정이 잠겨있지 않았는지 리턴한다. (true : 잠기지 않음)
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    // 비밀번호가 만료되지 않았는지를 리턴한다. (true : 만료안됨)
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    // 계정이 활성화(사용가능) 인지를 리턴한다. (true: 활성화)
    @Override
    public boolean isEnabled() {
        return true;
    }

    //계정이 어떤 권한을 가졌는지를 나타낸다
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> collectors = new ArrayList<>();

//        collectors.add(new GrantedAuthority() {
//            @Override
//            public String getAuthority() {
//                return "ROLE_"+user.getRole(); // 스프링 시큐리티에 앞에 반드시 "ROLE_" 을 반드시 넣어주어야 인식한다. ex) ROLE_USER
//            }
//        });

        //위의 긴 식을 람다식으로 변환해준것
        //계정이 갖고 있는 권한 목록을 리턴합니다. (권한이 여러개 있을수 있어서 루프를 돌아야하지만 한개만 여기선 사용하기때문에 )
        collectors.add(()->{return "ROLE_"+user.getRole();});
        return collectors;
    }
}