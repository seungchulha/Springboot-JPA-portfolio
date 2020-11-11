package com.seungchul.portfolio.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.annotation.CreatedBy;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // auto_increment
    private int id;

    @Column(nullable = false, length = 100)
    private String title;

    @Lob // 대용량 데이터 사용시 필요
    private String content; //섬머노트 라이브러리 <html> 테그가 섞여서 디자인이됨.

    private int count; // 조회수

    @ManyToOne(fetch= FetchType.EAGER) // Many = Board , User = One

    @JoinColumn(name="userid")
    private User user; //DB 는 오브젝트를 저장할수없다. Foreign Key, 자바는 오브젝트를 저장할수 있다.

    @OneToMany(mappedBy = "board", fetch = FetchType.EAGER) //mappedBy 가 적혀있으면 연관관계의 주인이 아니다 ==> 난 FK가 아닙니다. DB에 컬럼을 만들지 마세요를 의미한다 // join 문을 통해 reply 정보를 얻어내는 용도의 list
    private List<Reply> reply;

    @CreationTimestamp
    private Timestamp createDate;
}
