package com.team.shop.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CrawlingDAOImpl implements CrawlingDAO{
	
	private final SqlSession sql;
	
	@Inject 
	public CrawlingDAOImpl(SqlSession sql) {
		this.sql = sql;
	}

}
