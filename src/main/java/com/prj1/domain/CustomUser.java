package com.prj1.domain;

import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

@Getter
public class CustomUser extends User {
    private Member member;

    public CustomUser(Member member) {
        // 권한이 null이면 빈 리스트가 넘어오므로 null체크가 필요 없음
        super(member.getEmail(), member.getPassword(),
                member.getAuthority().stream()
                        .map(SimpleGrantedAuthority::new).toList());
//                List.of(
//                // 컬렉션 타입이므로 여러개 만들 수 있음
//                // interface로는 객체 만들 수 없음. 인터페이스를 만들어도 되지만,
//                // interface인 GrantedAuthority를 구현한 클래스를 찾아서 쓸 예정
//                new SimpleGrantedAuthority("admin")
//        ));

        this.member = member;
    }
}
