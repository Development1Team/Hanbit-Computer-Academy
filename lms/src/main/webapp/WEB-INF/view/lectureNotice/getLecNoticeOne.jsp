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
<title>LecNotinceOne</title>
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
                LectureNotice
            </div>
			<br><br>
                 <!-- LectureNotice 상세보기  -->
                   <table class="table">
                           <tr>
                              <th>번호</th>
                              <td><span>${lectureNotice.lecNoticeNo}</span></td>
                           </tr>
                              <th>제목</th>
                              <td><span>${lectureNotice.title}</span></td>
                           <tr>
                              <th>내용</th>
                              <td><span>${lectureNotice.content}</span></td>
                           </tr>
                      </table>
					</div>

	                           <c:if test="${sessionMemberLv == 2 }">
	                           <form method="post" action="${pageContext.request.contextPath}/lectureNotice/getDeleteLectureNotice" >
	                           <input type="hidden" name="lecNoticeNo" value="${lectureNotice.lecNoticeNo}" >
	                           <input type="submit" value="삭제" class="btn btn-danger" id="delBtn">
	                           <a href="${pageContext.request.contextPath}/lectureNotice/getUpdateLectureNotice?lecNoticeNo=${lectureNotice.lecNoticeNo}" class="btn btn-info">수정</a>
	                           </form>
	                           </c:if>
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