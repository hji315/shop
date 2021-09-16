package com.team.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.DeliveryInfoVO;

@Repository
public class DeliveryInfoDAOImpl implements DeliveryInfoDAO {

	@Inject
	private SqlSession sqlSession;
	// 배송 정보 추가
	@Override
	public void add(DeliveryInfoVO deliveryInfoVO) throws Exception {
		sqlSession.insert("deliveryInfoMapper.add",deliveryInfoVO);
	}

	// 수정
	@Override
	public void update(DeliveryInfoVO deliveryInfoVO) throws Exception {
		sqlSession.update("deliveryInfoMapper.update", deliveryInfoVO);
	}

	// 배송 정보 삭제
	@Override
	public void delete(int deliveryNumber) throws Exception {
		sqlSession.delete("deliveryInfoMapper.delete", deliveryNumber);
	}

	//배송 정보 조회
	@Override
	public List<DeliveryInfoVO> view(int pno) throws Exception {
		return sqlSession.selectOne("deliveryInfoMapper.view", pno);
	}

}
