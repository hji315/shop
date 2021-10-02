package com.team.shop.service;

import javax.servlet.http.HttpServletResponse;

import com.team.shop.model.MemberVO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	/* 로그인 */
    public MemberVO memberLogin(MemberVO member) throws Exception;
    
    //회원 정보 수정
    public void memberUpdate(MemberVO member) throws Exception;

    //회원 정보 조회
	MemberVO memberRead(MemberVO member) throws Exception;

	//회원 포인트, 금액 갱신
	void memberMoneyUpdate(MemberVO member) throws Exception;
	
	//아이디 찾기
	String find_id(HttpServletResponse response, String memberMail) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO member) throws Exception;
	
	//비밀번호 체크
	public int passChk(MemberVO member) throws Exception;
	
	//비밀번호 찾기
	public MemberVO find_pw(MemberVO vo) throws Exception;
	
	//비밀번호 변경
	public int change_pw(MemberVO vo) throws Exception;
	
}
