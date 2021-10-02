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
<div align="center">
<div class="card" style="width: 33%;">
<strong class="bd-title mt-0">결제하기</strong>
<p class="bd-lead">
회원 아이디가 있다면 로그인하여주세요.
</p>
<a class="btn btn-sm btn-outline-dark" href="${path}/payment/memberLogin">회원</a>
<a class="btn btn-sm btn-outline-secondary" href="${path}/payment/verification">비회원</a>
</div>
</div>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
