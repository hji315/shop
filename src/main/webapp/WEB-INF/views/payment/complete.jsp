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
<a href="${path}/payment/delivery" class="btn btn-sm btn-outline-secondary">
배송 조회</a>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
