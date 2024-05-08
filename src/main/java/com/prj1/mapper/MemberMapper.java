package com.prj1.mapper;

import com.prj1.domain.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member (writer,email,password) VALUES (#{writer},#{email},#{password})
            """)
    void insert(Member member);
}
