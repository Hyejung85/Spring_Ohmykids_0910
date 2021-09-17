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
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-center w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5>My Kids 등록</h5></div> 
					<!-- 저장 버튼 -->
					<div class="mx-3"><button type="submit" class="btn btn-yellow btn-sm" id="kidsinfoSaveBtn"><b>저장</b></button></div>
				</div>
			</div>
			<!-- page section -->
			<div class="page-section py-5 px-2 d-flex justify-content-center">
				<div>
					<!-- 사진 box-->
					<div class="d-flex justify-content-center">
						<div class="picture-box d-flex justify-content-center">
							<div>
								<!-- 이미지 출력 -->
								<div class="picture title-text d-flex justify-content-center align-items-center" id="picture">
								<c:choose>
									<c:when test="${not empty imagePath }">
										<img src="${imagePath }" id="imagePath" class="imagethumbnail">
									</c:when>
									<c:otherwise>
										<img src="/static/images/person.png" id="imagePath" class="imagethumbnail">
									</c:otherwise>
								</c:choose>
								</div>
								<!-- /이미지 출력 -->
								<!-- 사진변경 버튼 -->
								<!-- MIME -->
								<input type="file" accept="image/*" id="fileInput" class="d-none">
								<div class="d-flex justify-content-center"><button type="button" class="btn btn-green mt-2" id="imageUploadBtn">사진변경</button></div>
								<!-- /사진변경 버튼 -->
							</div>
						</div>
					</div>
					<!-- /사진 -->
					<!-- 정보입력 -->
					<div class="info-box mx-3 mt-3">
						<!-- 자녀이름 -->
						<div class="input-group d-flex">
							<i class="bi bi-brush input-group-text box mt-2 btn-green"></i>
							<input type="text" class="form-control box mt-2" placeholder="자녀 이름" id="kidsNameInput">
						</div>
						<!-- 자녀생일 -->
						<div class="input-group d-flex">
							<i class="bi bi-calendar-check input-group-text box mt-2 btn-green"></i>
							<input type="text" class="form-control box mt-2" placeholder="자녀 생일" id="kidsBirthInput">
						</div>
						<!-- 자녀성별 -->
						<div class="input-group d-flex">
							<i class="bi bi-bookmark-heart-fill input-group-text box mt-2 btn-green"></i>
							<select class="form-control box mt-2" id="kidsGenderInput" name="kidsGender">
								<option value="">--자녀 성별--</option>
								<option value="여자">여자</option>
								<option value="남자">남자</option>
							</select>
						</div>
						<!-- 자녀소속 -->
						<div class="input-group d-flex">
							<i class="bi bi-building input-group-text box mt-2 btn-green"></i>
							<select class="form-control box mt-2" id="kidsClassInput" name="kidsClass">
								<option value="">--자녀 소속--</option>
								<option value="기쁨반">기쁨반</option>
								<option value="사랑반">사랑반</option>
								<option value="평화반">평화반</option>
							</select>
						</div>
						<!-- 자녀와의 관계 -->
						<div class="input-group d-flex">
							<i class="bi bi-paperclip input-group-text box mt-2 btn-green"></i>
							<select class="form-control box mt-2" id="relationshipInput" name="relationship">
								<option value="">--자녀와의 관계--</option>
								<option value="엄마">엄마</option>
								<option value="아빠">아빠</option>
								<option value="기타가족">기타가족</option>
							</select> 
						</div>
					</div>
					<!-- /정보입력 -->
				</div>
			</div>
			<!-- /page section -->
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>