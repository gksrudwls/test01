package com.springstudy.jj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.springstudy.jj.dao.MemberDao;
import com.springstudy.jj.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int login(String id, String pass) {
		// 사용자가 입력한 값과 DB에서 가져온 값을 비교
		// 비밀번호가 저장될 때 암호화되어 저장되어있음
		Member m = memberDao.getMember(id);
		int result = -1;
		if(m == null) {
			return result;
		}
		
		// 로그인 성공
		if(passwordEncoder.matches(pass, m.getPass())) {
			result = 1;
		} else {
			// 비밀번호가 틀린 경우
			result = 0;
		}
		
		return result;
	}

	@Override
	public Member getMember(String id) {
		return memberDao.getMember(id);
	}
	
	public boolean overlapIdCheck(String id) {
		Member m = memberDao.getMember(id);
		if(m == null) {
			return false;
		}
		return true;
	}
	
	public void addMember(Member m) {
		// 회원 정보를 DB에 추가하기 전에 비밀번호 암호화
		// m.setPass(passwordEncoder.encode(m.getPass()));
		// System.out.println(m.getPass());
		m.setPass(passwordEncoder.encode(m.getPass()));
		memberDao.addMember(m);
	}
	
}
