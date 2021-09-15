<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="${path}/resources/img/favicon.png" rel="icon">
	<title>SHOP</title>
</head>
<body>
<%@ include file="/resources/include/header.jsp"%>
<h2>payment - choiceAddr</h2>
<div>
	<div>
	
	</div>
	<section id="container" class="mx-auto" style="width:500px; margin-top:10px;">
			<form action="${path}/payment/checkCard" method="post">
				<div class="form-group has-feedback default_delivery">
					<label class="control-label" for="memberName">받는분</label>
					<input class="form-control" type="text" id="memberName" name="memberName" value="${member.memberName}" readonly="readonly" />
				</div>
					<div class="clearfix"></div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberAddr1">주소</label>
					<input class="form-control" type="text" id="address_input_1" name="memberAddr1" value="${member.memberAddr1}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="address_input_2" name="memberAddr2" value="${member.memberAddr2}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="address_input_3" name="memberAddr3" value="${member.memberAddr3}" readonly="readonly" />
				</div>
					
					
				<div class="form-group has-feedback">
					<button class="btn btn-dark" type="submit" id="submit">기본 배송지</button>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="memberName">받는분</label>
					<input class="form-control" type="text" id="memberName" name="memberName" value="${member.memberName}" />
				</div>
					<div class="clearfix"></div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberAddr1">주소</label>
					<input class="form-control" type="text" id="address_input_1" name="memberAddr1" readonly="readonly" />
				</div>
				<div id="address_button" onclick="execution_daum_address()">
						<button class="btn btn-outline-dark" type="button">주소찾기</button>
					</div>
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="address_input_2" name="memberAddr2" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="address_input_3" name="memberAddr3" />
				</div>
					
					
				<div class="form-group has-feedback">
					<button class="btn btn-dark" type="submit" id="submit">배송지 입력 완료</button>
					<button class="btn btn-outline-dark" type="button" id="cencle">취소</button>
				</div>
			</form>
		</section>
		
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		
		/* 다음 주소 연동 */
		function execution_daum_address(){
			
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 	// 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                $("#address_input_1").val(data.zonecode);
	                //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
	                $("#address_input_2").val(addr);
	                //$("[name=memberAddr2]").val(addr);
	                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
          			$("#address_input_3").attr("readonly",false);
            		$("#address_input_3").focus();// 대체가능
		        }
		    }).open(); 
		}
		
</script>
<%@ include file="/resources/include/footer.jsp"%>
</body>
</html>
