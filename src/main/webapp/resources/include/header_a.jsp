<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<!-- 로그인 이후의 헤더 (Sign in -> MyPage) -->
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
     
    </style>
   
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/blog.css" rel="stylesheet">
  </head>
  
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
	      <a class="btn btn-sm" href="#">NOTICE</a>
	      <a class="btn btn-sm" href="#">Q&A</a>
	      <a class="btn btn-sm" href="#">REVIEW</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" 
        href="${pageContext.request.contextPath}">
        #SHOP</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" 
        href="#"
         aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/mainlogin">MyPage</a>
      </div>
    </div>
</header>     


  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="#">NEW</a>
      <a class="p-2 link-secondary" href="#">OUTER</a>
      <a class="p-2 link-secondary" href="#">TOP</a>
      <a class="p-2 link-secondary" href="#">BOTTOM</a>
      <a class="p-2 link-secondary" href="#">OPS</a>
      <a class="p-2 link-secondary" href="#">SKIRT</a>
      <a class="p-2 link-secondary" href="#">SHOES</a>
      <a class="p-2 link-secondary" href="#">ACC</a>
      <a class="p-2 link-secondary" href="#">BAG</a>
      <a class="p-2 link-secondary" href="#">SALE</a>
      <a class="p-2 link-secondary" href="#">HOMEWEAR</a>
      <a class="p-2 link-secondary" href="#">ETC</a>
    </nav>
	</div>
  </div>