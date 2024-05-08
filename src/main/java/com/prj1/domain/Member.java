package com.prj1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Member {
    private Integer id;
    private String writer;
    private String email;
    private String password;
    private LocalDateTime inserted;
}
