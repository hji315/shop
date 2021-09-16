package com.team.shop.service;

import java.util.List;

import com.team.shop.model.DeliveryViewVO;


public interface DeliveryInfoService {
		// 배송 정보 추가
		public void add(DeliveryViewVO deliveryViewVO) throws Exception;
		
		// 배송 정보 조회
		public DeliveryViewVO view(int pno) throws Exception;
		
		// 수정
		public void update(DeliveryViewVO deliveryViewVO) throws Exception;
		
		// 삭제
		public void delete(int deliveryNumber) throws Exception;
		
}
