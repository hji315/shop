<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<jsp:include page="${path}/resources/include/header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/hjCss.css">

</head>
<body>
<script>
	var str = ${read.product_size};
	var arr = str.split(",");
	console.log("1234");
	console.log(arr[0]);
	document.writeln(arr[0]);
	
</script>
	<div class="container">
		<table class="hjTable">
		
			<tr><td><br/></td></tr>
			<tr>
				<td rowspan="7"><img style="width :340px" src="${read.product_main_img}"></td>
			</tr>
			<tr>
				<td style="width :340px"><c:out value="${read.product_name}" /></td>
			</tr>
			<tr>
				<td class="right"><c:out value="${read.product_price}" />원 &nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>
					<select class="form-select" aria-label="Default select example">
						<c:forEach items="${fn:split(read.product_size, ',') }" var="product_size">
							  <option value="product_size">${product_size}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select class="form-select" aria-label="Default select example">
						<c:forEach items="${fn:split(read.product_color, ',') }" var="product_color">
							  <option value="product_color">${product_color}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
				<tr>
					<td style="text-align: center"><button class="btn btn-lg btn-outline-secondary" type="button" id="cart">장바구니</button></td>
				</tr>
				<tr>
					<td style="text-align: center"><button class="btn btn-lg btn-outline-secondary" type="button" id="byu">구매하기</button></td>
				</tr>
			<tr>
			<tr><td><br/></td></tr>
			<tr>
				<td colspan="2"><hr/><br/>
				<img style="width :700px" src="${read.product_detail_img}"></td>
			</tr>
		</table>
	</div>
</body>
<jsp:include page="${path}/resources/include/footer.jsp" />
</html>