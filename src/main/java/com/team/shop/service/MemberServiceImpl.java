package com.team.shop.service;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.shop.dao.MemberDAO;
import com.team.shop.mapper.MemberMapper;
import com.team.shop.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper membermapper; 
	
	@Inject
	MemberDAO dao;
	
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
	
	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String memberMail) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = membermapper.find_id(memberMail);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}
	
	//회원탈퇴
	@Override
	public void memberDelete(MemberVO member) throws Exception {
		membermapper.memberDelete(member);
	}
	
	//비밀번호 체크
	@Override
	public int passChk(MemberVO member) throws Exception {
		int result = membermapper.passChk(member);
		return result;
	}
	
	
}
