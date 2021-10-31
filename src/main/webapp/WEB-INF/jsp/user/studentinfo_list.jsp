<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Ohmykids - 학생목록</title>
	<!-- bootstrap CDN link -->
	  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	  <link rel="stylesheet" href="/static/css/style.css" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	  <!--  datepicker -->
	  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <!-- fullcalendar CDN -->
	  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	  <!-- fullcalendar 언어 CDN -->
	  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	</head>
	<body>
		<div id="wrap">
			<!-- 헤더 -->
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<!-- 네비 -->
			<c:import url="/WEB-INF/jsp/include/menu.jsp" />
			<!-- 섹션 -->
			<section class="d-flex justify-content-center align-items-top mt-3">
				<div class="w-75"> 
				<div class="mt-3 title-text"><small>※ 관리Id를 클릭하면 상세페이지로 이동합니다. </small></div>
				<table class="table text-center  my-3 title-text border-success">
					<thead class="table-dark bg-success">
						<tr>
							<th>관리Id</th>
							<th>사진</th>
							<th>소속</th>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
							<th>부모정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="kids" items="${kidsInfoList }">	
						<tr>
							<th><a href="/kidsinfo/detail_view?id=${kids.id }" class="title-text">${kids.id }</a></th>
							<td><img src="${kids.imagePath }" width="100"></td>
							<td>${kids.kidsClass }</td>
							<td>${kids.kidsName }</td>
							<td>${kids.kidsGender }</td>
							<td><fmt:formatDate value="${kids.kidsBirth }" pattern="YYYY-M-d"/></td>
							<td>${kids.relationship } - ${kids.userName }</td>
							
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</section>
			<!-- 풋터 -->
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
	</body>
</html>