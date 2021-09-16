package com.team.shop.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class DeliveryViewVO {
	private int deliveryNumber;//송장번호
	private int pno; // 배송조회할 상품 결제 내역
    private String memberName; //받는 분
    private String memberAddr1;//배송 주소
    private String memberAddr2;//배송 주소
    private String memberAddr3;//배송 주소    
	private String deliveryMemo;// 배송 요청사항 
    private String deliveryReceive;//상품 수령 방법
	@Override
	public String toString() {
		return "DeliveryVO [deliveryNumber=" + deliveryNumber + ", pno=" + pno + ", memberName=" + memberName
				+ ", memberAddr1=" + memberAddr1 + ", memberAddr2=" + memberAddr2 + ", memberAddr3=" + memberAddr3
				+ ", deliveryMemo=" + deliveryMemo + ", deliveryReceive=" + deliveryReceive + "]";
	}
    
	
    
}
