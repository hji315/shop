<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
	<div class="container">
		<table class="hjTable">
			<tr>
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<c:forEach var="list" items="${list}">
					<c:if test="${i%j == 0 }">
						<tr>
					</c:if>
						<td>
							<div class="hjPadding">
								<a href="/product/readView?product_id=${list.product_id}">
									<img class="hjImg" src="<c:out value="${list.product_main_img}" />">
								</a><br/>
								<div class="hjText">${list.product_name}<br/></div>
								<a href="#"><img src="${path }/resources/img/cart.png"></a>
								<div class="right">${list.product_price}원<br/><br/></div>
							</div>
						</td>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</tr>
		</table>
		<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						</c:if> 
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						</c:if> 
					</ul>
				</nav>
	</div>
	
	<div class="search">
	
	<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	
	<button id="searchBtn" type="button">검색</button>
		<script>
		$(function(){
		  $('#searchBtn').click(function() {
		    self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 'y' + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		  });
		});   
		</script>
	</div>
  
</body>
<jsp:include page="${path}/resources/include/footer.jsp" />
</html>