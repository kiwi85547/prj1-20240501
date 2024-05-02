package com.prj1.domain;

import lombok.Data;

@Data
public class Member {
    //    id는 안만듬. 나는 만드는줄 알고 미리 썼다가 주석처리 함
//    private Integer id;
    private String email;
    private String password;
    private String nickName;

}
