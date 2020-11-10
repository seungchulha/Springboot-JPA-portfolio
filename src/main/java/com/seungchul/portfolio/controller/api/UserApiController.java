package com.seungchul.portfolio.controller.api;

import com.seungchul.portfolio.dto.ResponseDto;
import com.seungchul.portfolio.model.RoleType;
import com.seungchul.portfolio.model.User;
import com.seungchul.portfolio.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserApiController {

    @Autowired
    private UserService userService;

    @PostMapping("/api/user")
    public ResponseDto<Integer> save(@RequestBody User user){ // username, password, email, phone
        System.out.println("UserApiController : save 호출됨");
        // 실제로 DB에 insert 를 하고 아래에서 return 되면 되요.
        user.setRole(RoleType.USER);
        int result = userService.회원가입(user);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
    }
}
