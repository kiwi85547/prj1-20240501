package com.prj1.service;

import com.prj1.domain.Board;
import com.prj1.domain.CustomerUser;
import com.prj1.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardService {
    private final BoardMapper mapper;

    public void addBoard(Board board, Authentication authentication) {
        if (authentication.getPrincipal() instanceof CustomerUser user) {
            board.setMemberId(user.getMember().getId());
            mapper.insert(board);
        }
    }

    public Board selectbyIdBoard(Integer id) {
        return mapper.selectById(id);
    }

    public List<Board> selectAllBoard() {
        return mapper.selectAll();
    }

    public void updateBoard(Board board, Authentication authentication) {
        if (authentication.getPrincipal() instanceof CustomerUser user) {
            board.setMemberId(user.getMember().getId());
            mapper.update(board);
        }
    }

    public void delete(Board board, Authentication authentication) {
        if (authentication.getPrincipal() instanceof CustomerUser user) {
            board.setMemberId(user.getMember().getId());
            mapper.delete(board);
        }
    }
}
