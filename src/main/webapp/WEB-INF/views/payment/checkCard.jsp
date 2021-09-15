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
<h2>payment - checkCard</h2>
<div>
<form action="${path}/payment/buyCheck" method="post">
<select class="form-select form-select-sm" aria-label=".form-select-sm" name="cardCompany">
  <option selected>카드사</option>
  <option value="1">현대</option>
  <option value="2">삼성</option>
  <option value="3">비씨</option>
</select>
<label for="password">카드 비밀번호</label>
<input type="text" name="password" id="password"/>
<input type="submit" class="btn btn-sm btn-outline-secondary" value="저장" />
</form>
</div>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
