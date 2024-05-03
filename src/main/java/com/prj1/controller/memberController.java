package com.prj1.controller;

import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public String remove(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication)) {
            service.remove(id);
        }

        return "redirect:/logout";
    }

    @GetMapping("modify")
    public String modifyForm(Integer id, Model model) {
        // 원래 가지고 있던 정보를 처리
        model.addAttribute("member", service.get(id));
        return "member/modify";
    }

    @PostMapping("modify")
    public String modify(Member member, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(member.getId(), authentication)) {
            service.modify(member);
        }
        rttr.addAttribute("id", member.getId());
        return "redirect:/member";
    }

    @GetMapping("email")
    @ResponseBody
    public String emailCheck(String email) {
        String message = service.emailCheck(email);
        return message;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }
}
