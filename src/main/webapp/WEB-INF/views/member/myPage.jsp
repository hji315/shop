<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style>
.admin_navi_wrap{
    width: 20%;
    height: 300px;
    float:left;
    height: 100%;
}

</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$("#cencle").on("click", function(){
				location.href = "${path}/mainlogin";
			})
			
			$("#submit").on("click", function(){
				if($("#memberId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#memberId").focus();
					return false;
				}
				if($("#memberPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memberPw").focus();
					return false;
				}
				if($("#memberPw").val()!=$("#memberPw2").val()){
					alert("비밀번호를 확인해주세요.");
					$("#memberPw").focus();
					return false;
				}
			});
		})
		
</script>
<body>
	
	<header class="mx-auto" style="width:500px; margin-top:10px;">
		<div>
        <a class="blog-header-logo text-dark" 
        href="${path}/" >
        #SHOP My Page</a>
      	</div>
    </header>
    
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                    <ul class="list-group list-group-flush">
                        <li >
                            <a class="list-group-item" href="/mypage/modify">정보수정</a>
                        </li>
                        <li>
                            <a class="list-group-item" href="/mypage/basket">장바구니</a>
                        </li>
                        <li>
                            <a class="list-group-item"  href="/mypage/delivery">배송조회</a>                            
                        </li>
                        <li>
                            <a class="list-group-item"  href="/mypage/postscript">후기작성</a>                            
                        </li>
                        <li>
                            <a class="list-group-item"  href="${path}/mypage/point">포인트조회</a>                            
                        </li>    
                        <li>
                            <a class="list-group-item"  href="${path}/payment/view">구매내역 조회</a>                            
                        </li>                                                                                           
                    </ul>
                </div>
              </div>

    <div class="container">
		<section id="container" class="mx-auto" style="width:500px; margin-top:10px;">
			<form action="/member/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="memberId">아이디</label>
					<input class="form-control" type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberPw">비밀번호</label>
					<input class="form-control" type="password" id="memberPw" name="memberPw" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="memberPw2">비밀번호 확인</label>
					<input class="form-control" type="password" id="memberPw2" name="memberPw2" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberName">이름</label>
					<input class="form-control" type="text" id="memberName" name="memberName" value="${member.memberName}" readonly="readonly"/>
				</div>
				
				<div class="mail_wrap">
				<div class="form-group has-feedback">
					<label class="control-label" for="memberMail">이메일</label>
					<input class="form-control" type="text" id="memberMail" name="memberMail" />
				</div>
								
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span> <!-- 경고글 역할 -->
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="memberAddr1">주소</label>
					<input class="form-control" type="text" id="address_input_1" name="memberAddr1"  />
				</div>
				<div id="address_button" onclick="execution_daum_address()">
						<button class="btn btn-outline-dark" type="button">주소찾기</button>
					</div>
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="address_input_2" name="memberAddr2" />
				</div>
				<div class="form-group has-feedback">
					<input class="form-control" type="text" id="address_input_3" name="memberAddr3" readonly="readonly"/>
				</div>
					
					
				<div class="form-group has-feedback">
					<button class="btn btn-dark" type="submit" id="submit">회원정보수정</button>
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
</body>
</html>