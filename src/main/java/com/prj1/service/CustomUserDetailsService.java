package com.prj1.service;

import com.prj1.domain.CustomerUser;
import com.prj1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // (member)여야 하므로 DB에서 조회하기
        // return new CustomerUser(member)
        return new CustomerUser(mapper.selectByEmail(username));
    }
}
