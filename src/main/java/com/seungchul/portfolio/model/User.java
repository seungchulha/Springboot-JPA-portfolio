package com.seungchul.portfolio.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.sql.Timestamp;

//ORM --> Java(다른언어) Object --> 테이블로 매핑해주는 기술 상당히 편리

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity // User 클래스가 자동으로 MySQL 에 테이블이 생성된다.
//@DynamicInsert // insert 할때 null 인 필드를 제외시켜준다
public class User {

    @Id // PrimaryKey
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 프로젝트에서 연결된 DB의 넘버링 전략을 따라간다.
    private int id; // sequence, auto_increment

    //결론적으로 나머지는 다 자동 생성 되는 데이터이기에 우리는 username, password, email, phoneNum만 받으면 된다
    @Column(nullable = false, length = 100)
    private String username; // 아이디

    @Column(nullable = false, length = 100) //넉넉하게 주는 이유는 우리가 넣는 이 패스워드를 해쉬로 바꿔서 암호화 할것이기 때문에 넉넉하게
    private String password;

    @Column(nullable = false, length = 50, unique = true)
    private String email;

    @Column(nullable = true, length = 30, unique = true)
    private String phone;

    //@ColumnDefault("'user'") //' ' 사이에 넣는 것은 이것을 문자임을 알려주려고 하는것
    // DB 는 RoleType 이라는게 없다
    @Enumerated(EnumType.STRING)
    private RoleType role; // Enum을 쓰는게 좋다. (어떤 데이터에 도메인을 만들어줄수있는게 Enum) //Admin , user, manager

    private String oauth; // kakao , google 어떤걸로 가입했는지 알게해주는 것;

    @CreationTimestamp // 시간이 자동으로 입력된
    private Timestamp createDate;

}
