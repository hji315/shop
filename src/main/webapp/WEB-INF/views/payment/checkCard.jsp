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
<form action="${path}/payment/buyCheck" method="post">
<table style="width:720px" class="table">
<div style="width:120px">
<select class="form-select form-select-sm" aria-label=".form-select-sm" name="cardCompany">
  <option selected>카드사</option>
  <option value="1">현대</option>
  <option value="2">삼성</option>
  <option value="3">비씨</option>
</select>
</div>
<tr>
<td><label for="cardNumber">카드 번호</label></td>
<td><input type="text" name="cardNumber" id="cardNumber" pattern="[0-9]+" placeholder="숫자만 적어주세요" required/></td>
</tr>
<tr>
<td><label for="cardValidityPeriod">카드 유효기간</label></td>
<td><input type="text" name="cardValidityPeriod" id="cardValidityPeriod" pattern="[0-9]+" placeholder="숫자만 적어주세요"/></td>
</tr>
<tr>
<td><label for="CVCNumber">CVC 번호</label></td>
<td><input type="text" name="CVCNumber" id="CVCNumber" pattern="[0-9]+" placeholder="숫자만 적어주세요"/></td>
</tr>
<tr>
<!-- 카드 비밀번호 임시 1234 -->
<td><label for="password">카드 비밀번호</label></td>
<td><input type="text" name="password" id="password" value="1234" pattern="[0-9]+" placeholder="숫자만 적어주세요" required/></td> 
</tr>
<tr >
<td></td>
<td>
<input type="submit" class="btn btn-sm btn-outline-secondary" value="저장" />
</td>
</tr>
</table>
</form>
</div>

<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
