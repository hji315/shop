package com.team.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginMainController {

	private static final Logger logger = LoggerFactory.getLogger(LoginMainController.class);

	//로그인,회원가입 메인 페이지 이동
	@RequestMapping(value = "/mainlogin", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}

}
