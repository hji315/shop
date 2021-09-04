package com.team.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.shop.model.MemberVO;
import com.team.shop.service.MemberService;

@Controller
@RequestMapping(value = "/member/*") //MemberController 사용을 명확히 구분해주기 위해 회원과 관련된 호출은 url 경로에 memeber를 타도록 설계
public class MemberController {
	//로그 기록을 남기기 위해서 Logger 클래스 인 logger 변수를 선언 (.getLogger("해당변수를 사용할 Controller 명".class);)
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Autowired
	private MemberService memberservice;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void loginGET() {
		
		logger.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		
		logger.info("join 진입");
		
		// 회원가입 서비스 실행
		memberservice.memberJoin(member);
		
		logger.info("join Service 성공");
		
		return "redirect:/mainlogin";
		
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
}
