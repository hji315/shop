<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>비밀번호 찾기</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#submit").on("click", function() {
			if ($("#memberId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#memberId").focus();
				return false;
			}
			if ($("#memberName").val() == "") {
				alert("이름을 입력해주세요.");
				$("#memberName").focus();
				return false;
			}
			if ($("#memberMail").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#memberMail").focus();
				return false;
			}
		});
	});
</script>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form action="${path}/member/find_pw" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
					<p>
						<label>ID</label>
						<input class="w3-input" type="text" id="memberId" name="memberId" required>
					</p>
					<p>
						<label>Name</label>
						<input class="w3-input" type="text" id="memberName" name="memberName" required>
					</p>
					<p>
						<label>Email</label>
						<input class="w3-input" type="text" id="memberMail" name="memberMail" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
				<!-- 정보가 일치하지 않을 때! -->
					<script>
						var msg="${msg}";
						var msg_pw="${msg_pw}";
						if(msg == "fail"){
							alert("정보가 일치하지 않습니다. 정보를 다시 확인해주세요.");
						}					
					</script>
			</form>
		</div>
	</div>
</body>
</html>