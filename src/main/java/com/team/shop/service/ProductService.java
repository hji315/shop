package com.team.shop.service;

import java.util.List;

import com.team.shop.model.ProductVO;
import com.team.shop.model.SearchCriteria;

public interface ProductService {
	
	public void write(ProductVO productVO) throws Exception;
	
	public List<ProductVO> list(SearchCriteria scri) throws Exception;
	
	public List<ProductVO> list_new() throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public ProductVO read(int product_id) throws Exception;
	
	public void update(ProductVO productVO) throws Exception;
	
	public void delete(int product_id) throws Exception;
	
	public List<ProductVO> newItem() throws Exception;
	
	public List<ProductVO> bestItem() throws Exception;
	
}
