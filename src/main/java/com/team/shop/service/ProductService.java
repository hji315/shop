package com.team.shop.service;

import java.util.List;

import com.team.shop.model.ProductVO;

public interface ProductService {
	
	public void write(ProductVO productVO) throws Exception;
	
	public List<ProductVO> list() throws Exception;
	
}
