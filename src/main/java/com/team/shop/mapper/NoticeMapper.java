package com.team.shop.mapper;

import java.util.List;

import com.team.shop.model.NoticeVO;

public interface NoticeMapper {

	// 작성자 등록
	public void enroll(NoticeVO nvo);
	
	// 게시판 목록
	public List<NoticeVO> getList();
	
	// 게시판 조회
	public NoticeVO getPage(int bno);
	
	// 게시판 수정
	public int modify(NoticeVO nvo);
	
	// 게시판 삭제
	public int delete(int bno);
}
