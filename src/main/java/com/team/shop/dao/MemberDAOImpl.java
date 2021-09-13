package com.team.shop.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	// 아이디 찾기
	public String find_id(String memberMail) throws Exception{
		return sqlsession.selectOne("member.find_id", memberMail);
	}
	
}
