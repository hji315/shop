package com.team.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.shop.model.MemberVO;
import com.team.shop.model.PaymentVO;
import com.team.shop.service.PaymentService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Inject
	private PaymentService payService;
	
    /* 정보 수정 페이지 접속 */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET() throws Exception{
        logger.info("정보 수정 페이지 접속");
    }
    
    /* 장바구니 페이지 접속 */
    @RequestMapping(value = "/basket", method = RequestMethod.GET)
    public void basketGET() throws Exception{
        logger.info("장바구니 페이지 접속");
    }
    
    /* 배송조회 페이지 접속 */
    @RequestMapping(value = "/delivery", method = RequestMethod.GET)
    public void deliveryGET() throws Exception{
        logger.info("배송 조회 페이지 접속");
    }
    
    /* 후기 작성 페이지 접속 */
    @RequestMapping(value = "/postscript", method = RequestMethod.GET)
    public void authorManageGET() throws Exception{
        logger.info("후기 작성 페이지 접속");
    }  
	
    /* 포인트 조회 페이지 접속 */
    @RequestMapping(value = "/point", method = RequestMethod.GET)
    public void pointGET() throws Exception{
    	logger.info("포인트 조회 페이지 접속");
    }  
    @RequestMapping("/delivery")
	public String mypageDelivery(Model model, HttpSession session) throws Exception {
		logger.info("Mypage Delivery!");
		List <PaymentVO> view;
		MemberVO mvo = getSessionMember(session, "member");
		//관리자인지 확인
		if(mvo.getAdminCk()==1) {
			//전체 조회
			view = payService.view();
		}else {
			//회원 아이디로 조회
			view = payService.view(getSessionMember(session, "member").getMemberId());
		}
		model.addAttribute("view", view);
		return "/mypage/delivery";
	}
    @RequestMapping(value="/view")
	public void view(Model model, HttpSession session) throws Exception {
		logger.info("Mypage payment history");
		List <PaymentVO> view;
		MemberVO mvo = getSessionMember(session, "member");
		//관리자인지 확인
		if(mvo.getAdminCk()==1) {
			//전체 조회
			view = payService.view();
		}else {
			//회원 아이디로 조회
			view = payService.view(getSessionMember(session, "member").getMemberId());
		}
		model.addAttribute("view", view);
	}
  //세션의 MemberVO 받아오기
  	private MemberVO getSessionMember(HttpSession session, String member) {
  		return (MemberVO)session.getAttribute(member);
  	}
}
