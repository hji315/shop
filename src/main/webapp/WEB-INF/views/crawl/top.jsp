<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
	integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
	integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
	crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">


<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->

<style>
.hjTable {
	width: 60%;
	margin: auto;
}

.hjPadding {
	padding: 5px 10px;
}

.hjText {
	width: 240px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<jsp:include page="${path}/resources/include/header.jsp" />
</head>
<body>
	<div class="container">
		<table class="hjTable">
			<tr>
				<c:forEach var="imgs" items="${img}" varStatus="status">
					<c:if test="${status.index%4==0}">
						</tr>
						<tr>
					</c:if>
					<td>
						<div class="hjPadding">
							<a href="#">
							<img style="width: 240px; height: 240px;"src="${img[status.index]}">
							</a>
							<div class="hjText"><br/>${title[status.index]}</div>
							${price[status.index]}원
							<div class="d-flex justify-content-between">
								<a href="#"><img src="${path }/resources/img/cart.png"></a>
								<a href="#"><img src="${path }/resources/img/pick.png"></a>
							</div>
							<div style="display:none;">${url[status.index]}</div>
							<hr/>
						</div>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
<jsp:include page="${path}/resources/include/footer.jsp" />
</html>