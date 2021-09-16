package com.team.shop.dao;

import com.team.shop.model.DeliveryViewVO;

public interface DeliveryViewDAO {
		// 배송 정보 추가
		public void add(DeliveryViewVO deliveryViewVO) throws Exception;
		
		// 배송 정보 조회
		public DeliveryViewVO view(int pno) throws Exception;
		
		// 수정
		public void update(DeliveryViewVO deliveryViewVO) throws Exception;
		
		// 카드 정보 삭제
		public void delete(int deliveryNumber) throws Exception;
		
}
