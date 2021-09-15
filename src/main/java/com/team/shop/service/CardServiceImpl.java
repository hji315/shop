package com.team.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.shop.dao.CardDAO;
import com.team.shop.model.CardVO;

@Service
public class CardServiceImpl implements CardService {

	@Inject
	private CardDAO dao;
	// 결제 내역 추가
	@Override
	public void add(CardVO cardVO) throws Exception {
		dao.add(cardVO);
	}
	
	// 결제 내역 전체 조회
	@Override
	public List<CardVO> view(String memberId) throws Exception {
		return dao.view(memberId);
	}

	// 결제 1개 조회
	@Override
	public CardVO read(int cardNumber) throws Exception {
		return dao.read(cardNumber);
	}

	// 수정
	@Override
	public void update(CardVO cardVO) throws Exception {
		dao.update(cardVO);
	}

	// 결제 내역 삭제
	@Override
	public void delete(int cardNumber) throws Exception {
		dao.delete(cardNumber);
	}

}
