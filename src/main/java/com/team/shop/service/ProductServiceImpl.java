package com.team.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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
	public List<ProductVO> list_new() throws Exception {
		return dao.list_new();
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ProductVO read(int product_id) throws Exception {
		dao.productHit(product_id);
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

	@Override
	public List<ProductVO> newItem() throws Exception {
		return dao.newItem();
	}

	@Override
	public List<ProductVO> bestItem() throws Exception {
		return dao.bestItem();
	}

}
