package com.prj1.mapper;

import com.prj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    // insert into board (sql 컬럼)
    // set (#{자바빈 컬럼})
    @Insert("""
            INSERT INTO board (title,content,member_id)
            VALUES (#{title},#{content},#{memberId})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Board board);


    @Select("""
            SELECT b.id,b.title,b.content,b.inserted,m.writer FROM board b JOIN member m ON b.member_id = m.id WHERE b.id=#{id}
            """)
    Board selectById(Integer id);

    @Select("""
            SELECT b.id,b.title,m.writer FROM board b JOIN member m ON b.member_id = m.id
            """)
    List<Board> selectAll();

    @Update("""
            UPDATE board SET title=#{title},content=#{content} WHERE id = #{id}
            """)
    int update(Board board);

    @Delete("""
            DELETE FROM board WHERE id=#{id}
            """)
    void delete(Board board);

    @Delete("""
            DELETE FROM board WHERE member_id=#{id}
            """)
    void deleteByMemberId(Integer id);
}
