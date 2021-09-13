<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop</title>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->

<jsp:include page="/resources/include/header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/hjCss.css">

</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		// 수정 
		$("#update").on("click", function(){
			formObj.attr("action", "${path}/product/updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		})
		// 삭제
		$("#delete").on("click", function(){
			var deleteYN = confirm("정말 삭제하시겠습니까?");
			if(deleteYN == true){
				formObj.attr("action", "/product/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		})
	})
</script>
<body>
	<div class="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="product_id" name="product_id" value="${read.product_id}" />
		</form>
		<table class="hjTable">
			<tr><td colspan="2"><br/></td></tr>
			<tr>
				<td rowspan="7"><img style="width :340px" src="${read.product_main_img}"></td>
			</tr>
			<tr>
				<td style="width :340px; text-align: center"><strong><c:out value="${read.product_name}" /></strong></td>
			</tr>
			<tr>
				<td class="right"><strong><c:out value="${read.product_price}" />원</strong></td>
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
				<td>
					<div style="text-align:center;">
						<button class="btn btn-sm btn-outline-secondary" type="button" id="cart">장바구니</button>
						<button class="btn btn-sm btn-outline-secondary" type="button" id="buy" 
						onClick="location.href='${path}/payment/buy?product_id=${read.product_id}'">구매하기</button>
						<button class="btn btn-sm btn-outline-secondary" type="button" id="list">돌아가기</button>
					</div>
				</td>
			</tr>
			<c:if test="${member.adminCk == 1 }">
				<tr>
					<td>
						<div style="text-align:center;">
							<button class="btn btn-sm btn-outline-secondary" type="button" id="update">수정</button>
							<button class="btn btn-sm btn-outline-secondary" type="button" id="delete">삭제</button>
						</div>
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2"><br/>
					<ul class="nav nav-tabs justify-content-center" style="text-align:center;">
						<li class="nav-item"><a href="#detail" class="nav-link active">상세보기</a></li>
						<li class="nav-item"><a href="#review" class="nav-link active">REVIEW</a></li>
						<li class="nav-item"><a href="#qna" class="nav-link active">Q&A</a></li>
					</ul>
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><br/>
				<div id="detail"><img style="width :700px;" src="${read.product_detail_img}"></div></td>
			</tr>
			<tr>
				<td colspan="2">
					<ul class="nav nav-tabs" style="text-align:center;">
						<li class="nav-item"><div id="review" class="nav-link active">REVIEW</div></li>
					</ul>
				</td>
			</tr>
			<tr>	
				<td colspan="2">
					<div id="review">
					    <c:forEach items="${replyList_review}" var="replyList_review">
					      <li style="width:600px;">
					        ${replyList_review.writer}
						    <div class="right"><fmt:formatDate value="${replyList_review.regdate}" pattern="yyyy-MM-dd" /></div>
					      </li>
					      <li style="width:600px;">  
					        <strong>${replyList_review.review}</strong>
					      </li>
					    </c:forEach>   
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<ul class="nav nav-tabs" style="text-align:center;">
						<li class="nav-item"><div id="review" class="nav-link active">Q&A</div></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="qna">
					    <c:forEach items="${replyList_qna}" var="replyList_qna">
					      <li style="width:600px;">
					        ${replyList_qna.writer}
						    <div class="right"><fmt:formatDate value="${replyList_qna.regdate}" pattern="yyyy-MM-dd" /></div>
					      </li>
					      <li style="width:600px;">  
					      	<strong>${replyList_qna.qna}</strong>
					      </li>
					    </c:forEach>
					</div>
				</td>
			</tr>
		</table>
		
	</div>
</body>
<jsp:include page="/resources/include/footer.jsp" />
</html>