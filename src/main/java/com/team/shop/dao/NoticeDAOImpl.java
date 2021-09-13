package com.team.shop.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.shop.model.NoticeVO;
import com.team.shop.model.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	private SqlSession sql;
	
	// 글 작성
	@Override
	public void create(NoticeVO nvo) throws Exception {
		sql.insert("NoticeMapper.create", nvo);
	}
	
	// 글 조회 
	@Override
	public NoticeVO read(int bno) throws Exception{
		return sql.selectOne("NoticeMapper.read", bno);
	}
	
	// 글 수정
	@Override
	public void update(NoticeVO nvo) throws Exception {
		sql.update("NoticeMapper.update", nvo);
	}
	
	// 글 삭제
	@Override
	public void delete(NoticeVO nvo) throws Exception {
		sql.delete("NoticeMapper.delete", nvo);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<NoticeVO> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
