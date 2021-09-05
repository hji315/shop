<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="${path}/resources/include/header.jsp" />
</head>
<body>
	<table>
		<thead>
		<tbody>
			<tr>
				<td>
					<table>
					<tr>
						<c:forEach var="imgs" items="${img}" varStatus="status">
							<c:forEach var="titles" items="${title}" varStatus="status">
								<c:if test="${status.index%4==0}">
									</tr><tr>
								</c:if>
								<td><img src="${img[status.index]}"><br/>${title[status.index]}</td>
							</c:forEach>
						</c:forEach>
						</tr>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
<jsp:include page="${path}/resources/include/header.jsp" />
</html>