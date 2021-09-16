<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice - write</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">

<style>
.title {
  width:800px;

}

.writer {
  width:800px;
}
</style>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<div data-v-8e4e6430="" fragment="95e7214531" class="term-container">
<form action="${pageContext.request.contextPath}/notice/enroll" method="post">
	<table>
	<tr>
		<td>Title</td>
		<td><input name="title" class="title"></td>
	</tr>
	<tr>
		<td>Content</td>
		<td><textarea rows="3" name="content"></textarea></td>
	</tr>
	<tr>
		<td>Writer</td>
		<td><input name="writer" class="writer"></td>
	</tr>
	<tr>
	<td></td>
	<td></td>
	</tr>
	<tr>
	<td></td>
	<td align="right"><button class="btn">등록</button></td>
	</tr>
	</table>
</form>
</div>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>