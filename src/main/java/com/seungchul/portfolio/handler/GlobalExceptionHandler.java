package com.seungchul.portfolio.handler;

import com.seungchul.portfolio.dto.ResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

    @ExceptionHandler(value=Exception.class) // IllegalArgumentException 이 발생하면 밑에 메소드 의 e 값으로 전달되서 리턴하게한다 // 모든 익셉션이 걸리게 하려면 Exception.class로 바꿔주면된다
    public ResponseDto<String> handleArgumentException(IllegalArgumentException e){
        return new ResponseDto<String>(HttpStatus.INTERNAL_SERVER_ERROR.value(), e.getMessage()); // HttpStatus.INTERNAL_SERVER_ERROR.value() == 500 에러
    }

}
