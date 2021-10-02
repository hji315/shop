<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>상품 수정</title>
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
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$("#cancle").on("click", function(){
			location.href="${path}/"
		})
		
		$("#submit").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/product/update");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})
		function fn_valiChk(){
			var regForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
</script>
<body>
	<div class="container hj" style="width:60%">
		<form class="row g-3" method="post" action="${path }/product/update" name="updateForm">
			<input type="hidden" id="product_id" name="product_id" value="${update.product_id}" />
			<div class="col-md-12">
				<label class="form-label" for="product_name">상품 이름</label>
				<input class="form-control chk" type="text" id="product_name" name="product_name" value="${update.product_name}" title="이름을 입력하세요" />
				신상품 <input type="checkbox" name="product_new"value="product_new">
			</div>
		
			<div class="col-md-4">
				<label class="form-label" for="product_price">가격</label>
				<input class="form-control chk" type="number"id="product_price" name="product_price" 
					value="${update.product_price}" title="가격을 입력하세요"/>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="product_stock">재고수량</label>
				<input class="form-control chk" type="number" id="product_stock" name="product_stock" value="${update.product_stock}" title="수량을 입력하세요"/>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="product_category">카테고리</label>
				<select class="form-select" name="product_category">
				<c:set var="product_category" value="${update.product_category }" />
					<option <c:if test="${update.product_category eq 'OUTER'}">selected</c:if> value="OUTER">OUTER</option>
					<option <c:if test="${update.product_category eq 'TOP'}">selected</c:if> value="TOP">TOP</option>
					<option <c:if test="${update.product_category eq 'BOTTOM'}">selected</c:if> value="BOTTOM">BOTTOM</option>
					<option <c:if test="${update.product_category eq 'OPS'}">selected</c:if> value="OPS">OPS</option>
					<option <c:if test="${update.product_category eq 'ETC'}">selected</c:if> value="ETC">ETC</option>
					<option <c:if test="${update.product_category eq 'SALE'}">selected</c:if> value="SALE">SALE</option>
				</select>
			</div>
			
			<div class="col-md-6">
				<label class="form-label" for="product_size">사이즈</label>
				<input class="form-control chk" type="text" id="product_size" name="product_size" value="${update.product_size}" title="사이즈를 입력하세요"/>
			</div>
			<div class="col-md-6">
				<label class="form-label" for="product_color">색상</label>
				<input class="form-control chk" type="text" id="product_color" name="product_color" value="${update.product_color}" title="색상을 입력하세요"/>
			</div>
			
			<div class="col-md-12">
			<label class="form-label" for="product_main_img">메인 사진</label>
			<input class="form-control chk" type="text" id="product_main_img" name="product_main_img" value="${update.product_main_img}" title="사진 주소를 입력하세요"/>
			</div>
			
			<div class="col-md-12">
			<label class="form-label" for="product_detail_img">상세 사진</label>
			<input class="form-control chk" type="text" id="product_detail_img" name="product_detail_img" value="${update.product_detail_img}" title="사진 주소를 입력하세요"/>
			</div>
		
			<div class="col-md-12">
			<label class="form-label" for="product_url">제품 페이지</label>
			<input class="form-control chk" type="text" id="product_url" name="product_url" value="${update.product_url}" title="제품 페이지 주소를 입력하세요" />
			</div>
			
			<div class="col-md-12">
			<label class="form-label" for="product_detail">상세 설명</label>
			<textarea class="form-control" id="product_detail" name="product_detail"><c:out value="${update.product_detail}" /></textarea>
			</div>
			
			<div class="col-md-12" style="text-align:center;">
				<button type="submit" class="btn btn-sm btn-outline-secondary" id="submit">상품 수정</button>
				<button class="btn btn-sm btn-outline-secondary" type="button" id="cancle">돌아가기</button>
			</div>
		</form>
	</div>
</body>
<jsp:include page="${path}/resources/include/footer.jsp" />
</html>