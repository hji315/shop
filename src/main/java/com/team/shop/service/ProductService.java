package com.team.shop.service;

import java.util.List;

import com.team.shop.model.Criteria;
import com.team.shop.model.ProductVO;

public interface ProductService {
	
	public void write(ProductVO productVO) throws Exception;
	
	public List<ProductVO> list(Criteria cri) throws Exception;
	
	public int listCount() throws Exception;
	
	public ProductVO read(int product_id) throws Exception;
	
	public void update(ProductVO productVO) throws Exception;
	
	public void delete(int product_id) throws Exception;
	
}
