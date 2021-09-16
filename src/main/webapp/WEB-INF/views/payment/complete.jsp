<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="${path}/resources/img/favicon.png" rel="icon">
	<title>SHOP </title>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<h2>payment - complete</h2>
결제 완료!
<c:if test="${not empty member}">
<p>계좌 남은 잔액 : ${member.money}</p>
<p>적립된 포인트 : ${member.point}</p> 
</c:if>
<p>남은 재고 : ${payProd.product_stock}</p>

<form action="${path}/payment/delivery" method="post">
<input type="hidden" name="pno" value="${payVO.pno}"/>
<input type="submit" value="배송 조회" class="btn btn-sm btn-outline-secondary" />
</form>

<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
