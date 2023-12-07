package com.springstudy.jj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springstudy.jj.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	private static final String NAME_SPACE = "com.springstudy.jj.mapper.MemberMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member getMember(String id) {
		return sqlSession.selectOne(NAME_SPACE + ".getMember", id);
	}
	
	//  회원가입
	public void addMember(Member m) {
		sqlSession.insert(NAME_SPACE + ".addMember", m);
	}
	
}
