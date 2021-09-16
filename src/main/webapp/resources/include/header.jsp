<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
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
	<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  </head>
  
<script type="text/javascript">
	$(document).ready(function(){

		$("#memberUpdateBtn").on("click", function(){
			location.href="${pageContext.request.contextPath}/member/myPage";
		})
		
	})
</script>

<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
	      <a class="btn btn-sm" href="${pageContext.request.contextPath}/notice/list">NOTICE</a>
	      <a class="btn btn-sm" href="#">Q&A</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" 
        href="${pageContext.request.contextPath}/">
        #SHOP</a>
      </div>
      <!-- 상품 검색창 -->
      <div class="col-3 d-flex justify-content-end align-items-center">
		<form role="form" method="get">
            <div class="search">
            	<select name="searchType" style="display:none">
					<option value="y"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					<option value="y"<c:out value="${scri.searchType eq 'y' ? 'selected' : ''}"/>>-----</option>
				</select>
			    <input type="text" name="keyword" style="border:0 solid black" id="keywordInput" value="${scri.keyword}"/>
				<button id="searchBtn" type="button" style="border:0 solid black; background-color:white" >
	         		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
				</button>
				<script>
					$(function(){
					  $('#searchBtn').click(function() {
						  self.location = "${path}/product/list?page=1&perPageNum=12&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					  });
					});   
				</script>
			</div>
		</form>
		<!-- 관리자 -->
		<div>
	      <c:if test="${member.adminCk == 1 }">
	          <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/member/admin">관리자 페이지</a>
	          <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
	      </c:if>
	    </div>
       	<div>
			<!-- 로그인 하지 않은 상태 -->
           <c:if test = "${member == null }">
               <div><a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/member/login">Sign in</a></div>
           </c:if> 
		<!-- 로그인한 상태 -->
           <c:if test="${ member != null && member.adminCk != 1}">
       		<div class="login_success_area">
				  <button class="btn btn-sm btn-outline-secondary" id="memberUpdateBtn" type="button">${member.memberName}님♥</button>
				  <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/member/logout.do">logout</a>
                </div>
           </c:if>
			</div>
      </div>
    </div>
</header>     


  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="${path}/product/list_new">NEW</a>
      <a class="p-2 link-secondary" href="${path}/product/list?product_category=OUTER">OUTER</a>
      <a class="p-2 link-secondary" href="${path}/product/list?product_category=TOP">TOP</a>
      <a class="p-2 link-secondary" href="${path}/product/list?product_category=BOTTOM">BOTTOM</a>
      <a class="p-2 link-secondary" href="${path}/product/list?product_category=OPS">OPS</a>
      <a class="p-2 link-secondary" href="${path}/product/list?product_category=SALE">SALE</a>
      <a class="p-2 link-secondary" href="${path}/product/list?product_category=ETC">ETC</a>
    </nav>
	</div>
  </div>