package com.prj1.Controller;

import com.prj1.domain.Board;
import com.prj1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class BoardController {

    private final BoardService service;

    @GetMapping("")
    public String home() {
        return "home";
    }

    @GetMapping("add")
    public String add() {
        return "add";
    }

    @PostMapping("add")
    public String addPost(Board board, Authentication authentication, RedirectAttributes rttr) {
        service.addBoard(board, authentication);
        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    // /board?id=2
    // 개별 게시물 상세정보
    @GetMapping("/board")
    public String view(Integer id, Model model) {
        Board board = service.selectbyIdBoard(id);
        model.addAttribute("board", board);
        return "view";
    }

    @GetMapping("/boardList")
    public String boardList(Model model) {
        model.addAttribute("boardList", service.selectAllBoard());
        return "boardList";
    }

    @GetMapping("/board/update")
    public String updatePost(Integer id, Model model) {
        model.addAttribute("board", service.selectbyIdBoard(id));
        return "update";
    }

    @PostMapping("/board/update")
    public String updatePost(Board board, Authentication authentication, RedirectAttributes rttr) {
        service.updateBoard(board, authentication);
        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    // redirectAttributes를 썼는데 잘 넘어갔음.. 뭐지?
    @PostMapping("/board/delete")
    public String delete(Board board, Authentication authentication) {
        service.delete(board, authentication);
        return "redirect:/boardList";
    }
}
