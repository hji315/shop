package com.team.shop.model;

import java.util.Date;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PaymentVO {
	private int pno; // 결제 고유 번호
	private String memberId; // 결제한 회원 아이디
	private int product_id; // 결제한 상품 아이디
	private Date payDate; // 결제 날짜
	private int shippingFee; // 배송비
	private int payMoney; // 결제 금액
	private int payPoint; // 적립 포인트
	
	@Override
	public int hashCode() {
		return Objects.hash(memberId, payDate, payMoney, payPoint, pno, product_id, shippingFee);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PaymentVO other = (PaymentVO) obj;
		return Objects.equals(memberId, other.memberId) && Objects.equals(payDate, other.payDate)
				&& payMoney == other.payMoney && payPoint == other.payPoint && pno == other.pno
				&& product_id == other.product_id && shippingFee == other.shippingFee;
	}
	@Override
	public String toString() {
		return "PaymentVO [pno=" + pno + ", memberId=" + memberId + ", product_id=" + product_id + ", payDate="
				+ payDate + ", shippingFee=" + shippingFee + ", payMoney=" + payMoney + ", payPoint=" + payPoint + "]";
	}
	
}
