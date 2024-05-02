package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Member {
    private Integer id;
    private String email;
    private String password;
    private String nickName;
    private LocalDateTime inserted;

//    # snake_case -> camelCase 로 맵핑
//    mybatis.configuration.map-underscore-to-camel-case=true
//    nick_name -> nickName으로 변환시켜줌
//    이게 없으면 nick_name에 맵핑이 안됨
}
