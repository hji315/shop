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
<h2>payment - verification</h2>
<div>
<form action="${path}/payment/checkAddr">
<p>본인인증</p>
<label for="name">이름 : </label>
<input type="text" name="name" id="name" required/>
<div></div>
<input type="submit" class="btn btn-sm btn-outline-secondary" value="약관 동의" />
</form>
<button class="btn btn-sm btn-outline-secondary" onClick="history.go(-1)">취소</button>
</div>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
