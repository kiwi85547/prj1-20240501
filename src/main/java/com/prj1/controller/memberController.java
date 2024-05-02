package com.prj1.controller;

import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequiredArgsConstructor
@RequestMapping("member")
// /member/view
public class memberController {
    private final MemberService service;

    @GetMapping("signup")
    public String signupForm() {
        // null, void 타입으로 리턴해도 됨
        return "member/signup";
    }

    @PostMapping("signup")
    public String singup(Member member) {
        service.signup(member);
        return null;
    }

    @GetMapping("view")
    public String viewForm(Model model, RedirectAttributes rttr) {
        // 특정 회원정보 내용만 보이는 게시판
        service.view();
        rttr.addAttribute("id",);
        return "member/view";
    }

}
