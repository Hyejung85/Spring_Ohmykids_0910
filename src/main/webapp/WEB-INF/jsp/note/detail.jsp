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
		<section class="d-flex justify-content-center align-items-center mt-3">
			<div>
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-center w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5><b>알림장 상세</b></h5></div> 
					<div class="d-flex justify-content-center align-items-center">
						<!-- 목록 버튼 -->
						<div class="mr-2"><a href="/note/list_view" class="btn btn-yellow btn-sm"><b>목록으로</b></a></div>
						<!-- 수정 버튼 -->
						<div class="mr-2"><button type="button" class="btn btn-info text-white btn-sm" id="updateNoteBtn" data-note-id="${note.id }"><b>수정</b></button></div>
						<!-- 삭제 버튼 -->
						<div class="mr-3"><button type="button" class="btn btn-danger text-white btn-sm" id="deleteNoteBtn" data-note-id="${note.id }"><b>삭제</b></button></div>
					</div>
				</div>
			</div>
			<!-- /submenu-bar -->
			<!-- page section -->
			<div class="page-section px-2 d-flex justify-content-center border-0">
				<div>
					<!-- 작성자, 날씨 section -->
					<div class="writerInfo-secton d-flex my-1">
						<div class="w-25 d-flex justify-content-start ml-3 align-items-center" id="userNameInput">
							<h4><b><i class="bi bi-person-square"></i> ${note.userName }</b></h4>
						</div>
						<div class="w-50 d-flex justify-content-end align-items-center" id="createdAtInput">
						   	<h5><b><fmt:formatDate value="${note.createdAt }" pattern="yyyy-M-d(E)" /></b></h5>
						</div>
						<div class="w-25 d-flex justify-content-center mr-3 align-items-center" id="weatherInput">
								<c:choose>
									<c:when test="${note.weather eq '맑음' }">
									<img src="/static/images/sunny.png" width="35" height="35">
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
						</div>
				    </div>
				    <!-- /작성자, 날씨 section -->
				    <!-- 학생 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4">
				    	<div class="d-flex ml-3 align-items-center h-75" id="kidsClassInput">
				    	<b>♡${note.kidsClass }♡</b>
				    	</div>
				    	<div class="d-flex ml-2 align-items-center h-75" id="kidsNameInput">
				    	<b>${note.kidsName }의 알림장</b>
				    	</div>
				    </div>
				    <!-- 학생 section -->
				    <!-- 사진 box-->
					<div class="d-flex justify-content-center mt-2">
						<div class="d-flex justify-content-center">
							<div>
								<!-- 이미지 출력 -->
								<div class="picture-full title-text d-flex justify-content-center align-items-center" id="picture">
								<img src="${note.imagePath }" id="imagePath" class="imagethumbnail">
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
				    <!-- 알림장 section -->
				    <div class="note-detail-section my-1">
					<!-- 알림장 내용  -->
					<textarea id="contentInput" class="pt-4 px-3 w-100 border-0 non-resize title-text">${note.content }</textarea>
					<!-- /알림장 내용-->
					<!-- 댓글 -->
					<div class="m-3 title-text">박예은 엄마 안녕하세요.</div>
					<!-- /댓글 -->
					<!-- 댓글 입력창 -->
					<div class="d-flex input-group">
					<input type="text" class="form-control" placeholder="댓글을 입력하세요.">
					<button type="button" class="btn-green input-group-text">전송</button>
					</div>
					<!-- /댓글 입력창 -->
					</div>
					<!-- 알림장 section -->
				</div>
			</div>
			<!-- /page section -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
		$(document).ready(function(){
			//알림장 수정
				$("#updateNoteBtn").on("click", function(){
				
				var noteId = $(this).data("note-id");
				var kidsId = $(this).data("kids-id");
				var kidsClass = $("#kidsClassInput").val();
				var kidsName = $("#kidsNameInput").val();
				var weather = $("#weatherInput").val();
				var content = $("#contentInput").val();
				
				
				var formData = new FormData();
				formData.append("noteId", noteId);
				formData.append("kidsId", kidsId);
				formData.append("kidsClass", kidsClass);
				formData.append("kidsName", kidsName);
				formData.append("weather", weather);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/note/update",
					processData:false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							alert("알림장 수정완료");
							location.href="/note/detail_view";
						}else{
							alert("알림장 수정을 실패했습니다.");
						}
						
					},
					error:function(e){
						alert("error");
					}
				});
				
				
			});
			
			//알림장 삭제
			$("#deleteNoteBtn").on("click", function(){
				var noteId = $(this).data("note-id");
				$.ajax({
					type:"get",
					url:"/note/delete",
					data:{"id": noteId},
					success:function(data){
						if(data.result == "success"){
							alert("알림장 삭제 성공");
							location.href="/note/list_view";
						}else{
							alert("알림장 삭제 실패");
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
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
			
		});
	</script>
</body>
</html>