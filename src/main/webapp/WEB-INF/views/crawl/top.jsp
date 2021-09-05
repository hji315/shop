<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class=big>
		<thead>
		<tbody>
			<tr>
				<td>
					<table class="seongbukNews1">
						<c:forEach var="imgs" items="${img}" varStatus="status">
							<c:forEach var="titles" items="${title}" varStatus="status">
								<c:if test="${img[status.index]!=''}">
									<tr><td><img src="${img[status.index]}"></td></tr>
										<c:if test="${title[status.index]!=''}">
											<tr><td>${title[status.index]}</td></tr>
										</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>