<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
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
	<div class="container hj" style="width:60%">
		<form class="row g-3" method="post" action="${path }/product/write">
			<div class="col-md-12">
				<label class="form-label" for="product_name">상품 이름</label>
				<input class="form-control" type="text" id="product_name" name="product_name" />
				신상품 <input type="checkbox" name="product_new"value="product_new">
			</div>
		
			<div class="col-md-4">
				<label class="form-label" for="product_price">가격</label>
				<input class="form-control" type="number"id="product_price" name="product_price" />
			</div>
			<div class="col-md-4">
				<label class="form-label" for="product_stock">재고수량</label>
				<input class="form-control" type="number" id="product_stock" name="product_stock" />
			</div>
			<div class="col-md-4">
				<label class="form-label" for="product_category">카테고리</label>
				<select class="form-select" name="product_category">
					<option value="OUTER">OUTER</option>
					<option value="TOP">TOP</option>
					<option value="BOTTOM">BOTTOM</option>
					<option value="OPS">OPS</option>
					<option value="ETC">ETC</option>
					<option value="SALE">SALE</option>
				</select>
			</div>
			
			<div class="col-md-6">
				<label class="form-label" for="product_size">사이즈</label>
				<input class="form-control" type="text" id="product_size" name="product_size" />
			</div>
			<div class="col-md-6">
				<label class="form-label" for="product_color">색상</label>
				<input class="form-control" type="text" id="product_color" name="product_color" />
			</div>
			
			<div class="col-md-12">
			<label class="form-label" for="product_main_img">메인 사진</label>
			<input class="form-control" type="text" id="product_main_img" name="product_main_img" />
			</div>
			
			<div class="col-md-12">
			<label class="form-label" for="product_detail_img">상세 사진</label>
			<input class="form-control" type="text" id="product_detail_img" name="product_detail_img" />
			</div>
		
			<div class="col-md-12">
			<label class="form-label" for="product_url">제품 페이지</label>
			<input class="form-control" type="text" id="product_url" name="product_url" />
			</div>
			
			<div class="col-md-12">
			<label class="form-label" for="product_detail">상세 설명</label>
			<textarea class="form-control" id="product_detail" name="product_detail"></textarea>
			</div>
			
			<div class="col-md-12" style="text-align:center;">
				<button type="submit" class="btn btn-secondary" id="submit">상품 등록</button>
				<button class="btn btn-secondary" type="button" id="cancle">돌아가기</button>
			</div>
		</form>
	</div>
</body>
<jsp:include page="${path}/resources/include/footer.jsp" />
</html>