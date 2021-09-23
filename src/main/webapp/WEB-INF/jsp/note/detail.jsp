<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 알림장상세</title>
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
					<div class="mx-3 mt-2"><h5><b>알림장 상세</b></h5></div> 
					<!-- 목록 버튼 -->
					<div class="mx-3"><a href="/note/list_view" class="btn btn-yellow btn-sm"><b>목록으로</b></a></div>
				</div>
			</div>
			<!-- /submenu-bar -->
			<!-- page section -->
			<div class="page-section px-2 d-flex justify-content-center border-0">
				<div>
					<c:forEach var="note" items="${noteList }" >
					<!-- 작성자 section -->
					<div class="writerInfo-secton d-flex my-1">
						<div class="w-50 d-flex justify-content-start ml-3 align-items-center" id="userNameInput">
							<h4><b><i class="bi bi-person-square"></i> ${userName }</b></h4>
						</div>
						<div class="w-25 d-flex justify-content-end align-items-center" id="createdAtInput">
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<!-- 현재날짜 -->
							<c:set var="date"><fmt:formatDate value="${today}" pattern="dd" /></c:set> 
							<!-- 현재년도 -->
							<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
							<!-- 현재월 -->
							<c:set var="month"><fmt:formatDate value="${today}" pattern="M" /></c:set> 
						   	<h5><b>${year }-${month }-${date }</b></h5>
						</div>
						<div class="w-25 d-flex justify-content-center mr-3 align-items-center" id="weatherInput">
								<select id="weatherInput" class="form-control ml-2">
									<option value="맑음">맑음</option>
									<option value="비">비</option>
									<option value="흐림">흐림</option>
									<option value="눈">눈</option>
								</select>
						</div>
				    </div>
				    <!-- /작성자 section -->
				    <!-- 학생선택 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4">
				    	<div class="w-50 d-flex ml-3 align-items-center h-75">
				    	<b>학생선택</b>
				    	<button type="button" class="btn btn-green ml-5"><b>전체원아보기</b></button>
				    	</div>
				    	<!-- 반정보 -->
				    	<div class="w-50 d-flex justify-content-center align-items-center title-text h-75">
				    	<select class="form-control mr-2" id="kidsClassInput">
				    		<option value="">--반--</option>
				    		<!-- 수정필요 -->
				    		<c:forEach var="kid" items="${noteWithKidsInfo.kidsInfoList }" varStatus="state">
				    		<option value="${kid.kidsClass }">${kid.kidsClass }</option>
				    		</c:forEach>
				    	</select>
				    	<!-- 학생이름 -->
				    	<select class="form-control mr-3" id="kidsNameInput">
				    		<option value="">--이름--</option>
				    		<!-- 수정필요 -->
				    		<c:forEach var="kid" items="${noteWithKidsInfo.kidsInfoList }" varStatus="state">
				    		<option value="${kid.kidsName }">${kid.kidsName }</option>
				    		</c:forEach>
				    	</select>
				    	</div>
				    	
				    </div>
				    <!-- 학생선택 section -->
				    <!-- 알림장 section -->
				    <div class="note-section my-1">
					<!-- 알림장 내용  -->
					<textarea id="contentInput" class="pt-4 px-4 w-100 border-0 non-resize" rows=8 placeholder="원에서 이렇게 지냈어요."></textarea>
					<!-- /알림장 내용-->
					<!-- 사진 box-->
					<div class="d-flex mx-3">
						<div class="d-flex justify-content-center">
							<div>
								<!-- 이미지 출력 -->
								<div class="picture-square title-text d-flex justify-content-center align-items-center" id="picture">
								<img src="${imagePath }" id="imagePath" class="imagethumbnail">
								</div>
								<!-- /이미지 출력 -->
								<!-- MIME -->
								<input type="file" accept="image/*" id="fileInput" class="d-none">
								<div class="d-flex justify-content-left ml-3"><a href="#" class="mt-2" id="imageUploadBtn"><i class="bi bi-plus-square-fill title-text w-100 h-100"></i></a></div>
								<!-- /사진변경 버튼 -->
							</div>
						</div>
					</div>
					<!-- /사진 -->
					</div>
					<!-- 알림장 section -->
				</div>
			</div>
			<!-- /page section -->
			</c:forEach>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>