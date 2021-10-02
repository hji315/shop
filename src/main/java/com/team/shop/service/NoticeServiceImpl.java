package com.team.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.shop.mapper.NoticeMapper;
import com.team.shop.model.NCriteria;
import com.team.shop.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	// 게시판 등록
	@Override
	public void enroll(NoticeVO nvo) {
		
		mapper.enroll(nvo);
	}
	
	// 게시판 목록
	@Override
	public List<NoticeVO> getList() {
		
		return mapper.getList();
	}

	// 게시판 목록(페이징 적용)
	@Override
	public List<NoticeVO> getListPaging(NCriteria ncri) {
		
		return mapper.getListPaging(ncri);
	}

	// 게시판 조회
	@Override
	public NoticeVO getPage(int bno) {

		return mapper.getPage(bno);
	}

	// 게시판 수정
	@Override
	public int modify(NoticeVO nvo) {
		
		return mapper.modify(nvo);
	}

	// 게시판 삭제
	@Override
	public int delete(int bno) {

		return mapper.delete(bno);
	}

	// 게시물 총 개수
	@Override
	public int getTotal() {
		
		return mapper.getTotal();
	}

}
