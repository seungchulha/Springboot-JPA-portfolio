package com.seungchul.portfolio.config;

import com.seungchul.portfolio.config.auth.PrincipalDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Configuration //class 가 bean 으로 등록되야한다 // bean 등록이란 : 스프링 컨테이너에서 객체를 관리할 수 있게 하는 것 (ioc 관리)
@EnableWebSecurity // filter 를 추가하는 것 (security filter) --> spring security 가 이미 활성 되어있는데 어떤 설정을 해당 파일에서 하겠다 는 의미 ( securityConfig 안에서 == 지금 이 클래스 )
@EnableGlobalMethodSecurity(prePostEnabled = true) //특정 주소로 접근을 하면 권한 및 인증을 미리 체크 하겠다는 것 // 3가지 annotation은 하나의 세트라고 생각하면 된다!!!
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private PrincipalDetailService principalDetailService;

    @Bean // @Bean 을 등록하면 ioc 가 되요 즉슨 spring 에서 관리해요
    public BCryptPasswordEncoder encodePWD(){
        return new BCryptPasswordEncoder();
    }

    // 시큐리티가 대신 로그인을 해주는데 password를 가로채기를 하는데
    // 해당 password가 무엇으로 해쉬가 되어 회원가입이 되었는지를 알아야
    // 같은 해쉬로 암호화 해서 DB에 있는 해쉬랑 비교할 수 있음.


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(principalDetailService).passwordEncoder(encodePWD());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http    //해당 주소로 들어오는 것을 허용 한다 (인증 없이)
                .csrf().disable()// csrf 토큰 비활성화 ( 테스트시 걸어두는 게 좋음)
                .authorizeRequests()
                    .antMatchers("/", "/auth/**", "/js/**", "/css/**", "/image/**", "/dummy/**")
                    .permitAll()
                    .anyRequest() // 아닌 모든 페이지는 인증이 필요해 라는 의미이다
                    .authenticated()
                .and()
                    .formLogin()
                    .loginPage("/auth/loginForm") // 로그인 form 의로 자동이동
                    .loginProcessingUrl("/auth/loginProc") // 스프링 시큐리티가 해당 주소로 요청 오는 로그인을 가로채서 대신 로그인해준다.
                    .defaultSuccessUrl("/");
    }
}
