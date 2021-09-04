package com.team.shop.service;

import com.team.shop.model.MemberVO;

public interface MemberService {
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
}
