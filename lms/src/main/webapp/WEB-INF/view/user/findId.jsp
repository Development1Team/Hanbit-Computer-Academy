<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:title" content="한빛컴퓨터아카데미LMS">
<meta property="og:url" content="lms/login">
<meta property="og:image" content="${pageContext.request.contextPath}/img/previewer.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>findId</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="bg-dark">
	<div class="layoutAuthentication">
		<div class="layoutAuthentication_content">
			<div class="container">
				<c:if test="${error eq null}">
					${error}
				</c:if>
			<br><br><br>
			<h1 class="text-center text-white">Hanbit Computer Academy LMS</h1>
			<br>
			<div class="row justify-content-center">
				<div class="col-lg-4">
					<ul class="nav nav-tabs nav-justified">
						<li class="nav-item">
							<c:choose>
								<c:when test="${role eq 'student'}">
									<a class="nav-link active" data-toggle="tab" href="${pageContext.request.contextPath}/user/findId?role=student">🧑 Student </a>
								</c:when>
								<c:otherwise>
								    <a class="nav-link" data-toggle="tab" href="${pageContext.request.contextPath}/user/findId?role=student">🧑 Student </a>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="nav-item">
							<c:choose>
								<c:when test="${role == 'teacher'}">
								    <a class="nav-link active" data-toggle="tab" href="${pageContext.request.contextPath}/user/findId?role=teacher">🧓 Teacher </a>
								</c:when>
								<c:otherwise>
									<a class="nav-link" data-toggle="tab" href="${pageContext.request.contextPath}/user/findId?role=teacher">🧓 Teacher </a>
								</c:otherwise>
							</c:choose>
						</li>
						<li class="nav-item">
							<c:choose>
								<c:when test="${role eq 'manager'}">
								    <a class="nav-link active" data-toggle="tab" href="${pageContext.request.contextPath}/user/findId?role=manager">👨‍🦱 Manager </a>
								</c:when>
								<c:otherwise>
									<a class="nav-link" data-toggle="tab" href="${pageContext.request.contextPath}/user/findId?role=manager">👨‍🦱 Manager </a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
					<br>
					<!--  학생을 선택했을때 테스트 계정입력 -->
					 <c:if test="${role =='student'}">
					 <form  id="findId" method="post" action="${pageContext.request.contextPath}/user/findId">
					 	<input type="hidden" name="role" value="student">
					    <div class="form-group">
							<input type="text" id="studentName" class="form-control"  placeholder="학생 이름 입력" name="name">
					    	<span class="helpName text-white"></span>
					    </div>
					    <div class="form-group">
							<input type="text" id="studentPhone" class="form-control" placeholder="하이픈 포함(-) 연락처 입력" name="phone" >
							<span class="helpPhone text-white"></span>
					    </div>
					     <button id="btnstudent" class="btn btn-primary btn-block" type="button" >Find ID</button>
				    </form>
				     </c:if>
				     
				     <!-- 강사를 선택했을때 테스트 계정입력 -->
					 <c:if test="${role =='teacher'}">
					 <form  id="findId" method="post" action="${pageContext.request.contextPath}/user/findId">
					 	<input type="hidden" name="role" value="teacher">
					    <div class="form-group">
							<input type="text" id="teacherName" class="form-control"  placeholder="강사 이름 입력" name="name">
					    	<span class="helpName text-white"></span>
					    </div>
					    <div class="form-group">
							<input type="text" id="teacherPhone" class="form-control" placeholder="하이픈 포함(-) 연락처 입력" name="phone" >
							<span class="helpPhone text-white"></span>
					    </div>
					     <button id="btnteacher" class="btn btn-primary btn-block" type="button" >Find ID</button>
				    </form>
				     </c:if>
				     
				       <!-- 운영자를 선택했을때 테스트 계정입력 -->
					 <c:if test="${role =='manager'}">
					 <form  id="findId" method="post" action="${pageContext.request.contextPath}/user/findId">
					 	<input type="hidden" name="role" value="manager">
					    <div class="form-group">
							<input type="text" id="managerName" class="form-control"  placeholder="운영자 이름 입력" name="name">
					    	<span class="helpName text-white"></span>
					    </div>
					    <div class="form-group">
							<input type="text" id="managerPhone" class="form-control" placeholder="하이픈 포함(-) 연락처 입력" name="phone" >
							<span class="helpPhone text-white"></span>
					    </div>
					     <button id="btnteacher" class="btn btn-primary btn-block" type="button" >Find ID</button>
				    </form>
				     </c:if>
				     	<c:if test="${check == 1}">
						<span class="text-white">일치하는 정보가 없습니다.</span>
						</c:if>
						<c:if test="${check == 0}">
							<span class="text-white">찾으시는 ID는 [${Id}]입니다.</span>
						</c:if>
					<hr class="bg-white">
						<a class="btn btn-light btn-block" role="button" href="${pageContext.request.contextPath}/login">Login Page</a>
						<a class="btn btn-light btn-block" role="button" href="${pageContext.request.contextPath}/user/findPw">find PW</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="waveSvg">
                 <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="z-index:1;position:relative" width="3000" height="100" viewBox="300 0 500 50">
                <g transform="translate(100, 50) scale(1, 1) translate(-100, -50)">
                                <defs>
					<linearGradient id="linear" x1="200%" y1="0%" x2="100%" y2="0%">
						<stop offset="0%" stop-color="#a1d0ff"/><stop offset="100%" stop-color="#398afa"/>
					</linearGradient>
				</defs>
                                <path d="" fill="url(#linear)" opacity="0.4" >
                <animate attributeName="d" dur="20s" repeatCount="indefinite" keyTimes="0;0.333;0.667;1" calcmod="spline" keySplines="0.2 0 0.2 1;0.2 0 0.2 1;0.2 0 0.2 1" begin="0s" values="M0 0L 0 20Q 213.5 60 427 30T 1700 55L 1700 0 Z;M0 0L 0 45Q 213.5 60 427 40T 1700 30L 1700 0 Z;M0 0L 0 65Q 213.5 35 427 65T 1700 30L 1700 0 Z;M0 0L 0 20Q 213.5 60 427 30T 1700 55L 1700 0 Z"></animate>
            </path>
            <path d="" fill="url(#linear)" opacity="0.4" >
                <animate attributeName="d" dur="20s" repeatCount="indefinite" keyTimes="0;0.333;0.667;1" calcmod="spline" keySplines="0.2 0 0.2 1;0.2 0 0.2 1;0.2 0 0.2 1" begin="-10s" values="M0 0L 0 35Q 213.5 80 427 50T 1700 60L 1700 0 Z;M0 0L 0 50Q 213.5 20 427 20T 1700 40L 1700 0 Z;M0 0L 0 45Q 213.5 25 427 50T 1700 65L 1700 0 Z;M0 0L 0 35Q 213.5 80 427 50T 1700 60L 1700 0 Z"></animate>
            </path>
                </g>
            </svg>
	</div>
<script>
	//학생
	$('#btnstudent').click(function(){
	if($('#studentName').val() == '') {
		$('.helpName').text('이름을 입력하세요');
	} else {
		$('.helpName').text('');
	}
	if($('#studentPhone').val() == '') {
		$('.helpPhone').text('연락처를 입력하세요');
		} else {
			$('.helpPhone').text('');
		}
		if($('#studentName').val() != '' && $('#studentPhone').val() != '') {
			$("#findId").submit();
		}
	});
	//강사id찾기
	$('#btnteacher').click(function(){
	if($('#teacherName').val() == '') {
		$('.helpName').text('이름을 입력하세요');
	} else {
		$('.helpName').text('');
	}
	if($('#teacherPhone').val() == '') {
		$('.helpPhone').text('연락처를 입력하세요');
		} else {
			$('.helpPhone').text('');
		}
		if($('#teacherName').val() != '' && $('#teacherPhone').val() != '') {
			$("#findId").submit();
		}
	});
	//운영자id찾기	
	$('#btnmanager').click(function(){
	if($('#managerName').val() == '') {
		$('.helpName').text('이름을 입력하세요');
	} else {
		$('.helpName').text('');
	}
	if($('#managerPhone').val() == '') {
		$('.helpPhone').text('연락처를 입력하세요');
		} else {
			$('.helpPhone').text('');
		}
		if($('#managerName').val() != '' && $('#managerPhone').val() != '') {
			$("#findId").submit();
		}
	});
</script>
</body>
</html>
