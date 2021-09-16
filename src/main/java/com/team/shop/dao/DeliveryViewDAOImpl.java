package com.team.shop.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.DeliveryViewVO;

@Repository
public class DeliveryViewDAOImpl implements DeliveryViewDAO {

	@Inject
	private SqlSession sqlSession;
	// 배송 정보 추가
	@Override
	public void add(DeliveryViewVO deliveryViewVO) throws Exception {
		sqlSession.insert("deliveryViewMapper.add",deliveryViewVO);
	}

	// 수정
	@Override
	public void update(DeliveryViewVO deliveryViewVO) throws Exception {
		sqlSession.update("deliveryViewMapper.update", deliveryViewVO);
	}

	// 배송 정보 삭제
	@Override
	public void delete(int deliveryNumber) throws Exception {
		sqlSession.delete("deliveryViewMapper.delete", deliveryNumber);
	}

	//배송 정보 조회
	@Override
	public DeliveryViewVO view(int pno) throws Exception {
		return sqlSession.selectOne("deliveryViewMapper.view", pno);
	}

}
