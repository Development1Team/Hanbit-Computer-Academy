<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta property="og:title" content="한빛컴퓨터아카데미LMS">
<meta property="og:url" content="lms/login">
<meta property="og:image" content="${pageContext.request.contextPath}/img/previewer.png">
<title>getEnquiryBoardListByPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<div id="nav"></div>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav">
      <div id="navbar"></div>
   </div>
    <div id="layoutSidenav_content">
      <div class="container-fluid px-4">
        <!-- 컨텐츠 삽입 부분-->
      <br>
           <div class="card mb-4">
               <div class="card-header">
                   <i class="fas fa-chart-area me-1"></i>
               		Enquiry Board
               		<!-- 운영자는 입력버튼 안보여야함 -->
	               <c:if test="${sessionMemberLv != 3}">
	                  <a href="${pageContext.request.contextPath}/enquiryBoard/addEnquiryBoard" class="btn btn-dark">입력</a>
	               </c:if>
               </div>
               <div class="card-body">
               <table class="table">
                  <thead>
                     <tr>
                        <th class="text-center" style="width:100px;">번호</th>
                        <th class="text-center">내용</th>
                        <th class="text-center">작성자</th>
                        <th class="text-center" style="width:200px;">작성일</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="e" items="${list}">
                     <tr>
                        <td class="text-center">${e.enquiryBoardNo}</td>
                        <td class="text-left"  style="padding-left:50px;"><a href="${pageContext.request.contextPath}/enquiryBoard/getEnquiryBoardOne?enquiryBoardNo=${e.enquiryBoardNo}" class="text-dark none-unline"><b>${e.content}</b></a></td>               
                        <td class="text-center">${e.memberId}</td>
                        <td class="text-center">${e.createDate}</td>
                     </tr>
                  </c:forEach>
                  </tbody>               
               </table>
               <div class="text-center">
                 <c:if test="${currentPage > 1}">
                     <a class ="btn btn-dark" href="${pageContext.request.contextPath}/enquiryBoard/getEnquiryBoardListByPage?currentPage=${currentPage-1}">이전</a>            
                  </c:if>
                  <c:if test="${currentPage < lastPage}">
                     <a class ="btn btn-dark" href="${pageContext.request.contextPath}/enquiryBoard/getEnquiryBoardListByPage?currentPage=${currentPage+1}">다음</a>         
                  </c:if>
                </div>
            </div>
         </div>
      </div>
      <div id="footer"></div>
   </div>
</div>
</body>
   <script>
       $('#nav').load('${pageContext.request.contextPath}/include/nav.jsp');
       $('#navbar').load('${pageContext.request.contextPath}/include/navBar.jsp');
       $('#footer').load('${pageContext.request.contextPath}/include/footer.jsp');
      </script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</html>