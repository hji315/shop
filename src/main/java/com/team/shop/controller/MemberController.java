package com.team.shop.controller;

import java.util.Random;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.shop.model.MemberVO;
import com.team.shop.service.MemberService;

@Controller
@RequestMapping(value = "/member/*") //MemberController 사용을 명확히 구분해주기 위해 회원과 관련된 호출은 url 경로에 memeber를 타도록 설계
public class MemberController {
	//로그 기록을 남기기 위해서 Logger 클래스 인 logger 변수를 선언 (.getLogger("해당변수를 사용할 Controller 명".class);)
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Autowired
	private MemberService memberservice; //@Autowired를 통해 MemberService.java가 MemberController.java에 자동 주입되도록 추가
	
    @Autowired
    private JavaMailSender mailSender; //JavaMailSender 객체 타입인 mailSender 변수를 선언
	
    @Autowired(required=false)
    private BCryptPasswordEncoder pwEncoder;
    
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public void loginGET() {
		
		logger.info("회원가입 페이지 진입");
		
	}
	
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception{
		
		/* 비밀번호 인코딩 전 코드
		 * logger.info("join 진입");
		
		// 회원가입 서비스 실행
		memberservice.memberJoin(member);
		
		logger.info("join Service 성공");*/

        String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw = member.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        member.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
        
        /* 회원가입 쿼리 실행 */
        memberservice.memberJoin(member);
		
		return "redirect:/"; //로그인성공 시 메인로그인페이지로 이동
		
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
	
    /* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111; //111111 ~ 999999 범위의 숫자를 얻기 위해서 nextInt(888888) + 111111를 사용
        logger.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "shopproject@naver.com";
        String toMail = email; //수신 받을 이메일, 뷰로부터 받은 이메일 주소인 변수 email
        String title = "SHOP 회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
    
		try { //이메일 전송을 위한 코드
		    
		    MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		    helper.setFrom(setFrom);
		    helper.setTo(toMail);
		    helper.setSubject(title);
		    helper.setText(content,true);
		    mailSender.send(message);
		    
		}catch(Exception e) {
		    e.printStackTrace();
		}
 
        String num = Integer.toString(checkNum);
        
        return num;
    }
    
    /* 로그인 */
    //MemberVO는 데이터 전달 받기 위해
    //HttpServletRequest는 로그인 성공 시 session에 회원 정보를 저장
    //RedirectAttributes는 로그인 실패 시 리다이렉트 된 로그인 페이지에 실패를 의미하는 데이터를 전송
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		/*    비밀번호 암호화 이전 코드
		 * 
		 *    //데이터 전달 확인
		       // System.out.println("login 메서드 진입");
		       // System.out.println("전달된 데이터 : " + member);
		       
		    	//session을 사용하기 위해 session 변수를 선언하고 request.getSession()으로 초기화
		    	HttpSession session = request.getSession();
		    	//MemberService.java의 memberLogin메서드로 초기화,인자는 서버로부터 전달받은 member 변수를 사용
		    	//memberLogin 메서드를 요청하게 되면 MemberMapper.java를 거쳐서 로그인 쿼리가 실행이 되게 되고 
		    	//그 결과 값이 담긴 MemberVO 객체를 반환받아서 변수 lvo에 저장
		    	MemberVO lvo = memberservice.memberLogin(member);
		    	
		    	 if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
		     
		     int result = 0;
		     rttr.addFlashAttribute("result", result);
		     return "redirect:/member/login";
		     
		 }
		 
		 session.setAttribute("member", lvo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		 
		 return "redirect:/mainlogin";*/
    	
    	HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
        
        MemberVO lvo = memberservice.memberLogin(member);
        
        if(lvo != null) {            // 일치하는 아이디 존재시
            
            rawPw = member.getMemberPw();        // 사용자가 제출한 비밀번호
            encodePw = lvo.getMemberPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                
                lvo.setMemberPw("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", lvo);     // session에 사용자의 정보 저장
                return "redirect:/";        // 메인페이지 이동
                
            } else {
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
          
        }
    	
    }
    
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
    	logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession(); //HttpSession타입의 session 변수 및 초기화
    	
        session.invalidate(); //"invalidate()" 메서드의 경우 세션 전체를 무효화
        
        return "redirect:/";
    }
    
    //회원 정보 수정
    @RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
    public String registerUpdateView() throws Exception{
    	
    	return "member/memberUpdateView";
    }

    @RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
    public String registerUpdate(MemberVO member, HttpSession session) throws Exception{
    	
    	String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw = member.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        member.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
    	
    	memberservice.memberUpdate(member);
    	
    	session.invalidate();
    	
    	return "redirect:/";
    }
    
	//마이페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
	}
	
	// 아이디 찾기 폼
	@RequestMapping(value = "/find_id_form.do")
	public String find_id_form() throws Exception{
		return "/member/find_id_form";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("memberMail") String memberMail, Model md) throws Exception{
		md.addAttribute("memberId", memberservice.find_id(response, memberMail));
		return "/member/find_id";
	}
	
	// 회원 탈퇴 get
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	// 회원 탈퇴 post
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		memberservice.memberDelete(member);
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public boolean passChk(MemberVO member) throws Exception {

		MemberVO login = memberservice.memberLogin(member);
		boolean pwdChk = pwEncoder.matches(member.getMemberPw(),login.getMemberPw());
		System.out.println(login);
		System.out.println(pwdChk);
		return pwdChk;
	}
	
	
}
