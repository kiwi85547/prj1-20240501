package com.prj1.domain;

import lombok.Getter;
import org.springframework.security.core.userdetails.User;

import java.util.List;


@Getter
public class CustomerUser extends User {
    private Member member;

    public CustomerUser(Member member) {
        super(member.getEmail(), member.getPassword(), List.of());
        this.member = member;
    }
}
