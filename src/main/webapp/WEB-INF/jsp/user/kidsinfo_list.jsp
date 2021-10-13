<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 자녀목록</title>
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
		<section class="d-flex justify-content-center align-items-center mt-3">
			<div>
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-center w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5>My Kids List</h5></div> 
					<!-- 자녀정보 등록 -->
					<c:if test="${userType eq '학부모' }">
					<div class="mx-3"><a href="/kidsinfo/create_view" class="btn btn-yellow btn-sm" id="kidsinfoCreateBtn"><b>자녀등록</b></a></div>
					</c:if>
				</div>
			</div>
			<!-- page section -->
			<div class="page-section pt-3 pb-5 px-2 d-flex justify-content-center">
				<div class="h-100">
				<c:forEach var="kids" items="${kidsInfoList }" varStatus="state">
				<div class="d-flex kidsInfo h-50 w-100 mt-3 mb-3">
					<!-- 사진 box-->
					<div class="d-flex justify-content-center pt-4 pb-3">
						<div class="picture-box d-flex justify-content-center">
							<div>
								<!-- 이미지 출력 -->
								<div class="picture title-text d-flex justify-content-center align-items-center" id="picture">
								<c:choose>
									<c:when test="${not empty kids.imagePath }">
										<img src="${kids.imagePath }" id="imagePath" class="imagethumbnail" >
									</c:when>
									<c:otherwise>
										<img src="/static/images/person.png" id="imagePath" class="imagethumbnail">
									</c:otherwise>
								</c:choose>
								</div>
								<!-- /이미지 출력 -->
								<!-- 상세보기 이동 버튼 -->	
								<div class="d-flex justify-content-center"><a href="/kidsinfo/detail_view?id=${kids.id }"class="btn btn-green mt-2" id="listBtn" data-kidsinfo-id="${kids.id }">상세보기</a></div>
								<!-- /상세보기 이동 버튼 -->
							</div>
						</div>
					</div>
					<!-- /사진 -->
					<!-- 정보출력 -->
					<div class="info-box ml-2 mr-5 mt-5 w-75 h-25">
						<!-- 자녀소속 -->
						<div class="title-text"><h5>♡ ${kids.kidsClass } ♡</h5></div>
						<!-- 자녀이름 -->
						<div class="mt-3"><h1 class="title-text"><b>${kids.kidsName }</b></h1></div>
						<!-- 자녀생일 -->
						<div class="my-3"><h5><i class="bi bi-calendar2-check mr-2"></i><fmt:formatDate value="${kids.kidsBirth }" pattern="yyyy년 M월 d일" /></h5></div>						
					</div>
					<!-- /정보출력  -->
				</div>
				</c:forEach>
				</div>
			</div>
			<!-- /page section -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>