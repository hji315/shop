<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SHOP (payment-checkCard)</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<!-- action 경로 수정할 것! complete => buyCheck -->
<form action="${pageContext.request.contextPath}/payment/complete" method="post">
<select class="form-select form-select-sm" aria-label=".form-select-sm" name="cardCompany">
  <option selected>카드사</option>
  <option value="1">현대</option>
  <option value="2">삼성</option>
  <option value="3">비씨</option>
</select>
<input type="submit" value="저장" />
</form>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
