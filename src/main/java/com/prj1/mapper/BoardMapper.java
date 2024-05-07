package com.prj1.mapper;

import com.prj1.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    // insert into board (sql 컬럼)
    // set (#{자바빈 컬럼})
    @Insert("""
            INSERT INTO board (title,content,writer,member_id)
            VALUES (#{title},#{content},#{writer},#{memberId})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Board board);


    @Select("""
            SELECT id,title,content,writer,inserted FROM board WHERE id=#{id}
            """)
    Board selectById(Integer id);

    @Select("""
            SELECT id,title,writer FROM board
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
}
