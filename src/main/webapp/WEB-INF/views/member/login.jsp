<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/blog.css" rel="stylesheet">
</head>

<script type="text/javascript">
	 $(document).ready(function(){
			// 회원가입 눌렀을 때
			$("#join").on("click", function(){
				location.href = "${path}/member/join";
			});
			
			// 홈으로 눌렀을 때
			$("#cancle").on("click", function(){
				location.href = "${path}/";
			});
			
			//아이디 찾기
			$("#find_id_btn").on("click", function(){
				location.href = "${path}/member/find_id_form.do";
			});
			
			//비밀번호 찾기
			$("#find_pw_btn").on("click", function(){
				location.href = "${path}/member/find_pw";
			});
	 });
</script>

<body>
<div class="container">
	<header class="mx-auto" style="width:500px; margin-top:20px;">
	
		<div>
        <a class="blog-header-logo text-dark" 
        href="${path}/" >
        #SHOP</a>
      	</div>
    </header>
		<section id="container" class="mx-auto" style="width:500px; margin-top:20px;">
			<form id="login_form" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="memberId" name="memberId" />
				</div>
				<div class="form-group has-feedback"  style="margin-top:10px;">
					<label class="control-label" for="userPass">비밀번호</label>
					<input class="form-control" type="password" id="memberPw" name="memberPw" />
				</div>
				<c:if test ="${result == 0 }">
                <div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
           	    </c:if>
				<div class="form-group has-feedback" style="margin-top:20px;">
					<button class="btn btn-outline-dark" type="submit" id="submit">로그인</button>
					<button class="btn btn-dark" type="button" id="join">회원가입</button>
					<button type="button" class="btn btn-outline-dark" id="cancle">홈으로</button>
					<button class="btn btn-dark" type="button" id="find_id_btn">아이디찾기</button>
					<button type="button" class="btn btn-outline-dark" id="find_pw_btn">비밀번호 찾기</button>
				</div>
			</form>
		</section>
</div>
</body>
</html>