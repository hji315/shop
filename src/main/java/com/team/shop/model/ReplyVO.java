package com.team.shop.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReplyVO {
	
	/*
    product_id number not null,
    qna_rno number not null,
    qna varchar2(1000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    prmary key(product_id, qna_rno)
    */
	
	private int product_id;
	private int qna_rno;
	private String qna;
	private String writer;
	private Date regdate;
	private int review_rno;
	private String review;
	
	@Override
	public String toString() {
		return "ReplyVO [product_id=" + product_id + ", qna_rno=" + qna_rno + ", qna=" + qna + ", writer=" + writer
				+ ", regdate=" + regdate + ", review_rno=" + review_rno + ", review=" + review + "]";
	}
	
	
}
