<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 공지작성</title>
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
			<div class="submenu-bar d-flex justify-content-top mt-3 w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5><b>공지 작성</b></h5></div> 
					<!-- 저장 버튼 -->
					<div class="mx-3"><a href="#" class="btn btn-yellow btn-sm" id="noticeSaveBtn"><b>저장</b></a></div>
				</div>
			</div>
			<!-- /submenu-bar -->
			<!-- page section -->
			<div class="page-section px-2 d-flex justify-content-center border-0">
				<div>
					<!-- 작성자 section -->
					<div class="writerInfo-secton d-flex my-1">
						<div class="w-50 d-flex justify-content-start ml-3 align-items-center" id="userNameInput">
							<h4><b><i class="bi bi-person-square"></i> ${userName } ${userType }</b></h4>
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
				    <!-- 공지 타입, 반선택 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4">
				    	<!-- 공지타입 -->
				    	<div class="w-50 d-flex ml-3 align-items-center h-75">
				    	<select class="form-control text-center" id="noticeTypeInput">
				    		<option value="">-- 공지 유형 --</option>
				    		<option value="notice">공지</option>
				    		<option value="vote">투표</option>
				    	</select>
				    	</div>
				    	<!-- 반정보 -->
				    	<div class="w-50 d-flex justify-content-center align-items-center title-text h-75 mx-3">
				    	<select class="form-control text-center" id="kidsClassInput">
				    		<option value="">-- 학급 선택 --</option>
				    		<c:forEach var="kid" items="${kidsClassList }" varStatus="state">
				    		<option value="${kid.kidsClass }" data-kids-class="${kid.kidsClass }">${kid.kidsClass }</option>
				    		</c:forEach>		
				    	</select>
				    	</div>
				    </div>
				    <!-- 공지 title -->
				    <div class="studentInfo-secton d-flex align-items-center mt-1 py-4 px-3"> 
				    	<b>Title</b>
				    	<input type="text" class="form-control ml-2" id="titleInput">
				    </div>
				    <!-- 공지 section -->
				    <div class="note-section my-1">
					<!-- 공지 내용  -->
					<textarea id="descriptionInput" class="pt-4 px-4 w-100 border-0 non-resize" rows=5 placeholder="공지 내용을 입력해 주세요."	></textarea>
					<!-- /공지 내용-->
					<!-- 투표 box -->
					<div class="m-3 d-none" id="selectVoteBox">
						<!-- 찬성 -->
						<div class="green-border title-text pt-2 d-flex justify-content-between">
							<div><input type="radio" name="vote" value="찬성" class="ml-3 mr-2"><b>찬성</b></div> 
							<div class="mr-3"><i class="bi bi-person-fill title-text"></i><small>11명</small></div>
						</div>
						<!-- 반대 -->
						<div class="green-border title-text pt-2 my-2 d-flex justify-content-between">
							<div><input type="radio" name="vote" value="반대" class="ml-3 mr-2"><b>반대</b></div> 
							<div class="mr-3"><i class="bi bi-person-fill title-text"></i><small>11명</small></div>
						</div>
						<!-- 종료 -->
						<div class="title-text ml-2 d-flex align-items-center">
							<small class="w-25"><b>종료일자</b></small>
							<input type="text" class="form-control box w-75" placeholder="" id="endDateInput">
						</div>
					</div>
					<!-- /투표 box -->
					<!-- 사진 box-->
					<div class="d-flex mx-3 mb-2">
						<div class="d-flex justify-content-center">
							<div class="d-none" id="selectPictureBox">
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
					<!-- 공지 section -->
				</div>
			</div>
			<!-- /page section -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
	$(document).ready(function(){
		//datepicker
		$("#endDateInput").datepicker({
			dateFormat:"yy-mm-dd"
			, showMonthAfterYear:true
			, yearRange: '1950:2030'
			, changeYear: true
			, changeMonth: true
			, monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			, dayNamesMin: ['일','월','화','수','목','금','토']
		});
		
		//사진변경 버튼 클릭시 파일인풋 클릭 이벤트
		$("#imageUploadBtn").on("click", function(e){
			e.preventDefault();
			$("#fileInput").click();
		});
		
		//사진 미리보여주기
		$("#fileInput").on("change",function(){
			setImageFromFile(this, "#imagePath");
		});
		
		function setImageFromFile(input, expression){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
					$(expression).attr("src",e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		//공지타입 선택에 따른 화면 전환
		$("#noticeTypeInput").on("change",function(){		
			var noticeType = $("#noticeTypeInput option:selected").text();
			
			if(noticeType == "투표"){
				$("#selectPictureBox").addClass("d-none"); 
				$("#selectVoteBox").removeClass("d-none");
			}
			if(noticeType == "공지"){ //공지
				$("#selectVoteBox").addClass("d-none");
				$("#selectPictureBox").removeClass("d-none");
			}
		});
		
		//insert
		$("#noticeSaveBtn").on("click",function(e){
			e.preventDefault();
			
			//1. 저장버튼에 kidsClass를 주입한다.
			//var kidsClass = $("#kidsClassInput option:selected").data("kids-kidsClass");
			//$("#noticeSaveBtn").data("kids-class", kidsClass);
			
				var postType = $("typeInput").val();
				postType = "notice";
				var kidsClass = $("#kidsClassInput option:selected").val();
				var noticeType = $("#noticeTypeInput option:selected").val();
				var weather = $("#weatherInput option:selected").val();
				var title = $("#titleInput").val();
				var description = $("#descriptionInput").val();
				
				
				//유효성 검사
				if(noticeType == null || noticeType == "" || noticeType =="-- 공지 유형 --"){
					alert("공지 유형을 선택해 주세요.");
					return;
				}
				if(kidsClass == null || kidsClass =="" || kidsClass =="-- 학급 선택 --"){
					alert("학급을 선택하세요.");
					return;
				}
				if(title == null || title == ""){
					alert("공지 제목을 입력하세요.");
					return;
				}
				if(description == null || description ==""){
					alert("공지 내용을 입력하세요.");
					return;
				}
				
			
			//2. 저장 대상이 공지인지, 투표인지 분기한다.
			if($("#noticeTypeInput option:selected").text() == "공지"){
				
				//공지에  저장 
				var formData = new FormData();
				formData.append("postType", postType);
				formData.append("kidsClass", kidsClass);
				formData.append("noticeType", noticeType);
				formData.append("weather", weather);
				formData.append("title", title);
				formData.append("description", description);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/notice/notice/create",
					processData: false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							//alert("공지 작성완료");
							location.href="/notice/list_view";
						}else{
							alert("공지 작성을 실패했습니다.");
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
			//투표에 저장	
			}else{
				//유효성 검사
				var endDate = $("#endDateInput").val();
				if(endDate == null || endDate ==""){
					alert("투표 종료일자를 입력하세요.");
					return;
				}
				
				//투표에  저장 
				var formData = new FormData();
				formData.append("postType", postType);
				formData.append("kidsClass", kidsClass);
				formData.append("noticeType", noticeType);
				formData.append("weather", weather);
				formData.append("title", title);
				formData.append("description", description);
				formData.append("endDate", endDate);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/notice/vote/create",
					processData: false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							//alert("투표 작성완료");
							location.href="/notice/list_view";
						}else{
							alert("투표 작성을 실패했습니다.");
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
			}
			
			
		});
	});
	</script>
</body>
</html>