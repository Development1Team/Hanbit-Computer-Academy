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
<title>getSubjectList</title>
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
	               과목 조회
	               <a  href="${pageContext.request.contextPath}/subject/getAddSubject" class="btn btn-dark btn-sm float-end">과목입력</a>
	            </div>
	            <div class="card-body">
		            <form id="addForm" method="get" action="${pageContext.request.contextPath}/subject/getSubjectList">
		              <div class="float-end btn-group">
			            <input type="text" id="searchValue" name="searchValue" class="form-control" placeholder="과목을 입력해주세요">
			            	<span id="searchHelp"></span>
			            <button type="button" id="addBtn" class="btn btn-dark float-end btn-group">검색 </button>
			            </div>
		            </form>	            
	            <c:forEach var="subject" items="${subjectList}">
	            
	            	<table class="table">
		            	<tr>
	            			<td width="150px;">과목명</td><td><b>${subject.subjectName}</b></td>
	            		</tr>
	            		<tr>
	            			<td width="150px;">설명</td><td>${subject.subjectSubscription}</td>
	            		</tr>
	            		<tr>
	            			<td width="150px;">생성 날짜</td><td>${subject.createDate}</td>
						</tr>
	            	</table>
            	   	<!-- 삭제 -->
						<div>	          	
					        <form action="${pageContext.request.contextPath}/subject/removeSubject" method="post">
					        	<input type="hidden" name="subjectName" value="${subject.subjectName}" readonly="readonly">
					        		<button type="submit" class="btn btn-dark float-end btn-group">삭제</button>
					        </form>
				        </div>
	          	</c:forEach>
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
    <script>

    </script>
</html>