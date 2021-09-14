<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
	<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	    <!-- Custom styles for this template -->
   <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
   <!-- Custom styles for this template -->
   <link href="${pageContext.request.contextPath}/resources/css/blog.css" rel="stylesheet">	
		<title>회원탈퇴</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#memberPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memberPw").focus();
					return false;
				}
				$.ajax({
					url : "${path}/member/passChk",
					type : "POST",
					dateType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						
						if(data==true){
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
							return;
						}
					}
				})
				
			});
			
				
			
		})
	</script>
	<body>
	
		<header class="mx-auto" style="width:500px; margin-top:10px;">
		<div>
        <a class="blog-header-logo text-dark" 
        href="${path}/" >
        #SHOP</a>
      	</div>
      	
    </header>
    
	<div class="container">
		<section id="container" class="mx-auto" style="width:500px; margin-top:10px;">
			<form action="${path}/member/memberDelete" method="post" id="delForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="memberId">아이디</label>
					<input class="form-control" type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberPw">패스워드</label>
					<input class="form-control" type="password" id="memberPw" name="memberPw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberName">성명</label>
					<input class="form-control" type="text" id="memberName" name="memberName" value="${member.memberName}" readonly="readonly"/>
				</div>
			</form>
			<div class="form-group has-feedback">
				<button class="btn btn-dark" type="button" id="submit">회원탈퇴</button>
				<button class="btn btn-outline-dark" type="button" id="cencle">취소</button>
			</div>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</section>
		</div>
	</body>
	
</html>