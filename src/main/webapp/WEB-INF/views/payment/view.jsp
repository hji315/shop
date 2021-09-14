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
<h2>payment - view</h2>
<c:forEach var="view" items="${view}">
<hr />
<form action="${path}/payment/cancel" method="post">
<p>결제 고유 번호 : <input name="pno" type="text" value="${view.pno}" readonly /> </p>
<p>결제한 회원 아이디  : <input name="memberId" type="text" value="${view.memberId}" readonly /> </p>
<p>결제한 상품 아이디 : <input name="product_id" type="text" value="${view.product_id}" readonly /> </p>
<p>결제 날짜 : <input type="text" value="${view.payDate}" readonly /> </p>
<p>배송비 : <input type="text" value="${view.shippingFee}" readonly /> </p>
<p>합산 결제 금액 : <input name="payMoney" type="text" value="${view.payMoney}" readonly /> </p>
<p>적립 포인트 : <input name="payPoint" type="text" value="${view.payPoint}" readonly /> </p>
<input type="submit" class="btn btn-sm btn-outline-secondary" value="결제 취소" />
</form>
</c:forEach>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
