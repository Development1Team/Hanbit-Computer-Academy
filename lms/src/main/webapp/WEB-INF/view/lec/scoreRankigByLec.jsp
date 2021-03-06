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
<title>Lecture List</title>
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
	               학생 성적 순위
	            </div>
            </div>
			
			 <select id="lectureName" name="lectureList" class="form-control">
			 	 <option selected="selected" value="${defaultValue}">${defaultValue}</option>
				 <c:forEach var="li" items="${lectureList}" > 
					<option value="${li.lectureName}">${li.lectureName}</option>
				</c:forEach> 
			</select>
			<br>

			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center">순위</th>
						<th class="text-center">학생명</th>
						<th class="text-center">점수</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="tbodyid">
				
						<tr>
							<td  class="text-center text-success"><p id="field1"></p></td>
							<td  class="text-center"><p id="field2"></p></td>
							<td  class="text-center col-md-4" ><p id="field3"></p> </td>
			
				</tbody>
			</table>
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
    
    
	 $.ajax({
			type:"get" // get방식
			,url:'/lms/getScoreRank'											
			,data:{'lectureName':$('#lectureName option:selected').val()}							
			,success:function(arr){
				console.log(arr);
				$(arr).each(function(index, item) {
					
					$('#field1').append(item.rank+'<br>');	
					$('#field2').append(item.studentName+'<br>');	
					$('#field3').append(item.avg +'<br>');	

				 });
			}
});
    
    
    
    $('#lectureName').change(function(){
    	$('#field1').empty();
    	$('#field2').empty();
    	$('#field3').empty();
	
   	 $.ajax({
			type:"get" // get방식
			,url:'/lms/getScoreRank'											
			,data:{'lectureName':$('#lectureName option:selected').val()}							
			,success:function(arr){
				console.log(arr);
				$(arr).each(function(index, item) {
					
					$('#field1').append(item.rank+'<br>');	
					$('#field2').append(item.studentName+'<br>');	
					$('#field3').append(item.avg +'<br>');	

				 });
			}
   });
    	
    });

    </script>
</html>