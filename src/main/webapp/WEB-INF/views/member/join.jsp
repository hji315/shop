<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw">
				</div>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName">
				</div>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					<span id="mail_check_input_box_warn"></span> <!-- 경고글 역할 -->
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1">
					</div>
					<div class="address_button">
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3">
					</div>
				</div>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script>

	var code = "";                //이메일전송 인증번호 저장위한 코드
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		// '가입하기 버튼' 클릭하였을때 form태그에 속성 action(url 경로)이 추가되고, form태그가  서버에 제출이 된다는 의미
		//제출 방식(post)은 form태그에 미리 추가되어져 있음.
		$(".join_button").click(function(){
			$("#join_form").attr("action", "/member/join");
			$("#join_form").submit();
		});
	});
	
	//아이디 중복검사,input 태그(class="id_input")에 변화가 있을 때마다 실행
	$('.id_input').on("propertychange change keyup paste input", function(){
	
		//console.log("keyup 테스트");// (F12)정상적으로 작동하는지 확인하기 위해 console.log코드를 작성
		var memberId = $('.id_input').val(); // .id_input에 입력되는 값
		var data = {memberId : memberId}	 // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");				
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");				
				}
			}// success 종료
		}); // ajax 종료
	});// function 종료
	
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function(){
		
		var email = $(".mail_input").val(); //이메일 입력란에 입력된 값[$(".mail_input").val()]을 사용하기 쉽도록 "email" 변수를 선언
		
		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function(){
		    
		    var email = $(".mail_input").val();        // 입력한 이메일
		    var cehckBox = $(".mail_check_input");        // 인증번호 입력란
		    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
		    
		    $.ajax({ //controller에 요청할 때 화면이 전환되면 안 되기 때문에 ajax를 사용
		        
		        type:"GET",
		        url:"mailCheck?email=" + email, // url을 통해 데이터를 보낼 수 있도록 GET방식으로 하였고, url명을 "mailCheck"로 하였습니다.
		        success:function(data){
		        	cehckBox.attr("disabled",false); //이메일 인증 입력란[$(".mail_check_input")]이 입력이 가능하도록 속성 변경
		        	boxWrap.attr("id", "mail_check_input_box_true"); //태그 id속성 값을 변경해주는 코드(이메일 인증 입력란 색변경)
		        	code = data; //Controller에서 전달받은 인증번호를 위에서 선언한 코드에 저장시키는 코드
		        }
		    
		    });
		});
		
		/* 인증번호 비교,인증번호 입력란에 데이터를 입력한 뒤 마우스로 다른 곳을 클릭 시에 실행 */
		$(".mail_check_input").blur(function(){
		    
			var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과  
		    
		    //inputCode : 사용자 입력 번호 / code : 이메일로 전송된 인증번호
		    if(inputCode == code){                            // 일치할 경우
		        checkResult.html("인증번호가 일치합니다.");
		        checkResult.attr("class", "correct");  //class속성이 correct(초록색)로 변경      
		    } else {                                            // 일치하지 않을 경우
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect"); //class속성이 incorrect(빨간색)로 변경
		    
		    }
		});
	});

</script>

</body>
</html>