<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 추가 -->
   <meta charset="UTF-8" />
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>   
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
 <script src="https://kit.fontawesome.com/d99a4f7016.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Ramaraja&family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${path}/resources/css/signupform.css">
    <title>회원가입</title>
</head> 
<body>
<script type = "text/javascript">
var idCheck = 0;
var pwdCheck = 0;
var phoneCheck = 0;
var nameCheck = 0;
var pwCheck = 0;
var authCheck = 0;
//정규 표현식
function regMemberid(mId) { //영문자 또는 숫자 6~16자
   var regExp = /^[A-za-z0-9]{5,15}/g;
   return regExp.test(mId);   
}
function regPassword(mPwd) { //8~16자 영문, 숫자 조합
   var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
   return regExp.test(mPwd);
}
function regPhoneNumber(mTel) { //전화번호
   var regExp = /^01(?:0|1|[6-9])-(?:\d{3})-\d{5}$/;
   return regExp.test(mTel);
}
function regPhoneNumber1(mTel) {
   var regExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
   return regExp.test(mTel);
}
function regMemberName(mName) { //이름
   var regExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
   return regExp.test(mName);
}
//정규표현식 끝

function checkName() {
   var inputed = $('#mName').val();
   $.ajax({
      success: function() {
         if(regMemberName(inputed) == false || inputed.length > 18) {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#mName").css("background-color", "#FFCECE");
            $("#nEmo").css("color", "#ff2020");
            nameCheck = 0;
         } else if(regMemberName(inputed) == true) {
            $("#mName").css("background-color", "#B0F6AC");
            $("#nEmo").css("color", "#1853ff");
            nameCheck = 1;
         }
      }
   })
}
function checkId() {
   var inputed = $('#mId').val();
   $.ajax({
      data : {
         mId : inputed
      },
      url : "checkid",
      success : function(data) {
         /*  if( data == '1'  || regMemberid(inputed) == false || inputed.length >14) {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#mId").css("background-color", "#FFCECE");
            $("#idEmo").css("color", "#ff2020");
            idCheck = 0;
         } else if( data == '0' && regMemberid(inputed)) {
            $("#mId").css("background-color", "#B0F6AC");
            $("#idEmo").css("color", "#1853ff");
            idCheck = 1;  
         } */
         if(data == '1') {
            $("#fail").css("display", "block");
            $("#failid").css("display","none");
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#mId").css("background-color", "#FFCECE");
            $("#idEmo").css("color", "#ff2020");
            idCheck = 0;
         } else if (regMemberid(inputed) == false || inputed.length > 14) {
            $("#failid").css("display","block");
            $("#fail").css("display","none");
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#mId").css("background-color", "#FFCECE");
            $("#idEmo").css("color", "#ff2020");
            idCheck = 0;
         } else if( data == '0' && regMemberid(inputed)) {
            $("#mId").css("background-color", "#B0F6AC");
            $("#idEmo").css("color", "#1853ff");
            $("#failid").css("display","none");
            $("#fail").css("display","none");
            idCheck = 1;  
         }
      }
   });
}
function addhyphen() {
   $(document).on("keyup", "#mTel", function () {
      //$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
      $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
   })
}

function checkPwd() {
   var inputed = $('#mPwd').val();
   
   $.ajax({
      success: function() {
         if(regPassword(inputed) == false || inputed.length > 16) {
            $(".signupbtn").prop("disabled", true);
            $(".signupbtn").css("background-color", "#aaaaaa");
            $("#failpwd").css("display", "block");
            $("#mPwd").css("background-color", "#FFCECE");
            $("#pwEmo1").css("color", "#ff2020");
            pwdCheck = 0;
         } else if(regPassword(inputed) == true) {
            $("#mPwd").css("background-color", "#B0F6AC");
            $("#failpwd").css("display", "none");
            $("#pwEmo1").css("color", "#1853ff");
            pwdCheck = 1;
         }
      }
   })
}
function checkPwd2() {
   var inputed = $('#pwCheck').val();
   var inputed1 = $('#mPwd').val();
   
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
   var inputed = $('#mTel').val();
   
   $.ajax({
      success: function() {
         if(regPhoneNumber(inputed) ==  false) {
            $("#mTel").css("background-color", "#FFCECE");
            $("#telEmo").css("color", "#ff2020");
            inputed = $('#mTel').val();
            phoneCheck = 0;
         }
         else if(regPhoneNumber(inputed)== true) {
            $("#mTel").css("background-color", "#B0F6AC");
            $("#telEmo").css("color", "#1853ff");
            phoneCheck = 1;
            
         }
      }
   })
}


function activateSignupbtn() {
   
   if( idCheck == 1 && pwdCheck == 1  && nameCheck == 1  && pwCheck == 1 && authCheck ==1) {
      $(".signupbtn").prop("disabled", false);   
      $(".signupbtn").css("background-color", "#B0F6AC");
   }
   else  {
      $(".signupbtn").css("background-color", "#aaaaaa");
      $(".signupbtn").prop("disabled", true);
   }
}

function authnum() {
   var inputed = $("#mTel").val();
   $.ajax({
      data: {
         mTel : inputed
      },
      url : "sendMessage",
      success: function() {
         $(".authbtn").prop("disabled",true);
         $(".authbtn").css("display", "none");
         $(".successMessage").css("display", "block");
      }      
   });
}
function checkMessage() {
   var inputed = $("#authNum").val();
   $.ajax({
      data : {
         authNum : inputed
      },
      url : "checkMessage",
      success : function(data) {
         if(data == '1') {
            $(".authsuccessMessage").css("display", "block");
            $(".successbtn").css("display", "block");
            authCheck = 1;
            activateSignupbtn();
         }
      }
   })
}
   
</script>

<!-- header삽입 -->
<%@ include file="../layout/header.jsp"%>
   <div class="wrapper">
      <div class="contents">
         <div class="main_contents">
         
        <h2>회원가입</h2>
        

            <form action = "signup" method = "post">

            <div class="form-group" style="margin:3% 25%;">
               <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="mName" placeholder="이름" oninput="checkName(),activateSignupbtn()" name = "mName">
                  <label for="floatingInput">이름</label>
                  <i id = "nEmo" class="fa fa-id-card-o"></i>
               </div>
               <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="mId"   placeholder="ID" oninput="checkId(), activateSignupbtn()" name = "mId">
                  <label for="floatingInput">ID</label>
                  <i id="idEmo" class="fa-solid fa-id-card"></i>
                        <font color = "red" id = "failid" style = "display:none">5~15자의 영문자와 숫자를 조합해서 입력해주세요.</font>
                        <font color = "red" id = "fail" style = "display:none">이미 존재하는 ID입니다.</font>
               </div>
               <div class="form-floating">
                  <input type="password" class="form-control" id="mPwd" placeholder="Password" oninput ="checkPwd(), checkPwd2()" name = "mPwd">
                  <label for="floatingPassword">Password</label>
                  <i id= "pwEmo1"class="fa-solid fa-fingerprint"></i>
                  <font color = "red" id = "failpwd" style = "display:none">8~16자의 영문자와 숫자를 조합해서 입력해주세요.</font>
               </div>
               <div class="form-floating">
                  <input type="password" class="form-control" id="pwCheck" placeholder="Password 확인" oninput ="checkPwd2(), activateSignupbtn()" name = "pwcheck">
                  <label for="floatingPassword">Password 확인</label>
                  <i id = "pwEmo2" class="fa-solid fa-check-double"></i>
               </div>
               <div class="form-floating mb-3">
                  <input type="text" class="form-control" id="mTel"   placeholder="전화번호" oninput="addhyphen(),checkTel(), activateSignupbtn()" name = "mTel">
                  <label for="floatingInput">전화번호</label>
                  <i id = "telEmo" class="fa-solid fa-phone"></i>
               </div>
               <div>
               <input type = "button" onclick="authnum()" class = "authbtn" value = "인증번호받기">
                     <div style = "display:none;" class = "successMessage"><b >인증 번호가 발송 되었습니다 !</b></div>
                     <input type="text" name="authNum" id="authNum" > <input type = "button" onclick = "checkMessage()" value = "인증번호 확인">
                     <div style = "display:none;" class = "authsuccessMessage"><b >인증 성공 !</b></div>
               </div>
               
               <div>
                  <p>생년월일</p>
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
               <div style="display: grid; padding-top: 5%;">
               <button type="submit" class="btn btn-secondary" style="padding: 2% 0 2%;" id="signupbtn">회원가입</button>
               </div>
            </div>
         </form>

 
 
   <!--      <div id = "MemberJoin_Box"> 
        <div class="join_wrap">
            <form action = "signup" method = "post">

            <ul id = "inpo_input">
                    <li>이름</li>
                        <span class = "input_Box">
                            <input type="text" name = "mName" id = "mName" oninput= "checkName(),activateSignupbtn()" >
                            <i id = "nEmo" class="fa fa-id-card-o"></i>
                        </span>
                    <li>아이디</li>
                        <span class = "input_Box">
                            <input type="text" name = "mId" id = "mId" oninput = "checkId(), activateSignupbtn() ">
                            <i id="idEmo" class="fa-solid fa-id-card"></i>
                            <font color = "red" id = "failid" style = "display:none">5~15자 영문, 숫자를 조합해서 입력해주세요.</font>
                            <font color = "red" id = "fail" style = "display:none">이미 존재하는 아이디입니다.</font>
                        </span>
                    <li>패스워드</li>
                        <span class = "input_Box">
                            <input type="password" name = "mPwd" id = "mPwd" oninput = "checkPwd(), checkPwd2() ">
                            <i id= "pwEmo1"class="fa-solid fa-fingerprint"></i>
                            <font color = "red" id = "failpwd" style = "display:none">8~16자 영문, 숫자 조합해서 입력해주세요.</font>
                        </span>
                    <li>패스워드 확인</li>
                        <span class = "input_Box">
                            <input type="password" name = "pwcheck" id = "pwCheck" oninput = "checkPwd2(), activateSignupbtn() ">
                            <i id = "pwEmo2" class="fa-solid fa-check-double"></i>
                        </span>
                         <li>전화번호</li>
                        <span class = "input_Box">
                            <input type="text" name = "mTel" id = "mTel" oninput = "addhyphen(),checkTel(), activateSignupbtn()">
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
    
    </div>  -->
    
          </div> <!-- main_contents -->
      </div> <!-- contents -->
   </div> <!-- wrapper -->
       <!-- footer삽입 -->
   <%@ include file="../layout/footer.jsp"%>
</body>
</html>