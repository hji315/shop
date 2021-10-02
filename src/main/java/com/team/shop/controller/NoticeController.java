package com.team.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.shop.mapper.PageMakerDTO;
import com.team.shop.model.NCriteria;
import com.team.shop.model.NoticeVO;
import com.team.shop.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService nservice;
	
	// 게시판 목록 페이지 접속
	/*
	@GetMapping("/list")
	// => @RequestMapping(value="list", method=RequestMethod.GET)
	public void noticeListGET(Model model) {
		
		log.info("게시판 목록 페이지 진입");
		
		model.addAttribute("list", nservice.getList());
		
	}
	 */
	
	// 게시판 목록 페이지 접속(페이징 적용)
	@GetMapping("/list")
	public void noticeListGET(Model model, NCriteria ncri) {
		
		log.info("noticeListGET");
		
		model.addAttribute("list", nservice.getListPaging(ncri));
		
		int total = nservice.getTotal();
		
		PageMakerDTO pageMaker = new PageMakerDTO(ncri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 게시판 등록 페이지 접속
	@GetMapping("/enroll")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void noticeEnrollGET() {
	
		log.info("게시판 등록 페이지 진입");
	}
	
	// 게시판 등록
	@PostMapping("/enroll")
	public String noticeEnrollPOST(NoticeVO nvo, RedirectAttributes rttr) {
		
		log.info("NoticeVO : " + nvo);
		
		nservice.enroll(nvo);
		
		log.info("NoticeVO : " + nvo);
		
		rttr.addFlashAttribute("result", "enroll success");
		
		return "redirect:/notice/list";
	}

	// 게시판 조회
	@GetMapping("/get")
	public void noticeGetPageGET(int bno, Model model, NCriteria ncri) {
		
		model.addAttribute("pageInfo", nservice.getPage(bno));
		
		model.addAttribute("ncri", ncri);
		
	}
	
	// 수정 페이지 이동
	@GetMapping("/modify")
	public void noticeModifyGET(int bno, Model model) {
		
		model.addAttribute("pageInfo", nservice.getPage(bno));
		
	}
	
	// 페이지 수정
	@PostMapping("/modify")
	public String noticeModifyPOST(NoticeVO nvo, RedirectAttributes rttr) {
		
		nservice.modify(nvo);
		
		rttr.addFlashAttribute("result", "modify success");
		
		return "redirect:/notice/list";
	}
	
	// 페이지 삭제
	@PostMapping("/delete")
	public String noticeDeletePOST(int bno, RedirectAttributes rttr) {
		
		nservice.delete(bno);
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/notice/list";
	}
}