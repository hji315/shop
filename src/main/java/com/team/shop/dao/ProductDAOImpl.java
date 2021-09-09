package com.team.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.ProductVO;
import com.team.shop.model.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sql;

	@Override
	public void write(ProductVO productVO) throws Exception {
		sql.insert("productMapper.insert", productVO);
	}

	@Override
	public List<ProductVO> list(SearchCriteria scri) throws Exception {
		return sql.selectList("productMapper.listPage", scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sql.selectOne("productMapper.listCount",scri);
	}

	@Override
	public ProductVO read(int product_id) throws Exception {
		return sql.selectOne("productMapper.read", product_id);
	}

	@Override
	public void update(ProductVO productVO) throws Exception {
		sql.update("productMapper.update", productVO);
	}

	@Override
	public void delete(int product_id) throws Exception {
		sql.delete("productMapper.delete", product_id);		
	}

	
}
