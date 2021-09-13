package com.team.shop.dao;

import java.util.List;
import java.util.Map;

import com.team.shop.model.NoticeVO;
import com.team.shop.model.SearchCriteria;

public interface NoticeDAO {

	public void create(NoticeVO nvo) throws Exception;

	public NoticeVO read(int bno) throws Exception;

	public void update(NoticeVO nvo) throws Exception;

	public void delete(NoticeVO nvo) throws Exception;

	public void insertFile(Map<String, Object> map);

	public List<NoticeVO> list(SearchCriteria scri);

	public int listCount(SearchCriteria scri);


}
