package com.team.shop.dao;

import java.util.List;

import com.team.shop.model.DeliveryInfoVO;

public interface DeliveryInfoDAO {
		// 배송 위치 추가
		public void add(DeliveryInfoVO deliveryInfoVO) throws Exception;
		
		// 배송 위치 조회
		public List<DeliveryInfoVO> view(int pno) throws Exception;
		
		// 수정
		public void update(DeliveryInfoVO deliveryInfoVO) throws Exception;
		
		// 삭제
		public void delete(int dno) throws Exception;
		
}
