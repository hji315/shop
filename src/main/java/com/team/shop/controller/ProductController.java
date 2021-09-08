package com.team.shop.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.shop.model.Criteria;
import com.team.shop.model.PageMaker;
import com.team.shop.model.ProductVO;
import com.team.shop.model.SearchCriteria;
import com.team.shop.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	ProductService service;
	
	//상품 등록 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
	}
	
	//상품 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(ProductVO productVO) throws Exception{
		service.write(productVO);
		return "/product/list";
	}

	//상품 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		model.addAttribute("list",service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/product/list";
	}
	
	//상품 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(ProductVO productVO, Model model) throws Exception{
		model.addAttribute("read", service.read(productVO.getProduct_id()));
		return "/product/readView";
	}
	
	//상품 수정 화면
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(ProductVO productVO, Model model) throws Exception{
		model.addAttribute("update", service.read(productVO.getProduct_id()));
		return "/product/updateView";
	}
	
	//상품 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ProductVO productVO) throws Exception{
		service.update(productVO);
		return "redirect:/product/list";
	}

	//상품 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProductVO productVO) throws Exception{
		service.delete(productVO.getProduct_id());
		return "redirect:/product/list";
	}
}
