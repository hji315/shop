package com.team.shop.dao;

import java.util.List;

import com.team.shop.model.ProductVO;

public interface ProductDAO {
	
	//상품 등록
	public void write(ProductVO productVO) throws Exception;
	
	//상품 목록 조회
	public List<ProductVO> list() throws Exception;
	
	//상품 상세 조회
	public ProductVO read(int product_id) throws Exception;
}
