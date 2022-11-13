<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="/resources/images/favicon.ico" rel="shortcut icon"
   type="image/x-icon">
<link rel="stylesheet" href="/resources/css/cockinfo.css">
<link rel="stylesheet" href="/resources/css/menu.css">

<%-- <script src="${pageContext.request.contextpath}/resources/js/jQuery-3.1.1.main.js"></script> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>
</head>
<body>
   <div class="wrapper">

      <div class="header">
         <div class="navbar_logo">
            <a href="#"><img class="logo" src="/resources/images/LOGO.png" /></a>
         </div>
         <div class="navbar_left">
            <ul class="left">
               <li><a class="menu_left" href="/infoboard/list">칵테일 소개</a></li>
               <li><a class="menu_left" href="/mycocktailboard/list">나만의
                     칵테일</a></li>
               <li><a class="menu_left" href="/freeboard/list">자유게시판</a></li>
               <li><a class="menu_left" href="#">스토어</a></li>
            </ul>
         </div>

         <div class="search-box">
            <form action="." method="post">
               <input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" />
               <button class="search-btn" type="submit">찾기</button>
            </form>
         </div>
         <div>
            <ul class="right">
               <li><a href="#">카트</a></li>
               <li><a href="#">마이페이지</a></li>
               <li><a href="/login/list">로그인</a></li>
               <li><a href="/join/list">회원가입</a></li>
            </ul>
         </div>
      </div>

      <div class="main_bar">
         <img class="img_bar" src="/resources/images/Bar_main.jpg" />
      </div>

      <div class="contents">
         <div class="main_contents">
            <c:forEach var="cocklist" items="${list}">
               <div class="card" style="width: 18rem">
                  <img
                     src="${path}/resources/images/${cocklist.infoBoard_title}.png"
                     class="card-img-top" alt="NO IMAGE" width="50px" height="50px">
                  <div class="card-body">
                     <h5 class="card-title">
                        <c:out value="${cocklist.infoBoard_title }"></c:out>
                     </h5>
                     <p class="card-text">
                        <c:out value="${cocklist.infoBoard_content }"></c:out>
                     </p>
                  </div>
               </div>

            </c:forEach>


            <div class="pageInfo_wrap">
               <div class="pageInfo_area">
                  <ul id="pageInfo" class="pageInfo">

                     <!-- 이전페이지 버튼 -->
                     <c:if test="${pageMaker.prev}">
                        <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                     </c:if>

                     <!-- 각 번호 페이지 버튼 -->
                     <c:forEach var="num" begin="${pageMaker.startPage}"
                        end="${pageMaker.endPage}">
                        <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                     </c:forEach>

                     <!-- 다음페이지 버튼 -->
                     <c:if test="${pageMaker.next}">
                        <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                     </c:if>

                  </ul>
               </div>
            </div>


            <form id="menuForm" method="get">
               <input type="hidden" name="pageNum"
                  value="${pageMaker.cri.pageNum }"> <input type="hidden"
                  name="amount" value="${pageMaker.cri.amount }">
            </form>
            <a href="/write.jsp">글쓰기</a>
         </div>
      </div>

      <div class="footer">
         <div class="foo_enterprise">
            <ul>
               <li>사업자번호: 123-45-67890</li>
               <li>대표자명: 홍길동</li>
               <li>주소: 서울특별시 종로구 창경궁로 254 7층</li>
            </ul>
         </div>
         <div class="foo_help">
            <a href="#">고객센터</a>
         </div>

      </div>
   </div>
   <script>
      $(".pageInfo a").on("click", function(e) {
         e.preventDefault();
         moveForm.find("input[name='pageNum']").val($(this).attr("href"));
         moveForm.attr("action", "/infoboard/list");
         moveForm.submit();
      });
   </script>
</body>
</html>