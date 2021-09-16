<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
	<link href="${path}/resources/img/favicon.png" rel="icon">
	<title>SHOP</title>
	<style>
.admin_navi_wrap{
    width: 20%;
    height: 300px;
    float:left;
    height: 100%;
}

</style>
</head>
<body>
<header class="mx-auto" style="width:500px; margin-top:10px;">
		<div>
        <a class="blog-header-logo text-dark" 
        href="${path}/" >
        #SHOP My Page</a>
      	</div>
    </header>
<!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul class="list-group list-group-flush">
                        <li >
                            <a class="list-group-item" href="${path}/mypage/modify">정보수정</a>
                        </li>
                        <li>
                            <a class="list-group-item" href="${path}/mypage/basket">장바구니</a>
                        </li>
                        <li>
                            <a class="list-group-item"  href="${path}/mypage/delivery">배송조회</a>                            
                        </li>
                        <li>
                            <a class="list-group-item"  href="${path}/mypage/postscript">후기작성</a>                            
                        </li>
                        <li>
                            <a class="list-group-item"  href="${path}/mypage/point">포인트조회</a>                            
                        </li>    
                        <li>
                            <a class="list-group-item"  href="${path}/mypage/view">구매내역 조회</a>                            
                        </li>         
                          <li>
                            <a class="list-group-item"  href="${path}/member/memberDeleteView">회원 탈퇴</a>                            
                        </li>                                                                                    
                    </ul>
                </div>
<h2>payment - delivery</h2>
<c:forEach var="view" items="${view}">
<hr />
<form action="${path}/payment/delivery" method="post">
<p>결제 고유 번호 : <input name="pno" type="text" value="${view.pno}" readonly /> </p>
<p>결제한 회원 아이디  : <input type="text" value="${view.memberId}" readonly /> </p>
<p>결제한 상품 아이디 : <input  type="text" value="${view.product_id}" readonly /> </p>
<p>결제 날짜 : <input type="text" value="${view.payDate}" readonly /> </p>
<p>배송비 : <input type="text" value="${view.shippingFee}" readonly /> </p>
<p>합산 결제 금액 : <input type="text" value="${view.payMoney}" readonly /> </p>
<p>적립 포인트 : <input type="text" value="${view.payPoint}" readonly /> </p>
<input type="submit" class="btn btn-sm btn-outline-secondary" value="배송 조회" />
</form>
</c:forEach>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
