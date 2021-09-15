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

import com.team.shop.model.CardVO;
import com.team.shop.model.MemberVO;
import com.team.shop.model.PaymentVO;
import com.team.shop.model.ProductVO;
import com.team.shop.service.CardService;
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

	@Inject
	private CardService cardService;
	
	//구매
	@RequestMapping(value="/buy", method=RequestMethod.GET)
	public String buy(ProductVO pvo, HttpSession session, Model model) throws Exception {
		logger.info("Payment Start!");
		int stock = ((ProductVO)productService.read(pvo.getProduct_id())).getProduct_stock();
		int proAmount = 1; // 구매 갯수 1로 설정
		//결제 실패 
		if(stock < proAmount) {
			model.addAttribute("cause", "재고부족");
			return "payment/fail";
		}
		// ProductVO를 세션으로 설정 
		// 결제 종료 후 삭제
		session.setAttribute("payProd", productService.read(pvo.getProduct_id()));
		session.setMaxInactiveInterval(15*60); // 세션 유지 시간 15분 
		
		// 이미 로그인 되어있는지 확인
		if(isSessionMember(session)) {
			MemberVO mvo = 
					memberService.memberRead(getSessionMember(session, "member"));
			System.out.println("회원 : " + mvo);
			model.addAttribute("payMember", mvo); //회원 주소 가져오기 위해
			return "payment/choiceAddr"; 
		}
		else {
			return "payment/buy";	
		}
		// (buy)페이지에서 회원 비회원 주문 결정
		// 비회원 -> verification, 회원 -> memberLogin
	}
	@RequestMapping("/memberLogin")
	public String memberLogin() {
		
		return "redirect:/member/login";
		// member login 페이지로 보냄
	}
	
	//본인 인증
	@RequestMapping("/verification")
	public String verification() {
		return "payment/verification";
		// (verification)페이지에서 약관동의, 본인인증 구현
	}
	
	//배송지 입력
	@RequestMapping("/checkAddr")
	public String checkAddress(Model model, HttpSession session, String name) throws Exception {
		logger.info("Payment check member!");
		
		//로그인 되어 있는지 확인
		if(isSessionMember(session)) {
			MemberVO mvo = 
					memberService.memberRead(getSessionMember(session, "member"));
			System.out.println("회원 : " + mvo);
			model.addAttribute("payMember", mvo); //회원 주소 가져오기 위해
			return "payment/choiceAddr";
		}
		else {
			System.out.println("비회원 : " + name);
			//비회원은 아이디 대신 이것을 사용
			model.addAttribute("noMember", name); // 필요하면 이름+전화번호로
			return "payment/checkAddr";
		}
		// (checkAddr)페이지에서 배송지 입력폼 구현
		// 로그인 됐으면 배송지 선택 창으로
	}
	//카드 정보 확인
	@RequestMapping("/checkCard")
	public void checkCard(MemberVO mvo, HttpSession session) {
		logger.info("Payment address!");
		// 배송지 입력 받아서 저장
		if(isSessionMember(session)) {
			System.out.println("회원 배송지 : " + mvo);
			session.setAttribute("member", mvo);
		}else {
			System.out.println("비회원 배송지 : " + mvo);
			session.setAttribute("noMember", mvo);
		}
		// (checkCard)페이지에서 카드 정보(CardVO) 입력폼, 
		// 인증서 확인(Bank_accountVO의 accountPassword 입력폼) 구현
	}
	
	//구매 최종 확인
	@RequestMapping(value="/buyCheck")
	public String buyCheck(Model model, CardVO cvo, String password, HttpSession session) throws Exception{
		// CardVO cvo 파라미터로 받아와야 함
		// @RequestParam("password") String accountPassword 파라미터로 받아와야 함
		// CardVO의 ano와 일치하는 Bank_account 컬럼을 
		// Bank_accountService에서 select해서
		// accountPassword와 password로 입력받은 값이 일치하는지 확인
		logger.info("Payment card!");
		System.out.println("입력받은 비밀번호 : " + password);
		String accountPassword = "1234"; // 임시 비밀번호
		//결제 실패
		if(!accountPassword.equals(password)) {
			model.addAttribute("cause", "카드 비밀번호 불일치");
			return "payment/fail";
		}
		cvo.setAno(13241234);
		//회원, 비회원
		String mem = isSessionMember(session)?"member":"noMember";
		cvo.setMemberId(getSessionMember(session, mem).getMemberId());
		
		cardService.add(cvo);
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
	public String complete(Model model,PaymentVO payVO, HttpSession session) throws Exception{
		logger.info("Payment complete!");
		int point = 90; // 적립 포인트
		int proAmount = 1; // 구매하려는 상품 수량
		ProductVO pvo = (ProductVO)session.getAttribute("payProd");
		// 회원, 비회원
		if(isSessionMember(session)) {
			logger.info("Save memberPoint!");
			
			payVO.setPayPoint(90); //적립포인트
			MemberVO mvo = memberService.memberRead(
					getSessionMember(session, "member"));			
			//결제 실패
			if(mvo.getMoney() < payVO.getPayMoney()) {
				model.addAttribute("cause", "잔액부족");
				return "payment/fail";
			}
			
			mvo.setPoint(mvo.getPoint()+point); // 포인트 90 추가
			mvo.setMoney(mvo.getMoney()-payVO.getPayMoney());//돈에서 상품 금액 차감
			memberService.memberMoneyUpdate(mvo); // 후 DB에 업데이트
			session.setAttribute("member", mvo); // session도 업데이트
			
			System.out.println("결제 후 회원 : " + mvo);
		}
		else {
			logger.info("NoMember check!");
			MemberVO mvo = getSessionMember(session, "noMember");
			//비회원 본인인증시 이름으로 적용
			payVO.setMemberId(mvo.getMemberId());
		}
		
		System.out.println("결제된 것 : " + payVO);
		
		//결제내역 저장
		payService.add(payVO);
		//재고 수량 갱신 
		pvo.setProduct_stock(pvo.getProduct_stock()-proAmount);
		productService.update(pvo);
		
		model.addAttribute("payProd", pvo); //재고수량 넘기기
		session.removeAttribute("payProd"); //세션에서 상품 정보 삭제
		
		return "payment/complete";
		// (complete)페이지에서 결제 완료창 구현
		// 쌓인 포인트, 남은 잔액, 남은 재고수량 표시 
		// 배송조회로 이동하는 링크 표시
	}
	//결제 내역 보기
	@RequestMapping(value="/view")
	public void view(Model model, HttpSession session) throws Exception {
		logger.info("Payment history");
		List <PaymentVO> view;
		if(isSessionMember(session)) {
			//회원 아이디로 조회
			view = payService.view(getSessionMember(session, "member").getMemberId());
		}else {
			//전체 조회
			view = payService.view();
		}
		model.addAttribute("view", view);
	}
	//결제 취소, 환불
	@RequestMapping(value="/cancel", method=RequestMethod.POST)
	public String cancel(PaymentVO payVO, HttpSession session) throws Exception{
		logger.info("Payment cancel");
		System.out.println("취소된 결제 : " + payVO);
		MemberVO mvo = getSessionMember(session, "memeber");
		mvo.setMoney(mvo.getMoney()+payVO.getPayMoney()); // 금액 환불
		mvo.setPoint(mvo.getPoint()-payVO.getPayPoint()); // 적립 포인트 회수
		ProductVO pvo = productService.read(payVO.getProduct_id());
		pvo.setProduct_stock(pvo.getProduct_stock()+1); // 재고수량 추가 
		
		//DB에 업데이트
		productService.update(pvo);
		memberService.memberMoneyUpdate(mvo);
		payService.delete(payVO.getPno());
		
		return "redirect:/payment/view";
	}
	
	//결제 실패
	@RequestMapping("/fail")
	public String fail(HttpSession session) {
		logger.error("PAYMENT FAIL!!!");
		if(session.getAttribute("noMember")!=null) {
			session.removeAttribute("noMember");//비회원 세션 삭제
		}
		session.removeAttribute("payProd"); //상품 정보 세션 삭제
		return "payment/fail";
		// (fail)페이지에서 결제 실패 구현
	}
	
	// 배송 조회
	@RequestMapping("/delivery")
	public String deliveryView(Model model, HttpSession session) {
		logger.info("Delivery!");
		String mem = (isSessionMember(session))?"member":"noMember";
		MemberVO mvo = getSessionMember(session, mem);
		model.addAttribute("deliveryMVO",mvo);
		
		return "payment/delivery";
	}
	
	//세션에 "member"가 있는지 => 로그인 되어 있는지
	private boolean isSessionMember(HttpSession session) {
		return (session.getAttribute("member")!=null)?true:false;
	}
	//세션의 MemberVO 받아오기
	private MemberVO getSessionMember(HttpSession session, String member) {
		return (MemberVO)session.getAttribute(member);
	}
}
