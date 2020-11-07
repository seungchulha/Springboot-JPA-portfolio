package com.seungchul.portfolio.test;

import lombok.*;

//@Getter
//@Setter

//getter setter 를 동시에 만들어주고 싶으면 @Data 를 써주면 되고
//모든 것을 다쓰는 생성자를 만들어 주고 싶으면 @AllArgsConstructor
@Data
@AllArgsConstructor
@NoArgsConstructor //빈생성자
public class Member {
    private int id;
    private String username;
    private String password;
    private String email;
}
