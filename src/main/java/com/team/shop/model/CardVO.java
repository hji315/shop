package com.team.shop.model;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CardVO {
	private int cardNumber; // 카드 번호
    private String memberId; // 소유한 회원 아이디
    private int ano; // 연결된 계좌번호
    private String CVCNumber;// cvc번호
    private String cardCompany;//카드사
    private String cardValidityPeriod;//유효기간
	
    @Override
	public String toString() {
		return "CardVO [cardNumber=" + cardNumber + ", memberId=" + memberId + ", ano=" + ano + ", CVCNumber="
				+ CVCNumber + ", cardCompany=" + cardCompany + ", cardValidityPeriod=" + cardValidityPeriod + "]";
	}
    
    
}
