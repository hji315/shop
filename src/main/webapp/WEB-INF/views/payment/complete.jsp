<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
	<title>payment complete test</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
결제 완료
<c:forEach var="view" items="${view}">
<hr />
<p>결제 고유 번호 : ${view.pno} </p>
<p>결제한 회원 아이디  : ${view.memberId} </p>
<p>결제한 상품 아이디 : ${view.product_id} </p>
<p>결제 날짜 : ${view.payDate} </p>
<p>배송비 : ${view.shippingFee} </p>
<p>결제 금액 : ${view.payMoney} </p>
<p>적립 포인트 : ${view.payPoint} </p>

</c:forEach>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
