package com.team.shop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.shop.model.MemberVO;
import com.team.shop.model.PaymentVO;
import com.team.shop.model.ProductVO;
import com.team.shop.service.MemberService;
import com.team.shop.service.PaymentService;
import com.team.shop.service.ProductService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	// <<결제 프로세스 0.0.1>> - 추가, 삭제, 바뀔 수 있음
	// 주문(회원, 비회원) > 배송 정보 입력 > 상품 및 결제금액 확인 > 결제하기
	// buy > verification > checkCard > buyCheck > complete
	// +
	// > 주문내역 확인 > 취소, 반품, 교환 신청 > 주문 취소
	// > 택배 배송 조회 > 상품위치 확인 
	// > 재구매
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Inject
	private PaymentService payService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;
	
	
	
	//구매
	@RequestMapping(value="/buy", method=RequestMethod.GET)
	public String buy(ProductVO pvo, HttpSession session) throws Exception {
		logger.info("Payment Start!");
		// ProductVO를 세션으로 설정 
		// 결제 종료 후 삭제
		session.setAttribute("payProd", productService.read(pvo.getProduct_id()));
		session.setMaxInactiveInterval(15*60); // 세션 유지 시간 15분 
		
		// 이미 로그인 되어있는지 확인
		if(session.getAttribute("member") == null) 
			return "payment/buy";
		else
			return "payment/checkCard"; // 배송지 선택 나중에 추가
		
		// (buy)페이지에서 회원 비회원 주문 결정
		// 비회원 -> verification, 회원 -> memberLogin
	}
	@RequestMapping("/memberLogin")
	public void memberLogin() {
		
		// (memberLogin)페이지에서 로그인
	}
	
	//본인 인증
	@RequestMapping("/verification")
	public String verification() {
		return "payment/verification";
		// (verification)페이지에서 약관동의, 본인인증 구현
	}
	
	//카드 정보 확인
	@RequestMapping("/checkCard")
	public void checkCard() {
		// (checkCard)페이지에서 카드 정보(CardVO) 입력폼, 
		// 인증서 확인(Bank_accountVO의 accountPassword 입력폼) 구현
	}
	
	//구매 최종 확인
	@RequestMapping(value="/buyCheck")
	public String buyCheck(Model model) {
		// CardVO cvo 파라미터로 받아와야 함
		// @RequestParam("password") String accountPassword 파라미터로 받아와야 함
		// CardVO의 ano와 일치하는 Bank_account 컬럼을 
		// Bank_accountService에서 select해서
		// accountPassword와 password로 입력받은 값이 일치하는지 확인
		// MemberVO의 memberAddr1 확인해서 
		// 제주, 도서산간 지역은 추가 배송비 5000원
		// ProductVO의 product_size 확인해서 ?
		// 가로 x 세로 x 높이 / 6000
		// 1 이상이면 기본 배송비 7000원, 0.5당 1000원씩 추가
		
		model.addAttribute("shippingFee", 2500);
		return "payment/buyCheck";
		// (buyCheck)페이지에서 결제 금액 표시(상품가격,할인금액,결제금액),
		// 상품 정보 확인(ProductVO), 결제 동의, 결제하기(PaymentVO 입력폼 disabled) 구현
	}
	
	//결제 실행
	@RequestMapping(value="/complete", method=RequestMethod.POST)
	public void complete(Model model,PaymentVO pvo, HttpSession session) throws Exception{
		logger.info("Payment complete!");
		
		//아이디에 비어있는 입력을 받을 경우
		if(pvo.getMemberId().equals("")) {
			pvo.setMemberId("이것은 비회원 아이디");
		}
		else {
			logger.info("Save memberPoint!");
			pvo.setPayPoint(90); //적립포인트
			MemberVO mvo = memberService.memberRead(
					((MemberVO)session.getAttribute("member")));			
			mvo.setPoint(mvo.getPoint()+90); // 포인트 90 추가
			memberService.memberMoneyUpdate(mvo); // 후 DB에 업데이트
			session.setAttribute("member", mvo); // session도 업데이트
			System.out.println(mvo);
		}
		System.out.println(pvo);
		
		//결제내역 저장
		payService.add(pvo);
		session.removeAttribute("payProd"); //세션에서 상품 정보 삭제
		
		// (complete)페이지에서 결제 완료창 구현
		// 쌓인 포인트, 남은 잔액, 남은 재고수량 표시 
		// 배송조회로 이동하는 링크 표시, 구매내역 조회 링크 표시
	}
	//결제 내역 보기
	@RequestMapping(value="/view")
	public void view(Model model) throws Exception {
		logger.info("Payment history");
		List <PaymentVO> view = payService.view();
		model.addAttribute("view", view);
	}
	//결제 취소
	@RequestMapping(value="/cancel", method=RequestMethod.POST)
	public String cancel(PaymentVO pvo) throws Exception{
		logger.info("Payment cancel");
		System.out.println(pvo);
		payService.delete(pvo.getPno());
		return "redirect:/payment/view";
	}
	//결제 실패
	@RequestMapping("/fail")
	public String fail() {
		logger.error("PAYMENT FAIL!!!");
		return "payment/fail";
		// (fail)페이지에서 결제 실패 구현
	}
}
