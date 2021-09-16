<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice - edit</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">

<style>
.title {
  width:800px;

}
</style>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<div data-v-8e4e6430="" fragment="95e7214531" class="term-container">
	<form id="modifyForm" action="${pageContext.request.contextPath}/notice/modify" method="post">
	<div class="input_wrap">
		<input type="hidden" name="bno" class="readonly" value='<c:out value="${pageInfo.bno}"/>' >
	</div>
	<div class="input_wrap">
		<input name="title" class="title" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<input name="regDate" readonly="readonly" style="border:0 solid black" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regDate}"/>' >
	</div>
	<div class="input_wrap">
		<textarea rows="3" name="content"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록</a>
		<a class="btn" id="modify_btn">수정</a>
		<a class="btn" id="cancel_btn">수정 취소</a>
	</div>
</form>
	<form id="infoForm" action="${pageContext.request.contextPath}/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno }"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${ncri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${ncri.amount}"/>'>
	</form>
</div>	
<script>
	let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");	// 페이지 데이터 수정 form
	
	// 목록으로 이동 버튼
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "${pageContext.request.contextPath}/notice/list");
		form.submit();
	});

	// 수정 버튼
	$("#modify_btn").on("click", function(e){
		mForm.submit();
	});
	
	// 취소 버튼
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "${pageContext.request.contextPath}/notice/get");
		form.submit();
	});
	
</script>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>