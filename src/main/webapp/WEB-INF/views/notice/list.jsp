<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/blog.css" rel="stylesheet">
<title>Notice</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">

</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<div data-v-8e4e6430="" fragment="95e7214531" class="term-container">
<div class="table_wrap">
<table>
	<thead>
		<tr>
			<th class="bno_width">번호</th>
			<th class="title_width">제목</th>
			<th class="writer_width">작성자</th>
			<th class="regDate_width">작성일</th>
		</tr>
	</thead>
	<c:forEach items="${list }" var="list">
		<tr>
			<td><c:out value="${list.bno }"/></td>
			<td>
			<a class="move" href='<c:out value="${list.bno }"/>'>
			<c:out value="${list.title }"/></td>			
			</a>
			<td><c:out value="${list.writer }"/></td>
            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regDate}"/></td>
		</tr>
	</c:forEach>
</table>

<div class="pageInfo_wrap">
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
		
			<!-- 이전 페이지 버튼 -->
			<c:if test="${pageMaker.prev }">
				<li class="pageInfo_btn previous"><a href="${pageMAker.startPage-1 }">Previous</a></li>
			</c:if>
		
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="pageInfo_btn ${pageMaker.ncri.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<!-- 다음 페이지 버튼 -->
			<c:if test="${pageMaker.next }">
				<li class="pageInfo_btn next"><a href="${pageMAker.startPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>
	<a href="${pageContext.request.contextPath}/notice/enroll" class="top_btn">글쓰기</a>
</div>

<form id="moveForm" method="get">
	<input type="hidden" name= "pageNum" value="${pageMaker.ncri.pageNum}">
	<input type="hidden" name= "amount" value="${pageMaker.ncri.amount}">
</form>
</div>

<script>
	$(document).ready(function(){
		
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result){
			return;
		}
		if(result === "enroll success"){
			alert("등록이 완료되었습니다.");
		}		
		if(result === "modify success"){
			alert("수정이 완료되었습니다.");
		}
		if(result === "delete success"){
			alert("삭제가 완료되었습니다.");
		}
	});


    let moveForm = $("#moveForm");
 
    $(".move").on("click", function(e){
        e.preventDefault();
        
        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "${pageContext.request.contextPath}/notice/get");
        moveForm.submit();
    });
    
    $(".pageInfo a").on("click", function(e) {
    	
    	e.preventDefault();
    	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
    	moveForm.attr("action", "${pageContext.request.contextPath}/notice/list");
    	moveForm.submit();
    });
</script>

<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>