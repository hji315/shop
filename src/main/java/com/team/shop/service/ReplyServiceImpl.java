package com.team.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.shop.dao.ReplyDAO;
import com.team.shop.model.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply_qna(int product_id) throws Exception {
		return dao.readReply_qna(product_id);
	}
	
	@Override
	public List<ReplyVO> readReply_review(int product_id) throws Exception {
		return dao.readReply_review(product_id);
	}
}
