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
<div style="width:80%">
<div class="card mb-4 rounded-3 shadow-sm">
	<div class="card-header py-3 text-center">배송조회</div>
	<div class="card-body">
		<strong class="card-title">배송 시작</strong>
		<small class="card-title">고객님의 상품 배송이 시작되었습니다.</small>
	</div>
</div>
<div class="table-responsive">
<table>
<tbody>
	<tr> 
		<td class="songNumber">
			<table class="table">
				<tbody>
					<tr>
						<td >송장번호</td>
						<td >10223707063813</td>
					</tr>
				</tbody>
			</table>
		</td>
		<td class="deliveryInfo">
			<table class="table">
				<tbody>
					<tr>
						<td >받는사람</td>
						<td >${deliveryMVO.memberName}</td>
					</tr>
					<tr>
						<td >받는주소</td>
						<td >${deliveryMVO.memberAddr2} ${deliveryMVO.memberAddr3}</td>
					</tr>
					<tr>
						<td>배송요청사항</td>
						<td>현관문앞 (자율출입 가능)</td>
					</tr>
					<tr>
						<td>상품수령방법</td>
						<td>문앞 전달</td>
					</tr>
				</tbody>
			</table>
		</td>
	</tr>
</tbody>
</table>
</div>

<div class="table-responsive" style="width:720px">
	<table class="table table-striped table-sm">
		<thead>
			<tr>
				<th>시간</th>
				<th>현재위치</th>
				<th>배송상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>2021.09.14 20:56</td>
				<td>옥천HUB</td>
				<td>집하</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
</div>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
