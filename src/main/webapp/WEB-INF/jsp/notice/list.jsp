<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 공지목록</title>
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
		<section class="d-flex justify-content-center align-items-top mt-3">
			<div id="typeInput">
				<!-- submenu-bar -->
				<div class="submenu-bar d-flex justify-content-center w-100">
					<div class="d-flex justify-content-between align-items-center w-100">
						<!--  title -->
						<div class="mx-3 mt-2"><h5><b>공지 목록</b></h5></div> 
						<div class="d-flex">
							<!-- 자녀선택 -->
							<div class="mx-3">
								<select id="kidsClassInput" class="form-control btn-yellow">
									<option value="">--[준비중]학급 선택--</option>
						    		<c:forEach var="kid" items="${kidsClassList }" varStatus="state">
						    		<option value="${kid.kidsClass }" data-kids-class=${kid.kidsClass }>${kid.kidsClass }</option>
						    		</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>
				<!-- /submenu-bar -->
				<!-- page section -->
				<div class="page-section d-flex justify-content-center">
					<!-- 공지 요약 section -->
					<c:forEach var="notice" items="${noticeList}">
					<div>
						<div class="note-contraction d-flex">
							<!-- 일자, 날씨 -->
							<div class="w-25 text-center mt-3 ml-2">
								<div class="d-flex align-items-center justify-content-center"><h2><b><fmt:formatDate value="${notice.createdAt }" pattern="M" /></b></h2>월<h2><b><fmt:formatDate value="${notice.createdAt }" pattern="d" /></b></h2>일</div>
								<div><h5><small><fmt:formatDate value="${notice.createdAt }" pattern="E" />요일</small></h5></div>
								<div><h3>
									<c:choose>
										<c:when test="${notice.weather eq '맑음' }">
											<img src="/static/images/sunny.png" width="35" height="35">
										</c:when>
										<c:when test="${notice.weather eq '흐림' }">
											<img src="/static/images/cloud.png" width="35" height="35">
										</c:when>
										<c:when test="${notice.weather eq '비' }">
											<img src="/static/images/rain.png" width="35" height="35">
										</c:when>
											<c:when test="${notice.weather eq '눈' }">
										<img src="/static/images/snow.png" width="35" height="35">
										</c:when>
									</c:choose>
								</h3></div>
							</div>
							<!-- /일자, 날씨 -->
							<!-- 공지 내용 -->
							<div class="w-50 d-flex align-items-center mx-3">
								<!-- 공지/투표인지, 반정보 -->
								<a href="/notice/detail_view/typeisnotice?id=${notice.id }" class="title-text">
								<div class="d-flex">
								<div class="btn-green my-1"><small><b>&nbsp;&nbsp;&nbsp;${notice.noticeType }&nbsp;&nbsp;&nbsp;</b></small></div>
								<div class="my-1 ml-1"><small><b>♡${notice.kidsClass}♡</b></small></div>
								</div>
								<!-- 공지제목&내용 -->
								<div>
									<h5><b>
									<c:set var="title" value="${notice.title }" />
										<c:choose>
											<c:when test = "${title.length() > 22 }">
												${fn:substring(title,0,22) }...
											</c:when>
											<c:otherwise>
											${notice.title }
											</c:otherwise>
										</c:choose>
									</b></h5>
									<c:set var="description" value="${notice.description }" />
									<div>
										<c:choose>									
											<c:when test="${description.length() > 30}">
											${fn:substring(description,0,30) }...
											</c:when>
											<c:otherwise>
											${notice.description }
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								</a>
							</div>
							<!-- /공지 내용 -->
							<!-- 사진 -->
							<!-- imagePath가 있을때만 -->
							<c:if test="${notice.imagePath ne null }">
								<div class="d-flex justify-content-center align-items-center w-25 mr-3">
									<div>
										<!-- 이미지 출력 -->
										<div class="picture-square-sm title-text d-flex justify-content-center align-items-center" id="picture">
										<img src="${notice.imagePath }" id="imagePath" class="imagethumbnail">
										</div>
									</div>
								</div>
							</c:if>
							<!-- /사진 -->
					</div>
					</c:forEach>
					<!-- /공지 요약 -->
					
					<!-- 투표 요약 section -->
					<c:forEach var="vote" items="${voteList}">
					<div>
						<div class="note-contraction d-flex">
							<!-- 일자, 날씨 -->
							<div class="w-25 text-center mt-3 ml-2">
								<div class="d-flex align-items-center justify-content-center"><h2><b><fmt:formatDate value="${vote.createdAt }" pattern="M" /></b></h2>월<h2><b><fmt:formatDate value="${vote.createdAt }" pattern="d" /></b></h2>일</div>
								<div><h5><small><fmt:formatDate value="${vote.createdAt }" pattern="E" />요일</small></h5></div>
								<div><h3>
									<c:choose>
										<c:when test="${vote.weather eq '맑음' }">
											<img src="/static/images/sunny.png" width="35" height="35">
										</c:when>
										<c:when test="${vote.weather eq '흐림' }">
											<img src="/static/images/cloud.png" width="35" height="35">
										</c:when>
										<c:when test="${vote.weather eq '비' }">
											<img src="/static/images/rain.png" width="35" height="35">
										</c:when>
											<c:when test="${vote.weather eq '눈' }">
										<img src="/static/images/snow.png" width="35" height="35">
										</c:when>
									</c:choose>
								</h3></div>
							</div>
							<!-- /일자, 날씨 -->
							<!-- 공지 내용 -->
							<div class="w-50 d-flex align-items-center mx-2">
								<!-- 공지/투표인지, 반정보 -->
								<a href="/notice/detail_view/typeisvote?id=${vote.id }" class="title-text">
								<div class="d-flex">
								<div class="btn-yellow my-1"><small><b>&nbsp;&nbsp;&nbsp;${vote.noticeType }&nbsp;&nbsp;&nbsp;</b></small></div>
								<div class="my-1 ml-1"><small><b>♡${vote.kidsClass}♡</b></small></div>
								</div>
								<!-- 공지제목&내용 -->
								<div>
									<h5><b>
									<c:set var="title" value="${vote.title }" />
										<c:choose>
											<c:when test = "${title.length() > 22 }">
												${fn:substring(title,0,22) }...
											</c:when>
											<c:otherwise>
											${vote.title }
											</c:otherwise>
										</c:choose>
									</b></h5>
									<c:set var="description" value="${vote.description }" />
									<div>
										<c:choose>									
											<c:when test="${description.length() > 30}">
											${fn:substring(description,0,30) }...
											</c:when>
											<c:otherwise>
											${vote.description }
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								</a>
							</div>
							<!-- /공지 내용 -->
					</div>
					</c:forEach>
					<!-- /투표 요약 -->
				</div>
				<!-- /page section -->
		
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

</body>
</html>