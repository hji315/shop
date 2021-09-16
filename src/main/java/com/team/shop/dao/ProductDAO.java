package com.team.shop.dao;

import java.util.List;
import com.team.shop.model.ProductVO;
import com.team.shop.model.SearchCriteria;

public interface ProductDAO {
	
	//상품 등록
	public void write(ProductVO productVO) throws Exception;
	
	//상품 목록 조회
	public List<ProductVO> list(SearchCriteria scri) throws Exception;
	
	//신상품 목록 조회
	public List<ProductVO> list_new() throws Exception;
	
	//상품 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//상품 상세 조회
	public ProductVO read(int product_id) throws Exception;
	
	//상품 수정
	public void update(ProductVO productVO) throws Exception;
	
	//상품 삭제
	public void delete(int product_id) throws Exception;
	
	//조회수
	public void productHit(int product_id) throws Exception;
	
	//신상품 조회
	public List<ProductVO> newItem() throws Exception;
	
	//인기상품 조회
	public List<ProductVO> bestItem() throws Exception;
}
