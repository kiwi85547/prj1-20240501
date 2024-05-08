package com.prj1.domain;

import lombok.Getter;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Getter
//파라미터 없는 기본 생성자가 없기 때문에 호출하지 못하여 problem이 생김
public class CustomerUser extends User {


    private Member member;


    // Member 테이블에서 조회
    public CustomerUser(Member member) {
        super(member.getEmail(), member.getPassword(), List.of());
        this.member = member;
    }

}
