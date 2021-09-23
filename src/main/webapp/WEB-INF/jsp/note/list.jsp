<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 알림장목록</title>
<!-- bootstrap CDN link -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/static/css/style.css" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  
  <!--  datepicker -->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />
		<section class="d-flex justify-content-center align-items-center">
			<div>
				<!-- submenu-bar -->
				<div class="submenu-bar d-flex justify-content-center w-100">
					<div class="d-flex justify-content-between align-items-center w-100">
						<!--  title -->
						<div class="mx-3 mt-2"><h5><b>알림장 목록</b></h5></div> 
						<div class="d-flex">
							<!-- 자녀선택 -->
							<div class="mx-3">
								<select id="kidsNameInput" class="form-control btn-yellow">
									<option value="">--자녀 선택--</option>
									<c:forEach var="kid" items="${kidsInfoList }" varStatus="state">
				    				<option value="${kid.kidsName }">${kid.kidsName }</option>
				    				</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<!-- /submenu-bar -->
				<!-- page section -->
				<div class="page-section px-2 d-flex justify-content-center">
					<!-- 알림장 요약 section -->
					<c:forEach var="note" items="${noteList }">
					<div>
						<div class="note-contraction d-flex">
							<!-- 일자, 날씨 -->
							<div class="w-25 text-center mt-3 ml-2">
								<div class="d-flex align-items-center justify-content-center"><h2><b><fmt:formatDate value="${note.createdAt }" pattern="M" /></b></h2>월<h2><b><fmt:formatDate value="${note.createdAt }" pattern="d" /></b></h2>일</div>
								<div><h5><small><fmt:formatDate value="${note.createdAt }" pattern="E" />요일</small></h5></div>
								<div><h3>
									<c:choose>
									<c:when test="${note.weather eq '맑음' }">
									<i class="bi bi-brightness-high"></i>
									</c:when>
									<c:when test="${note.weather eq '흐림' }">
									<img src="/static/images/cloud.png" width="35" height="35">
									</c:when>
									<c:when test="${note.weather eq '비' }">
									<img src="/static/images/rain.png" width="35" height="35">
									</c:when>
									<c:when test="${note.weather eq '눈' }">
									<img src="/static/images/snow.png" width="35" height="35">
									</c:when>
									</c:choose>
								</h3></div>
							</div>
							<!-- /일자, 날씨 -->
							<!-- 알림장 내용 -->
							<div class="w-50 d-flex align-items-center mx-3">
								<a href="/note/detail_view" class="title-text">
								<div>
									<h5><b>원에서 가정으로</b></h5>
									<c:set var="content" value="${note.content }" />
									<div>
										<c:choose>									
											<c:when test="${content.length() > 30}">
											${fn:substring(content,0,30) }...
											</c:when>
											<c:otherwise>
											${note.content }
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								</a>
							</div>
							<!-- /알림장 내용 -->
							<!-- 사진 -->
							<div class="d-flex justify-content-center align-items-center w-25 mr-3">
								<div>
									<!-- 이미지 출력 -->
									<div class="picture-square-sm title-text d-flex justify-content-center align-items-center" id="picture">
									<img src="${note.imagePath }" id="imagePath" class="imagethumbnail">
									</div>
								</div>
							</div>
							<!-- /사진 -->
					</div>
					</c:forEach>
					<!-- /알림장 요약 -->
				</div>
				<!-- /page section -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>