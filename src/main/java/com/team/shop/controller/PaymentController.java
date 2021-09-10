package com.team.shop.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.shop.model.PaymentVO;
import com.team.shop.service.PaymentService;

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
	
	//구매
	@RequestMapping("/buy")
	public String buy() {
		// ProductVO, memberId를 전달받아서
		// 결제 프로세스에서 계속해서 사용할 수 있게
		// 세션으로 설정
		return "payment/buy";
		// (buy)페이지에서 
	}
	
	//본인 인증
	@RequestMapping("/verification")
	public String verification() {
		return "payment/verification";
		// (verification)페이지에서 약관동의, 본인인증 구현
	}
	
	//카드 정보 확인
	@RequestMapping("/checkCard")
	public String checkCard() {
		return "payment/checkCard";
		// (checkCard)페이지에서 카드 정보(CardVO) 입력폼, 
		// 인증서 확인(Bank_accountVO의 accountPassword 입력폼) 구현
	}
	
	//구매 최종 확인
	@RequestMapping(value="/buyCheck", method = RequestMethod.POST)
	public String buyCheck() {
		// CardVO cvo 파라미터로 받아와야 함
		// @RequestParam("password") String accountPassword 파라미터로 받아와야 함
		// CardVO의 ano와 일치하는 Bank_account 컬럼을 
		// Bank_accountService에서 select해서
		// accountPassword와 password로 입력받은 값이 일치하는지 확인
		
		return "payment/buyCheck";
		// (buyCheck)페이지에서 결제 금액 표시(상품가격,할인금액,결제금액),
		// 상품 정보 확인(ProductVO), 결제 동의, 결제하기(PaymentVO 입력폼 disabled) 구현
	}
	
	//결제 실행
	@RequestMapping(value="/complete", method = RequestMethod.POST)
	public String complete(Model model,PaymentVO pvo) throws Exception{
		logger.info("Payment complete!");
		pvo.setMemberId("이것은 결제하는 아이디");
		pvo.setProduct_id(1234); // 상품번호
		pvo.setShippingFee(1200); // 배송비
		pvo.setPayMoney(5600); //결제금액
		pvo.setPayPoint(90); //적립포인트
		System.out.println(pvo);
		
		//결제내역 저장
		payService.add(pvo);
		List <PaymentVO> view = payService.view();
		model.addAttribute("view", view);
		return "payment/complete";
		// (complete)페이지에서 결제 완료창 구현
		// 쌓인 포인트, 남은 잔액, 남은 재고수량 표시 
		// 배송조회로 이동하는 링크 표시, 구매내역 조회 링크 표시
	}
	
	//결제 실패
	@RequestMapping("/fail")
	public String fail() {
		logger.error("PAYMENT FAIL!!!");
		return "payment/fail";
		// (fail)페이지에서 결제 실패 구현
	}
}
