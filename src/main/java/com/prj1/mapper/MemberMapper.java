package com.prj1.mapper;

import com.prj1.domain.Member;
import org.apache.ibatis.annotations.*;
import org.springframework.ui.Model;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member (writer,email,password) VALUES (#{writer},#{email},#{password})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Member member);

    @Select("""
            SELECT * FROM member WHERE id=#{id}
            """)
    Member selectById(Integer id);

    @Update("""
            UPDATE member SET writer=#{writer},password=#{password} WHERE id=#{id}
            """)
    int modify(Member member);

    @Delete("""
            DELETE FROM member
            WHERE id = #{id};
            """)
    void delete(Integer id);

    @Select("""
            SELECT * FROM member""")
    List<Member> selectAll(Model model);

    @Select("""
            SELECT * FROM member WHERE email=#{email}
            """)
    Member selectByEmail(String email);

}
