package com.springstudy.jj.service;

import com.springstudy.jj.domain.Member;

public interface MemberService {
	
	// 로그인 처리를 해주는 메서드
	public abstract int login(String id, String pass);
	
	// 회원 정보를 반환하는 메서드
	public abstract Member getMember(String id);
	
	// 아이디 중복 체크 메서드
	public boolean overlapIdCheck(String id);
	
	// 회원 가입 - 등록
	public abstract void addMember(Member m);
	
}
