package com.team.shop.dao;

import com.team.shop.model.MemberVO;

public interface MemberDAO {
	
	//아이디찾기
	public String find_id(String memberMail) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO member) throws Exception;
	
	// 패스워드 체크
	public int passChk(MemberVO member) throws Exception;

}

