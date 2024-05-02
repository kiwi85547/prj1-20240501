package com.prj1.mapper;

import com.prj1.domain.Member;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MemberMapper {

    //    sql문 작성하는법 틀리지 않기
//    insert into table (db 컬럼 이름) values (#{자바빈 이름})
    @Insert("""
            INSERT INTO member (email,password,nick_name)
            VALUES (#{email},#{password},#{nickName})
            """)
    int insert(Member member);

    @Select("""
            SELECT * FROM member
            ORDER BY id DESC
            """)
    List<Member> selectAll();

    @Select("""
            SELECT * FROM member where id=#{id}
            """)
    Member selectById(Integer id);

    @Delete("""
            DELETE FROM member WHERE id=#{id}
            """)
    int deleteById(Integer id);
}
