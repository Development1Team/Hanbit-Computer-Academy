<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>lecHomework</title>
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
	                        LectureHomework
	                    </div>
	                    <div class="card-body">
	                    <form method="get" action="${pageContext.request.contextPath}/lecHomework/getLecHomeworkList">
							<div class="form-group btn-group" >
								<select id="lectureName" name="lectureName" class="form-control">
									<option selected="selected" >-----------------------------강좌선택--------------------------</option>
										<c:forEach var="l" items="${lectureNameList}">
											<option value="${l.lectureName}">${l.lectureName}</option>
										</c:forEach>
								</select>	
							<button type="submit" class="btn btn-dark">공지사항 조회</button>					   
							</div>					             	
				        </form>
						<table class="table">
				            <thead>
				                <tr>
						            <th>강의</th>
						            <th>제목	</th>
									<th>내용</th>
									<th>마감일</th>
					           		<th>작성일</th>
					           		<th>과제제출인원</th>
				                </tr>
				            </thead>
							<tbody>
								<c:if test="${fn:length(homeworkMake) == 0}">
								 	<td class="text-center text-danger" colspan="5">등록된 과제가 없습니다.</td>
								</c:if>
								<c:if test="${fn:length(homeworkMake) != 0}">
									<c:forEach var="h" items="${homeworkMake}">
										<tr>
										   <td>${h.lectureName}</td>
											<td><a class="text-decoration-none text-dark" href="${pageContext.request.contextPath}/#">${h.homeworkMakeTitle}</a></td>
											<td>${h.homeworkMakeContent}</td>
											<td>${h.homeworkDeadline}</td>
											<td>${h.createDate}</td>
											<td>${h.cnt}/${h.registrationNumber}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
               	</div>
               	</div>     
               	</div>
			<div id="footer"></div>
		</div>
	</div>
</body>
	<script>
	</script>
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
