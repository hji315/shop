package com.team.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.CardVO;

@Repository
public class CardDAOImpl implements CardDAO {

	@Inject
	private SqlSession sqlSession;
	// 결제 내역 추가
	@Override
	public void add(CardVO cardVO) throws Exception {
		sqlSession.insert("cardMapper.add",cardVO);

	}
	
	// 결제 내역 전체 조회
	@Override
	public List<CardVO> view(String memberId) throws Exception {
		return sqlSession.selectList("cardMapper.view", memberId);
	}

	// 결제 1개 조회
	@Override
	public CardVO read(int cardNumber) throws Exception {
		return sqlSession.selectOne("cardMapper.read", cardNumber);
	}

	// 수정
	@Override
	public void update(CardVO cardVO) throws Exception {
		sqlSession.update("cardMapper.update", cardVO);
	}

	// 결제 내역 삭제
	@Override
	public void delete(int cardNumber) throws Exception {
		sqlSession.delete("cardMapper.delete", cardNumber);
	}

}
