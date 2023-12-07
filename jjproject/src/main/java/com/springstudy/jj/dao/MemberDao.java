package com.springstudy.jj.dao;

import com.springstudy.jj.domain.Member;

public interface MemberDao {
	
	// 회원 가입 - 등록
	public abstract void addMember(Member m);
	
	// 로그인 시 회원 정보 가져오기
	public abstract Member getMember(String id);
	
}
