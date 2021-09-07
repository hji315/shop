package com.team.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession sql;

	@Override
	public void write(ProductVO productVO) throws Exception {
		sql.insert("productMapper.insert", productVO);
	}

	@Override
	public List<ProductVO> list() throws Exception {
		return sql.selectList("productMapper.list");
	}
}
