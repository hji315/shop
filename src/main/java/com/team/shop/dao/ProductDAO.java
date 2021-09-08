package com.team.shop.dao;

import java.util.List;

import com.team.shop.model.Criteria;
import com.team.shop.model.ProductVO;

public interface ProductDAO {
	
	//상품 등록
	public void write(ProductVO productVO) throws Exception;
	
	//상품 목록 조회
	public List<ProductVO> list(Criteria cri) throws Exception;
	
	//상품 총 갯수
	public int listCount() throws Exception;
	
	//상품 상세 조회
	public ProductVO read(int product_id) throws Exception;
	
	//상품 수정
	public void update(ProductVO productVO) throws Exception;
	
	//상품 삭제
	public void delete(int product_id) throws Exception;
}
