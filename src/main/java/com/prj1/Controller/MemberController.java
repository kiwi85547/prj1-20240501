package com.prj1.Controller;

import com.prj1.domain.Member;
import com.prj1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        // 알림창이 뜨지 않음.
//        rttr.addFlashAttribute("message", "가입되었습니다");
        rttr.addAttribute("id", member.getId());
        return "redirect:";
    }

    // 전체 회원 정보 조회
    @GetMapping("/list")
    public void list(Model model) {
        model.addAttribute("list", service.list(model));
    }


    // 개별 회원 정보 조회
    @GetMapping("/")
    public String info(Integer id, Model model) {
        model.addAttribute("member", service.selectById(id));
        return "member/info";
    }

    // 회원정보 수정
    @GetMapping("/modify")
    public String modify(Integer id, Model model) {
        model.addAttribute("member", service.selectById(id));
        return "member/modify";
    }

    @PostMapping("/modify")
    public String modifyPost(Member member, RedirectAttributes rttr) {
        service.modifyMember(member);
        rttr.addAttribute("id", member.getId());
        return "redirect:/member/";
    }

    // 탈퇴
    @PostMapping("/delete")
    public String delete(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication)) {
            service.delete(id);
        }
        return "redirect:/boardList";
    }

    // 로그인
    @GetMapping("login")
    public String login() {
        return "member/login";
    }
}
