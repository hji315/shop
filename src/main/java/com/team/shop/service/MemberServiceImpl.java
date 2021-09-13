package com.team.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.shop.mapper.MemberMapper;
import com.team.shop.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper; 
	
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		membermapper.memberJoin(member);
	}

	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return membermapper.memberLogin(member);
	}
	
	//회원정보 수정
	@Override
	public void memberUpdate(MemberVO member) throws Exception {
		
		membermapper.memberUpdate(member);
	}
	
	//회원정보 조회
	@Override
	public MemberVO memberRead(MemberVO member) throws Exception {
		
		return membermapper.memberRead(member);
	}

	//회원 포인트, 돈 갱신
	@Override
	public void memberMoneyUpdate(MemberVO member) throws Exception{
		membermapper.memberMoneyUpdate(member);
	}
}
