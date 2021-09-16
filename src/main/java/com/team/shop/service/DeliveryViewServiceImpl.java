package com.team.shop.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.shop.dao.DeliveryViewDAO;
import com.team.shop.model.DeliveryViewVO;

@Service
public class DeliveryViewServiceImpl implements DeliveryViewService {

	@Inject
	private DeliveryViewDAO dao;
	// 배송 정보 추가
	@Override
	public void add(DeliveryViewVO deliveryViewVO) throws Exception {
		dao.add(deliveryViewVO);
	}
	

	// 배송 정보 조회
	@Override
	public DeliveryViewVO view(int pno) throws Exception {
		return dao.view(pno);
	}

	// 수정
	@Override
	public void update(DeliveryViewVO deliveryViewVO) throws Exception {
		dao.update(deliveryViewVO);
	}

	// 배송 정보 삭제
	@Override
	public void delete(int deliveryNumber) throws Exception {
		dao.delete(deliveryNumber);
	}

}
