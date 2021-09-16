<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			// 취소
			$("#cencle").on("click", function(){
				location.href = "${path}/member/login";
			})
			
			$("#submit").on("click", function(){

				if($("#memberPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memberPw").focus();
					return false;
				}
				if($("#memberPw").val()!=$("#memberPw2").val()){
					alert("비밀번호를 확인해주세요.");
					$("#memberPw").focus();
					return false;
				}
			});
		})
		
</script>
<body>
	<div class="container">
	<header class="mx-auto" style="width:500px; margin-top:10px;">
		<div>
        <a class="blog-header-logo text-dark" 
        href="${path}/" >
        #SHOP</a>
      	</div>
    </header>
    
		<section id="container" class="mx-auto" style="width:500px; margin-top:10px;">
			<form action="${path}/member/change_pw" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="memberId">아이디</label>
					<input class="form-control" type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="memberPw">비밀번호</label>
					<input class="form-control" type="password" id="memberPw" name="memberPw" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="memberPw2">비밀번호 확인</label>
					<input class="form-control" type="password" id="memberPw2" name="memberPw2" />
				</div>


				<div class="form-group has-feedback" style="margin-top:20px;">
					<button class="btn btn-dark" type="submit" id="submit">비밀번호 변경</button>
					<button class="btn btn-outline-dark" type="button" id="cencle">취소</button>
				</div>
			</form>
		</section>
	</div>	


</body>
</html>