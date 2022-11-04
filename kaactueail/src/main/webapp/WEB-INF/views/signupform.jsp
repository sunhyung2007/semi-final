<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 추가 -->
	<meta charset="UTF-8" />
	
 <script src="https://kit.fontawesome.com/d99a4f7016.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Ramaraja&family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/signupform.css">
    <title>회원가입</title>
<title>Insert title here</title>
</head>
<body>
<script type = "text/javascript">
	var idCheck = 0;
	var pwdCheck = 0;
	var phoneCheck = 0;
	var nameCheck = 0;
	var pwCheck = 0;
	//정규 표현식
	function regMemberid(m_id) { //영문자로 시작하는 영문자 또는 숫자 6~16자
		var regExp = /^[A-za-z0-9]{5,15}/g;
		return regExp.test(m_id);	
	}
	function regPassword(m_pwd) { //8~16자 영문, 숫자 조합
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		return regExp.test(m_pwd);
	}
	function regPhoneNumber(m_tel) { //전화번호
		var regExp = /^01(?:0|1|[6-9])-(?:\d{3})-\d{5}$/;
		return regExp.test(m_tel);
	}
	function regPhoneNumber1(m_tel) {
		var regExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		return regExp.test(m_tel);
	}
	function regMemberName(m_name) { //이름
		var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		return regExp.test(m_name);
	}
	//정규표현식 끝
	
	function checkName() {
		var inputed = $('#m_name').val();
		$.ajax({
			success: function() {
				if(regMemberName(inputed) == false || inputed.length > 18) {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#m_name").css("background-color", "#FFCECE");
					$("#nEmo").css("color", "#ff2020");
					nameCheck = 0;
				} else if(regMemberName(inputed) == true) {
					$("#m_name").css("background-color", "#B0F6AC");
					$("#nEmo").css("color", "#1853ff");
					nameCheck = 1;
				}
			}
		})
	}
	function checkId() {
		var inputed = $('#m_id').val();
		$.ajax({
			data : {
				m_id : inputed
			},
			url : "checkid",
			success : function(data) {
				 if( data == '1'  || regMemberid(inputed) == false || inputed.length >14) {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#m_id").css("background-color", "#FFCECE");
					$("#idEmo").css("color", "#ff2020");
					idCheck = 0;
				} else if( data == '0' && regMemberid(inputed)) {
					$("#m_id").css("background-color", "#B0F6AC");
					$("#idEmo").css("color", "#1853ff");
					idCheck = 1;  
				}
			}
		});
	}
	function addhyphen() {
		$(document).on("keyup", "#m_tel", function () {
			//$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		})
	}
	
	function checkPwd() {
		var inputed = $('#m_pwd').val();
		
		$.ajax({
			success: function() {
				if(regPassword(inputed) == false || inputed.length > 16) {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#m_pwd").css("background-color", "#FFCECE");
					$("#pwEmo1").css("color", "#ff2020");
					pwdCheck = 0;
				} else if(regPassword(inputed) == true) {
					$("#m_pwd").css("background-color", "#B0F6AC");
					$("#pwEmo1").css("color", "#1853ff");
					pwdCheck = 1;
				}
			}
		})
	}
	function checkPwd2() {
		var inputed = $('#pwCheck').val();
		var inputed1 = $('#m_pwd').val();
		
		$.ajax({
			success: function() {
				if(inputed != inputed1) {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#pwCheck").css("background-color", "#FFCECE");
					$("#pwEmo2").css("color", "#ff2020");
					pwCheck = 0;
				} else if(inputed == inputed1) {
					$("#pwCheck").css("background-color", "#B0F6AC");
					$("#pwEmo2").css("color", "#1853ff");
					pwCheck = 1;
				}
			}
		})
	}
	
	function checkTel() {
		var inputed = $('#m_tel').val();
		
		$.ajax({
			success: function() {
				if(regPhoneNumber(inputed) ==  false) {
					$("#m_tel").css("background-color", "#FFCECE");
					$("#telEmo").css("color", "#ff2020");
					inputed = $('#m_tel').val();
					phoneCheck = 0;
				}
				else if(regPhoneNumber(inputed)== true) {
					$("#m_tel").css("background-color", "#B0F6AC");
					$("#telEmo").css("color", "#1853ff");
					phoneCheck = 1;
					$(".signupbtn").prop("disabled", false);	
					$(".signupbtn").css("background-color", "#B0F6AC");
				}
			}
		})
	}
	
	
	function activateSignupbtn() {
		
		if( idCheck == 1 && pwdCheck == 1  && nameCheck == 1  && pwCheck == 1) {
			$(".signupbtn").prop("disabled", false);	
			$(".signupbtn").css("background-color", "#B0F6AC");
		}
		else  {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$(".signupbtn").prop("disabled", true);
		}
	}
	
</script>

    <div id = "MemberJoin_Box">
        <h2>회원가입</h2>
            <form  action = "member?cmd=signup"method = "post">
                <ul id = "inpo_input">
                    <li>이름 입력</li>
                        <span class = "input_Box">
                            <input type="text" name = "m_name" id = "m_name" oninput= "checkName(),activateSignupbtn()" >
                            <i id = "nEmo" class="fa fa-id-card-o"></i>
                        </span>
                    <li>아이디 입력</li>
                        <span class = "input_Box">
                            <input type="text" name = "m_id" id = "m_id" oninput = "checkId(), activateSignupbtn() ">
                            <i id="idEmo" class="fa-solid fa-id-card"></i>
                        </span>
                    <li>패스워드 입력</li>
                        <span class = "input_Box">
                            <input type="password" name = "m_pwd" id = "m_pwd" oninput = "checkPwd(), checkPwd2() ">
                            <i id= "pwEmo1"class="fa-solid fa-fingerprint"></i>
                        </span>
                    <li>패스워드 확인</li>
                        <span class = "input_Box">
                            <input type="password" name = "pwcheck" id = "pwCheck" oninput = "checkPwd2(), activateSignupbtn() ">
                            <i id = "pwEmo2" class="fa-solid fa-check-double"></i>
                        </span>
                         <li>전화번호</li>
                        <span class = "input_Box">
                            <input type="text" name = "m_tel" id = "m_tel" oninput = "addhyphen(),checkTel(), activateSignupbtn()">
                            <i id = "telEmo" class="fa-solid fa-phone"></i>
                        </span> 
                    <li class = "index">생년월일</li>
                <div id="birthday">
                    <select name="years" id = "years">
                        <script>
                            for(i=2022; i>1900; i--){
                                document.write("<option>" + [i] + "</option>");
                            }
                        </script>
                    </select>
                    <select name="month" id = "month">
                        <script>
                            for(i=1; i<13; i++) {
                                document.write("<option>" + [i] + "</option>");
                            }
                        </script>
                    </select>
                    <select name="day" id="day">
                        <script>
                       
                                for(i=1; i<32; i++) {
                                    document.write("<option>" + [i] + "</option>");
                                }
                        
                        </script>
                    </select>
                    <i id = "birthdayEmo" class="fa-solid fa-calendar"></i>                    
                </div>
                </ul>
                <input type = "submit" value = "회원가입" class = "signupbtn">
            </form>
    </div>
</body>
</html>