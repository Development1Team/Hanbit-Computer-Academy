<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Notice</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <!-- summerNote 사용시 추가 -->
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<body class="sb-nav-fixed">

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/index">Hanbit Computer Academy LMS</a>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#">${sessionMemberId}</a></li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                    	<!-- 공통 index -->
                        <div class="sb-sidenav-menu-heading">
                            My Page</div>
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            나의 정보
                        </a>

                   		<!-- 공통 index -->
                   		<c:if test="${sessionMemberLv == 1 }">
                   		<div class="sb-sidenav-menu-heading">Work</div>
                   		</c:if>
                   		<c:if test="${sessionMemberLv != 1 }">
                   		<div class="sb-sidenav-menu-heading">Work</div>
                   		</c:if>
                        <!-- 학생이라면 이걸 보여주기 -->
                        <c:if test="${sessionMemberLv == 1 }">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            수강신청
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">찜 목록</a>
                                <a class="nav-link" href="#">수강신청하기</a>
                                <a class="nav-link" href="#">수강신청내역</a>
                            </nav>
                        </div>
                        </c:if>
   
  						 <!-- 운영진이라면 이걸 보여주기 -->
                        <c:if test="${sessionMemberLv == 3 }">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">회원승인</a>
                                 <a class="nav-link" href="#">학생/강사 관리</a>
                           		<a class="nav-link" href="#">강의계획서 관리</a>
                           		<a class="nav-link" href="#">납부 관리</a>
                                <a class="nav-link" href="#">개설강좌 관리</a>
                                <a class="nav-link" href="#">수강신청 관리</a>   
                            </nav>
                        </div>
                        </c:if>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            강좌
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        강의실
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="#">강의실 홈</a>
	                                     <!-- 강사라면 이걸 보여주기 -->
				                         <c:if test="${sessionMemberLv != 1}">
				                          <a class="nav-link" href="#">수강학생조회</a>
				                         </c:if>
				                         <!--  강사index -->
                                        <a class="nav-link" href="#">강의계획서</a>
                                        <a class="nav-link" href="#">강의자료실</a>
                                        <a class="nav-link" href="#">공지사항</a>
                                        <a class="nav-link" href="#">과제게시판</a>
                                        <a class="nav-link" href="#">Q&A</a>
                                    </nav>
                                </div>
                                
                                <!-- 학생이거나 강사라면 이걸 보여주기 -->
                                <c:if test="${sessionMemberLv != 2}">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        성적조회
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="#">강의 평가 조회</a>
                                         <c:if test="${sessionMemberLv == 1}">
                                        <a class="nav-link" href="#">강의 평가하기</a>
                                        </c:if>
                                        <a class="nav-link" href="#">성적조회</a>
                                    </nav>
                                </div>
                                </c:if>
                                <!--  학생 운영진 index -->
                                
                                 <!-- 강사라면 이걸 보여주기 -->
		                         <c:if test="${sessionMemberLv == 2 }">
		                          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        조회
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="#">강의 평가 조회</a>
                                        <a class="nav-link" href="#">성적조회</a>
                                    </nav>
                                </div>
		                         </c:if>
		                         <!--  강사index -->
                            </nav>
                        </div>
                        <c:if test="${sessionMemberLv == 1 }">
                        <div class="sb-sidenav-menu-heading">
                            certificate</div>
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            수료 증명서
                        </a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/certificate/paymentStudent">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            납입 증명서
                        </a>
                        </c:if>
                        <!-- 학생 index -->

                        
                        <!-- 공통 index -->
                        <div class="sb-sidenav-menu-heading">Communication</div>
                        <a class="nav-link" href="${pageContext.request.contextPath}/Notice/noticeList">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            공지사항
                        </a>
                        <a class="nav-link" href="#">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            문의 게시판
                        </a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/faq/getFaqListByPage">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            FAQ
                        </a>
                        <!-- 공통 index -->
                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <!-- 컨텐츠 삽입 부분-->

			<br>
        	<div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-area me-1"></i>
                Notice
            </div>
            </div>
		<a href="${pageContext.request.contextPath}/Notice/noticeOne?managerNoticeNo=${managerNotice.managerNoticeNo}" class="btn btn-dark" style="float:right">이전으로</a>
		<br><br>
		<form method="post" id="updateNoticeForm" action="${pageContext.request.contextPath}/Notice/updateNotice">
			<table class="table">
				<tr>
					<th class="text-center">번호</th>
					<td>
						<input name="managerNoticeNo" type="number" value="${managerNotice.managerNoticeNo}" readonly="readonly" class="form-control">
					</td>
				</tr>
				<tr>
					<th class="text-center">등록자</th>
					<td>
						<input name="managerId" id="addNoticeForm" type="text" value="${managerNotice.managerId}" readonly="readonly" class="form-control">
					</td>
				</tr>
				<tr>
					<th class="text-center">카테고리</th>
					<td>
					<select name="category" id="category" class="form-control">
							<option value="">공지대상을 선택해주세요.</option>
							<option value="전체" <c:if test="${managerNotice.category=='전체'}">selected="selected"</c:if>>전체</option>
							<option value="강사" <c:if test="${managerNotice.category=='강사'}">selected="selected"</c:if>>강사</option>
							<option value="학생" <c:if test="${managerNotice.category=='학생'}">selected="selected"</c:if>>학생</option>
						</select>
						<span class="text-danger" id="categoryError"></span>
					</td>
				</tr>
				<tr>
					<th class="text-center">제목</th>
					<td>
						<input name="managerNoticeTitle" id="title" type="text" class="form-control" value="${managerNotice.managerNoticeTitle}" placeholder="제목을 입력해주세요">
						<span class="text-danger" id="titleError"></span>
					</td>
				</tr>
				<tr>
					<th class="text-center" style="vertical-align: middle">내용</th>
					<td>
						<textarea name="managerNoticeContent" id="summernote">${managerNotice.managerNoticeContent}</textarea>
						<span class="text-danger" id="contentError"></span>
						<script>
							// height 높이 조절, hide는 사진이나 사용하고싶은 버튼이있다면 지우면 됨.
							$('#summernote').summernote({
							  tabsize: 2,
							  height: 400
							});
							$(".note-editor button[aria-label='Picture']").hide();
							$(".note-editor button[aria-label='Video']").hide();
							$(".note-editor .note-view").hide();
						</script>
					</td>
				</tr>
			</table>
			<button type="button" id="btn" class="btn btn-dark" style="float:right">등록</button>
		</form>
	</div>
     </main>
     <footer class="py-4 bg-light mt-auto">
         <div class="container-fluid px-4">
             <div class="d-flex align-items-center justify-content-between small">
                 <div class="text-muted">Copyright &copy; Hanbit Computer Academy 2022</div>
             </div>
         </div>
     </footer>
 </div>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../assets/demo/chart-area-demo.js"></script>
    <script src="../assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
<script type="text/javascript">
	$('#btn').click(function(){
			// 카테고리(전체, 강사, 학생)
		   if($('#category').val() == ''){
		      $('#categoryError').text('대상을 선택해주세요');
		   } else {
		      $('#categoryError').text('');
		   }
			// 제목
		   if($('#title').val() == '') {
		      $('#titleError').text('제목을 입력해주세요');
		   } else {
		      $('#titleError').text('');
		   }
		   // 내용
		   if($('#summernote').val() == '') {
			      $('#contentError').text('내용을 입력해주세요');
			   } else {
			      $('#contentError').text(''); 
			   }
		   // 전체 내용이 들어와 있다면 전송
		   if($('#category').val() != '' && $('#title').val() != '' && $('#summernote').val() == '') {
		      $('#addNoticeForm').submit();
		   }
		});
</script>

</body>
</html>