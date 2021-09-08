<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainlogin.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
	$(document).ready(function(){

		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
		
	})
</script>

<body>

			<!-- 로그인 하지 않은 상태 -->
            <c:if test = "${member == null }">
                <div class="login_button"><a href="/member/login">로그인</a></div>
                <span><a href="/member/join">회원가입</a></span>                
            </c:if> 
			<!-- 로그인한 상태 -->
            <c:if test="${ member != null }">
        		<div class="login_success_area">
                     <span>회원 : ${member.memberName}</span>
                     <span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
                     <span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
					  <button id="memberUpdateBtn" type="button">회원정보수정</button>
					  <a href="/member/logout.do">로그아웃</a>                 
                 </div>
            </c:if>
</body>
</html>