package com.team.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.shop.model.MemberVO;
import com.team.shop.service.MemberService;

@Controller
@RequestMapping(value = "/member/*") //MemberController 사용을 명확히 구분해주기 위해 회원과 관련된 호출은 url 경로에 memeber를 타도록 설계
public class MemberController {
	//로그 기록을 남기기 위해서 Logger 클래스 인 logger 변수를 선언 (.getLogger("해당변수를 사용할 Controller 명".class);)
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Autowired
	private MemberService memberservice; //@Autowired를 통해 MemberService.java가 MemberController.java에 자동 주입되도록 추가
	
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
		
		return "redirect:/mainlogin"; //로그인성공 시 메인로그인페이지로 이동
		
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody //이 어노테이션이 없을 경우 join.jsp로 결과가 반환되지 않음
	public String memberIdChkPOST(String memberId) throws Exception{
		
		/*logger.info("memberIdChk() 진입");*/
		
		int result = memberservice.idCheck(memberId);
		
		/*logger.info("결과값 = " + result);*/
		
		if(result != 0) { //존재하면 1, 아니면 0 반환
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}
		
		
	} // memberIdChkPOST() 종료
	
}
