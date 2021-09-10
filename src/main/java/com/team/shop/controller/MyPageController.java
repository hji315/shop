package com.team.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
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
}
