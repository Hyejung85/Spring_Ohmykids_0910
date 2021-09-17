<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<div class="mx-3 mt-2"><h5><b>알림장 목록</b></h5></div> 
						<div class="d-flex">
							<!-- 해당 월 모아보기 -->
							<select class="form-control">	
								<option>2021-9</option>
								<option>2021-8</option>
							</select>
							<!-- 저장 버튼 -->
							<div class="mx-3"><a href="#" class="btn btn-yellow btn-sm mt-1" id="kidsSelectBtn"><b>자녀 선택</b></a></div>
						</div>
					</div>
				</div>
				<!-- /submenu-bar -->
				<!-- page section -->
				<div class="page-section px-2 d-flex justify-content-center">
					<!-- 알림장 요약 section -->
					<div>
						<div class="note-contraction d-flex">
							<!-- 일자, 날씨 -->
							<div class="w-25 text-center mt-2" id="">
								<div><h1><b>17</b></h1></div>
								<div><h5><small>금요일</small></h5></div>
								<div><h4><b>맑음</b></h4></div>
							</div>
							<!-- /일자, 날씨 -->
							<!-- 알림장 내용 -->
							<div class="w-50 d-flex align-items-center">
								<div>
									<h5><b>원에서 가정으로</b></h5>
									<div>content....</div>
								</div>
							</div>
							<!-- /알림장 내용 -->
							<!-- 사진 -->
							<div class="d-flex justify-content-center align-items-center w-25 mr-3">
								<div>
									<!-- 이미지 출력 -->
									<div class="picture-square-sm title-text d-flex justify-content-center align-items-center" id="picture">
									<img src="${imagePath }" id="imagePath" class="imagethumbnail">
									</div>
								</div>
							</div>
							<!-- /사진 -->
					</div>
					<!-- /알림장 요약 -->
					<!-- 알림장 요약 section -->
					<div>
						<div class="note-contraction d-flex">
							<!-- 일자, 날씨 -->
							<div class="w-25 text-center mt-2" id="">
								<div><h1><b>17</b></h1></div>
								<div><h5><small>금요일</small></h5></div>
								<div><h4><b>맑음</b></h4></div>
							</div>
							<!-- /일자, 날씨 -->
							<!-- 알림장 내용 -->
							<div class="w-50 d-flex align-items-center">
								<div>
									<h5><b>원에서 가정으로</b></h5>
									<div>content....</div>
								</div>
							</div>
							<!-- /알림장 내용 -->
							<!-- 사진 -->
							<div class="d-flex justify-content-center align-items-center w-25 mr-3">
								<div>
									<!-- 이미지 출력 -->
									<div class="picture-square-sm title-text d-flex justify-content-center align-items-center" id="picture">
									<img src="${imagePath }" id="imagePath" class="imagethumbnail">
									</div>
								</div>
							</div>
							<!-- /사진 -->
					</div>
					<!-- /알림장 요약 -->
				</div>
				<!-- /page section -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>