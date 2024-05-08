package com.prj1.service;

import com.prj1.domain.CustomerUser;
import com.prj1.domain.Member;
import com.prj1.mapper.BoardMapper;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class MemberService {


    private final MemberMapper mapper;
    private final BoardMapper boardMapper;
    // 암호화 해주는 객체
    private final BCryptPasswordEncoder bCryptPasswordEncoder;


    public void signup(Member member) {
        // 사용자가 입력한 패스워드를 암호화해서 다시 바꿔준다..
        String password = member.getPassword();
        String encodedPassword = bCryptPasswordEncoder.encode(password);
        member.setPassword(encodedPassword);
        // 위 세 줄을 한 줄로
//        member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
        mapper.insert(member);
    }

    public Member selectById(Integer id) {
        return mapper.selectById(id);
    }

    public void modifyMember(Member member) {
        mapper.modify(member);
    }

    public void delete(Integer id) {
        // id가 board테이블의 member_id를 참조하고 있으므로
        // board테이블을 먼저 삭제한 뒤 member테이블을 삭제해야 함
        boardMapper.deleteByMemberId(id);
        mapper.delete(id);
    }

    public List<Member> list(Model model) {
        return mapper.selectAll(model);
    }

    public boolean hasAccess(Integer id, Authentication authentication) {
        if (authentication == null) {
            return false;
        }
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomerUser user) {
            Member member = user.getMember();
            return member.getId().equals(id);
        }
        return false;
    }

}
