package com.team.shop.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.team.shop.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	// 아이디 찾기
	public String find_id(String memberMail) throws Exception{
		return sqlsession.selectOne("member.find_id", memberMail);
	}
	
	// 회원탈퇴
	@Override
	public void memberDelete(MemberVO member) throws Exception{
		//MemberVO에 담긴 값들을 보내줌
		//xml에서 memberMapper.memberDelete에 있는 파라미터 값이 매칭
		sqlsession.delete("member.memberDelete", member);
	}
	
	//비밀번호 확인
	@Override
	public int passChk(MemberVO member) throws Exception {
		int result = sqlsession.selectOne("memberMapper.passChk", member);
		return result;
	}
	
}
