package com.team.shop.mapper;


import com.team.shop.model.MemberVO;

public interface MemberMapper {
	
	
	//회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String memberId);

	// 로그인
    public MemberVO memberLogin(MemberVO member);
    
    //회원정보 수정
    public void memberUpdate(MemberVO member) throws Exception;

    // 회원정보 조회
	public MemberVO memberRead(MemberVO member);

	// 회원 포인트, 금액 갱신
	public void memberMoneyUpdate(MemberVO member);
	
	//아이디 찾기
	public String find_id(String memberMail) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO member) throws Exception;
	
	//비밀번호 체크
	public int passChk(MemberVO member);
	
	//비밀번호 찾기
	public MemberVO find_pw(MemberVO member) throws Exception;
	
	//비밀번호 변경
	public int change_pw(MemberVO member) throws Exception;
}
