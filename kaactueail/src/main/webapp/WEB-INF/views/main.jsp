<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="layout/icon_contents.jsp" %>
<!-- header삽입 -->
<%@ include file="layout/header.jsp"%>
<title>Main</title>
</head>
<body>
   <div class="wrapper">
      <div class="contents">         
         <div class="main_contents">   
         
                                    
            <div class="myCocktail" style="">
               <div class="myCockList" style="float: left;">
                  <h3 style="width: 1380px; float: left; margin: 10px;">나만의 칵테일</h3>
                  <div style="justify-content: space-between; flex-wrap: wrap; display: flex; width: 1380px; float: left; margin: 10px;">
                     <c:forEach var="mycocktailboardlist" items="${myCockList}">
                     <c:set var="i" value="${i+1}"/>                     
                        <div class="card"
                           style="width: 30%; float: left; margin-bottom: 5%; cursor: pointer; border-radius: 10px; background-color:rgba(0, 0, 0, 0.2);"
                           onclick="location.href='/mycocktailboard/detail?mycocktailNum=${mycocktailboardlist.mycocktailNum}';">
                           <h3>${i}위 칵테일</h3>
                           <img class="card-img-top"
                              src="${path}/resources/images/mycocktailImagefolder/${mycocktailboardlist.mycocktailImgName}.jpg"
                              width=150px, height=150px alt="Card image cap"
                              style="border-radius: 10px;">

                           <div class="card-body">
                              <span> <c:out
                                    value="${mycocktailboardlist.mycocktailTitle}" />
                              </span> <span style="float: right;"> <c:out value="좋아요 " /> <i
                                 class="fa fa-heart" aria-hidden="true" id="olike"
                                 style="margin-top: 3px; color: red;"></i> <c:out
                                    value="${mycocktailboardlist.mycocktailLikeNum}" />
                              </span>

                              <p class="card-text">
                                 <c:out value="${mycocktailboardlist.mycocktailRecipe}" />
                              </p>
                           </div>
                        </div>
                     </c:forEach>
                     
                  </div>
               </div>
            </div>            
            
            <div class="cockInfo" style="width: 1380px; height:500px;">
            <h3 style="width:500px;float:left; margin:10px;">칵테일 정보</h3>               
               <div style="justify-content: space-around; flex-wrap: wrap; display: flex;
                width: 1380px; height: flex; float: left; margin: 10px;">
                  
                  <c:forEach var="cocklist" items="${cockInfoList}">
                     <div class="card" style="width: 18rem">
                        <a class="move" href='/infoboard/get?infoboardNum=<c:out value="${cocklist.infoboardNum }"/>'>
                           <img src="${path}/resources/images/cocktailInfoImage/${cocklist.infoboardTitle}.png"
                           class="card-img-top" alt="NO IMAGE" width=350px, height=230px
                           style="cursor: pointer;">

                           <h5 class="card-title">
                              <c:out value="${cocklist.infoboardTitle }"></c:out>
                           </h5>
                           <p class="card-text">
                              <c:out value="${cocklist.infoboardContent }"></c:out>
                           </p>
                        </a>
                        <fmt:formatDate pattern="yyyy/MM/dd"
                           value="${cocklist.infoboardDate }" />
                     </div>
                  </c:forEach>
               </div>
            </div>
                              
         </div>   <!-- main_contents -->
      </div>   <!-- contents -->
   </div>
   
<!-- footer 삽입 -->
<%@ include file="layout/footer.jsp"%>
</body>
</html>