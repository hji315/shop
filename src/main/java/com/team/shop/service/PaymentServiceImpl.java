package com.team.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.team.shop.dao.PaymentDAO;
import com.team.shop.model.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Inject
	private PaymentDAO dao;
	// 결제 내역 추가
	@Override
	public void add(PaymentVO purchaseVO) throws Exception {
		dao.add(purchaseVO);
	}
	
	// 결제 내역 전체 조회
	@Override
	public List<PaymentVO> view(String memberId) throws Exception {
		return dao.view(memberId);
	}
	@Override
	public List<PaymentVO> view() throws Exception{
		return dao.view();
	}
	// 결제 1개 조회
	@Override
	public PaymentVO read(int pno) throws Exception {
		return dao.read(pno);
	}

	// 수정
	@Override
	public void update(PaymentVO purchaseVO) throws Exception {
		dao.update(purchaseVO);
	}

	// 결제 내역 삭제
	@Override
	public void delete(int pno) throws Exception {
		dao.delete(pno);
	}

	

}
