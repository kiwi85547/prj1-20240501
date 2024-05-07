package com.prj1.service;

import com.prj1.domain.CustomUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper mapper;
    private final BoardMapper boardMapper;

    private final BCryptPasswordEncoder encoder;

    public void signup(Member member) {
//        패스워드 암호화
//        String password = member.getPassword();
//        String encodedPassword = encoder.encode(password);
        member.setPassword(encoder.encode(member.getPassword()));
        mapper.insert(member);
    }

    public List<Member> list() {
        return mapper.selectAll();
    }

    public Member get(Integer id) {
        return mapper.selectById(id);
    }

    //    여기에서는 remove를 받아서 하는 일이 없으므로 void와 Integer의 차이가 없음
    public void remove(Integer id) {
        // board 테이블에서 레코드 삭제
        boardMapper.deleteBoardByMemberId(id);

        // member 테이블에서 레코드 삭제
        mapper.deleteById(id);
    }

    public void modify(Member member) {
        if (member.getPassword() != null && member.getPassword().length() > 0) {
            // 암호를 입력했을 때만 변경
            member.setPassword(encoder.encode(member.getPassword()));
        } else {
            // 그렇지 않으면 기존 암호 유지
            Member old = mapper.selectById(member.getId());
            member.setPassword(old.getPassword());
        }
        mapper.update(member);
    }

    public String emailCheck(String email) {
        Member member = mapper.selectByEmail(email);
        if (member == null) {
            return "사용 가능한 이메일입니다.";
        } else {
            return "이미 존재하는 이메일입니다.";
        }
    }

    public boolean hasAccess(Integer id, Authentication authentication) {
        if (authentication == null) {
            return false;
        }
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUser user) {
            Member member = user.getMember();
            return member.getId().equals(id);
        }
        return false;
    }

    public boolean isAdmin(Authentication authentication) {
        Object o = authentication.getPrincipal();
        if (o instanceof CustomUser user) {
            // 스트림 이해하기..
            return user.getAuthorities().stream()
                    .map(GrantedAuthority::getAuthority)
                    .anyMatch(s -> s.equals("admin"));
        }
        return false;
    }
}
