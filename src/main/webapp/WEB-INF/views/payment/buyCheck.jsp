<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="${path}/resources/img/favicon.png" rel="icon">
	<title>SHOP</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<h2>payment - buyCheck</h2>
결제 금액 : ${payProd.product_price+shippingFee} <br />
상품가격 ${payProd.product_price}원 + 배송비 ${shippingFee}원
<form action="${path}/payment/complete" method="post">
<input type="hidden" name="product_id" value="${payProd.product_id}"/>
<input type="hidden" name="memberId" value="${member.memberId}" />
<input type="hidden" name="shippingFee" value="${shippingFee}"/>
<input type="hidden" name="payMoney" value="${payProd.product_price + shippingFee}"/>
<input type="submit" class="btn btn-sm btn-outline-secondary" value="결제 완료하기"/>
<button class="btn btn-sm btn-outline-secondary" onClick="history.go(-1)">취소</button>
</form>

<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
