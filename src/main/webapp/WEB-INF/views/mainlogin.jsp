<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 로그인 성공 영역 */
	.login_success_area{
	    height: 62%;
	    width: 80%;
	    border: 2px solid #7474ad;
	    border-radius: 15px;
	    margin: 5% auto;
	    padding-top: 5%;
	}
	.login_success_area>span{
	    display : block;
	    text-align: left;
	    margin-left: 10%;
	}
</style>
</head>
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
                 </div>
            </c:if>
</body>
</html>