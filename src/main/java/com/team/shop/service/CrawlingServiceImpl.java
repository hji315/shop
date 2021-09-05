package com.team.shop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.shop.dao.CrawlingDAO;

@Service
public class CrawlingServiceImpl implements CrawlingService{
	
	private final CrawlingDAO dao;
	
	@Inject 
	public CrawlingServiceImpl(CrawlingDAO dao) {
		this.dao = dao;
	}

}
