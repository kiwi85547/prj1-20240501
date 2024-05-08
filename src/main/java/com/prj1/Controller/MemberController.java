package com.prj1.Controller;

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
public class MemberController {
    private final MemberService service;

    @GetMapping("/signup")
    public void signup() {
    }

    @PostMapping("/signup")
    public String signupPost(Member member, RedirectAttributes rttr) {
        service.signup(member);
        rttr.addFlashAttribute("member", member.getId());
        return "redirect:/";
    }

}
