package com.team.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {

	@Inject
	private SqlSession sqlSession;
	// 결제 내역 추가
	@Override
	public void add(PaymentVO paymentVO) throws Exception {
		sqlSession.insert("paymentMapper.add",paymentVO);

	}
	
	// 결제 내역 전체 조회
	@Override
	public List<PaymentVO> view(String memberId) throws Exception {
		return sqlSession.selectList("paymentMapper.view", memberId);
	}

	@Override
	public List<PaymentVO> view() throws Exception{
		return sqlSession.selectList("paymentMapper.view");
	}
	// 결제 1개 조회
	@Override
	public PaymentVO read(int pno) throws Exception {
		return sqlSession.selectOne("paymentMapper.read", pno);
	}

	// 수정
	@Override
	public void update(PaymentVO paymentVO) throws Exception {
		sqlSession.update("paymentMapper.update", paymentVO);
	}

	
	// 결제 내역 삭제
	@Override
	public void delete(int pno) throws Exception {
		sqlSession.delete("paymentMapper.delete", pno);
	}


}
