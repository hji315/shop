package com.team.shop.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.shop.model.ProductVO;
import com.team.shop.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	ProductService service;
	
	//상품 등록 화면
	@RequestMapping(value = "/product/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
	}
	
	//상품 등록
	@RequestMapping(value = "/product/write", method = RequestMethod.POST)
	public String write(ProductVO productVO) throws Exception{
		service.write(productVO);
		return "/product/list";
	}

	//상품 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		model.addAttribute("list",service.list());
	return "/product/list";
	}
	
	//상품 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(ProductVO productVO, Model model) throws Exception{
		model.addAttribute("read", service.read(productVO.getProduct_id()));
		return "product/readView";
	}
}
