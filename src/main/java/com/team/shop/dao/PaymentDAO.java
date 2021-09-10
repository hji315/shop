package com.team.shop.dao;

import java.util.List;

import com.team.shop.model.PaymentVO;


public interface PaymentDAO {
		// 결제 내역 추가
		public void add(PaymentVO paymentVO) throws Exception;
		
		// 결제 내역 전체 조회
		public List<PaymentVO> view() throws Exception;
		
		// 결제 1개 조회
		public PaymentVO read(int pno) throws Exception;
		
		// 수정
		public void update(PaymentVO paymentVO) throws Exception;
		
		// 결제 내역 삭제
		public void delete(int pno) throws Exception;
		
}
