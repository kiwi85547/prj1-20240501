package com.prj1.controller;

import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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
        return "redirect:/";
    }

    @GetMapping("list")
    public String list(Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("")
    public String info(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        return "member/info";
    }

    @PostMapping("remove")
    public String remove(Integer id) {
        service.remove(id);
        return "redirect:/member/signup";
    }

}
