<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 공지상세</title>
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
			<div id="typeIsNotice">
			<c:forEach var="noticeWithComment" items="${noticeWithCommentList }" varStatus="status">
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-top mt-3 w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5><b>공지 상세</b></h5></div> 
					<div class="d-flex justify-content-center align-items-center">
						<!-- 목록 버튼 -->
						<div class="mr-2"><a href="/notice/list_view" class="btn btn-yellow btn-sm"><b>목록으로</b></a></div>
						<!-- 수정 버튼 -->
						<c:if test="${noticeWithComment.notice.userId eq userId }">
						<div class="mr-2"><button type="button" class="btn btn-info text-white btn-sm" id="updateNoticeBtn" data-notice-id="${noticeWithComment.notice.id }"><b>수정</b></button></div>
						<!-- 삭제 버튼 -->
						<div class="mr-3"><button type="button" class="btn btn-danger text-white btn-sm" id="deleteNoticeBtn" data-notice-id="${noticeWithComment.notice.id }"><b>삭제</b></button></div>
						</c:if>
					</div>
				</div>
			</div>
			<!-- /submenu-bar -->
			<!-- page section -->
			<div class="page-section px-2 d-flex justify-content-center border-0">
				<div>
					<!-- 작성자 section -->
					<div class="writerInfo-secton d-flex my-1">
						<div class="w-50 d-flex justify-content-start ml-3 align-items-center" id="userNameInput">
							<h4><b><i class="bi bi-person-square"></i> ${noticeWithComment.notice.userName } ${noticeWithComment.notice.userType }</b></h4>
						</div>
						<div class="w-35 d-flex justify-content-end align-items-center" id="createdAtInput">
						   	<h5><b><fmt:formatDate value="${noticeWithComment.notice.createdAt }" pattern="yyyy-M-d(E)" /></b></h5>
						</div>
						<div class="w-15 d-flex justify-content-end align-items-center ml-3" id="createdAtInput">
							<c:choose>
									<c:when test="${noticeWithComment.notice.weather eq '맑음' }">
										<img src="/static/images/sunny.png" width="35" height="35">
									</c:when>
									<c:when test="${noticeWithComment.notice.weather eq '흐림' }">
										<img src="/static/images/cloud.png" width="35" height="35">
									</c:when>
									<c:when test="${noticeWithComment.notice.weather eq '비' }">
										<img src="/static/images/rain.png" width="35" height="35">
									</c:when>
									<c:when test="${noticeWithComment.notice.weather eq '눈' }">
										<img src="/static/images/snow.png" width="35" height="35">
									</c:when>
							</c:choose>
						</div>
				    </div>
				    <!-- /작성자 section -->
				    <!-- 공지 타입, 반선택 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4 ">
				    	<!-- 공지타입 -->
				    	<div class="w-50 d-flex ml-3 align-items-center h-75 ">
				    	<select class="form-control text-center btn-yellow" id="noticeTypeInput">
				    		<option value="${noticeWithComment.notice.noticeType}">
					    		<c:if test="${noticeWithComment.notice.noticeType eq 'notice'}">
					    			공지
					    		</c:if>
				    		 </option>
				    	</select>
				    	</div>
				    	<!-- 반정보 -->
				    	<div class="w-50 d-flex justify-content-center align-items-center title-text h-75 mx-3">
				    	<select class="form-control text-center" id="kidsClassInput">
				    		<option value="${noticeWithComment.notice.kidsClass }">-- ${noticeWithComment.notice.kidsClass } --</option>
				    		<c:forEach var="kid" items="${kidsClassList }" varStatus="state">
				    		<option value="${kid.kidsClass }" data-kids-class="${kid.kidsClass }">${kid.kidsClass }</option>
				    		</c:forEach>		
				    	</select>
				    	</div>
				    </div>
				    <!-- 공지 title -->
				    <div class="title-section d-flex  mt-1 py-2 px-3"> 
				    	<div class ="mt-2"><b>Title</b></div>
				    	<textarea class="form-control ml-2 mt-1 title-text border-0 font-weight-bold" id="titleInput"> ${noticeWithComment.notice.title }</textarea>
				    </div>
				    <!-- 공지 section -->
				    <div class="note-section my-1">
				    <!-- 사진 box-->
					<div class="d-flex justify-content-center">
						<div class="d-flex justify-content-center">
							<div>
								<!-- 이미지 출력 -->
								<div class="picture-full title-text d-flex justify-content-center align-items-center" id="picture">
									<img src="${noticeWithComment.notice.imagePath }" id="imagePath" class="imagethumbnail">
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
					<!-- 공지 내용  -->
					<textarea id="descriptionInput" class="note-textarea pt-4 px-4 w-100 border-0">${noticeWithComment.notice.description }</textarea>
					<!-- /공지 내용-->
					<!-- 댓글 -->
					<c:forEach var="comment" items="${noticeWithComment.commentList }">
						<div class="d-flex">
							<!-- 댓글 작성자, 내용 -->
							<div class="mx-3 title-text"><b class="mr-2">${comment.userName }</b> ${comment.content }</div>
							<!-- 댓글 삭제 -->
								<!-- 글의 userId와 세션의 userId가 일치하면 삭제 버튼 노출 -->
								<c:if test="${comment.userId eq userId }">
									<div class="d-flex align-items-center">
										<!-- 댓글삭제 버튼 -->
										<i class="deleteCommentBtn bi bi-x-square title-text ml-3 mb-2" data-comment-id="${comment.id }"></i>
									</div>
								</c:if>
							<!-- /댓글 삭제 -->
						</div>
					</c:forEach>
					<!-- /댓글 -->
					<!-- 댓글 입력창 -->
					<div class="d-flex input-group" id="TypeIsNote">
						<input type="text" class="form-control" placeholder="댓글을 입력하세요." id="commentInput-${noticeWithComment.notice.id }">
						<button type="button" class="btn-green input-group-text" data-notice-id="${noticeWithComment.notice.id }" id="commentSaveBtn">전송</button>
					</div>
					<!-- /댓글 입력창 -->
					</div>
					<!-- 공지 section -->
				</div>
			</div>
			<!-- /page section -->
			</c:forEach>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
		$(document).ready(function(){
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
			
			
			//코멘트 입력
			$("#commentSaveBtn").on("click", function(){

				var targetId = $(this).data("notice-id"); //noticeId
				var type = $("#TypeIsNotice").val();
				type = "notice";
				var content = $("#commentInput-" + targetId).val().trim();
				
				
				//댓글 입력여부 밸리데이션
				if(content == null || content ==""){
					alert("댓글을 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/comment/create",
					data:{"type":type, "targetId": targetId, "content":content},
					success:function(data){
						if(data.result == "success"){
							//alert("댓글입력 성공");
							location.reload();
						}else{
							alert("댓글입력 실패");
						}
					},
					error:function(e){
						alert("error");
					}
				});
					
			});
			
			//댓글삭제
			$(".deleteCommentBtn").on("click",function(){
				
				var id = $(this).data("comment-id");
				
				
				$.ajax({
					type:"get",
					url:"/comment/delete",
					data:{"id":id},
					success:function(data){
						if(data.result == "success"){
							//alert("댓글 삭제 성공");
							location.reload();
						}else{
							alert("댓글 삭제 실패");
						}
					},
					error:function(e){
						alert("error");
					}
					
				});
			});
			
			//공지 수정
			$("#updateNoticeBtn").on("click", function(){
				var postType = $("typeInput").val();
				postType = "notice";
				var noticeId = $("#updateNoticeBtn").data("notice-id");
				var kidsClass = $("#kidsClassInput option:selected").val();
				var noticeType = $("#noticeTypeInput option:selected").val();
				var weather = $("#weatherInput option:selected").val();
				var title = $("#titleInput").val();
				var description = $("#descriptionInput").val();
				
				var formData = new FormData();
				formData.append("postType", postType);
				formData.append("noticeId", noticeId);
				formData.append("kidsClass", kidsClass);
				formData.append("noticeType", noticeType);
				formData.append("weather", weather);
				formData.append("title", title);
				formData.append("description", description);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/notice/notice/update",
					processData:false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							alert("공지 수정완료");
							location.href="/notice/list_view";
						}else{
							alert("공지 수정실패");
						}
						
					},
					error:function(e){
						alert("error");
					}
				});
			});
			
		});
	
	</script>
</body>
</html>