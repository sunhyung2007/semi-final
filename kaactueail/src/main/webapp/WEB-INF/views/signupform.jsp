<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://kit.fontawesome.com/d99a4f7016.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Ramaraja&family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/signupform.css">
    <title>회원가입</title>
<title>Insert title here</title>
</head>
<body>
    <div id = "MemberJoin_Box">
        <h2>회원가입</h2>
            <form  action = "member?cmd=signup" method = "post">
                <ul id = "inpo_input">
                    <li>이름 입력</li>
                        <span class = "input_Box">
                            <input type="text" name = "m_name" id = "userName" >
                            <i id="nEmo" class="fa-solid fa-input-text">name</i>
                        </span>
                    <li>아이디 입력</li>
                        <span class = "input_Box">
                            <input type="text" name = "m_id" id = "userID">
                            <i id="idEmo" class="fa-solid fa-id-card"></i>
                        </span>
                    <li>패스워드 입력</li>
                        <span class = "input_Box">
                            <input type="password" name = "m_pwd" id = "Pw">
                            <i id= "pwEmo1"class="fa-solid fa-fingerprint"></i>
                        </span>
                    <li>패스워드 확인</li>
                        <span class = "input_Box">
                            <input type="password" name = "pwcheck" id = "pwCheck">
                            <i id = "pwEmo2" class="fa-solid fa-check-double"></i>
                        </span>
                         <li>전화번호</li>
                        <span class = "input_Box">
                            <input type="text" name = "m_tel" id = "tel">
                            <i id = "pwEmo2" class="fa-solid fa-check-double"></i>
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
                            var month = document.getElementById('month');
                            if(month == 1,3,5,7,8,10,12 ) {
                                for(i=1; i<32; i++) {
                                    document.write("<option>" + [i] + "</option>");
                                }
                            }
                            else if(month == 2) {
                                for(i=1; i<30; i++) {
                                    document.write("<option>" + [i] + "</option>");
                                }
                            }
                            else {
                                for(i=1; i<31; i++){
                                    document.write("<option>" + [i] + "</option>");
                                }
                            }
                        </script>
                    </select>
                    <i id = "birthdayEmo" class="fa-solid fa-calendar"></i>                    
                </div>
                </ul>
                <input type = "submit" value = "회원가입">
            </form>
    </div>
</body>
</html>