package com.team.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.shop.dao.ProductDAO;
import com.team.shop.model.Criteria;
import com.team.shop.model.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO dao;

	@Override
	public void write(ProductVO productVO) throws Exception {
		dao.write(productVO);
	}

	@Override
	public List<ProductVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}
	
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
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
