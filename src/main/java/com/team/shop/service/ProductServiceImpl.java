package com.team.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.shop.dao.ProductDAO;
import com.team.shop.model.ProductVO;
import com.team.shop.model.SearchCriteria;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO dao;

	@Override
	public void write(ProductVO productVO) throws Exception {
		dao.write(productVO);
	}

	@Override
	public List<ProductVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public ProductVO read(int product_id) throws Exception {
		return dao.read(product_id);
	}

	@Override
	public void update(ProductVO productVO) throws Exception {
		dao.update(productVO);
		
	}

	@Override
	public void delete(int product_id) throws Exception {
		dao.delete(product_id);		
	}

}
