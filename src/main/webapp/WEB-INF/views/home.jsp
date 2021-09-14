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

<jsp:include page="/resources/include/header.jsp" />
<link rel="stylesheet" href="${path}/resources/css/hjCss.css">
</head>
<body>
<div class="container">
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="${path }/resources/img/mainpage (1).jpg" class="d-block w-100" alt="옷 그림">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="${path }/resources/img/mainpage (2).jpg" class="d-block w-100" alt="옷 그림2">
    </div>
    <div class="carousel-item">
      <img src="${path }/resources/img/mainpage (3).jpg" class="d-block w-100" alt="옷 그림3">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
<div class="container">
		<table class="hjTable">
			<tr>
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
				<c:forEach var="newItem" items="${newItem}">
					<c:if test="${i%j == 0 }">
						<tr>
					</c:if>
						<td>
							<div class="hjPadding">
								<a href="${path}/product/readView?product_id=${newItem.product_id}">
									<img class="hjImg" src="<c:out value="${newItem.product_main_img}" />">
								</a>
								<br/>
								<div class="hjText">${newItem.product_name}<br/></div>
								<a href="#"><img src="${path }/resources/img/cart.png"></a>
								<div class="right">${newItem.product_price}원<br/><br/></div>
							</div>
						</td>
					<c:if test="${i%j == j-1 }">
						</tr>
					</c:if>
					<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
<jsp:include page="/resources/include/footer.jsp" />
</html>
