package com.team.shop.model;

import java.util.Date;

public class NoticeVO {

	// 관리자 권한 체크
	private int adminCk;
	
	// 게시판 번호
	private int bno;
	
	// 게시판 제목
	private String title;	

	// 게시판 내용
	private String content;	
	
	// 게시판 작성자
	private String writer;	
	
	// 등록 날짜
	private Date regDate;	

	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getAdminCk() {
		return adminCk;
	}

	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "NoticeVO [adminCk=" + adminCk + ", bno=" + bno + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", regDate=" + regDate + "]";
	}

}