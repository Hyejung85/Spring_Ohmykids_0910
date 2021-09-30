<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 앨범상세</title>
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
			<c:forEach var="albumWithComment" items="${albumDetailList }" varStatus="status">
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-center w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5><b>앨범 상세</b></h5></div> 
					<div class="d-flex justify-content-center align-items-center">
						<!-- 목록 버튼 -->
						<div class="mr-2"><a href="/album/list_view" class="btn btn-yellow btn-sm"><b>목록으로</b></a></div>
						<!-- 수정 버튼 -->
						<div class="mr-2"><button type="button" class="btn btn-info text-white btn-sm" id="updateAlbumBtn" data-album-id="${albumWithComment.album.id }"><b>수정</b></button></div>
						<!-- 삭제 버튼 -->
						<div class="mr-3"><button type="button" class="btn btn-danger text-white btn-sm" id="deleteAlbumBtn" data-album-id="${albumWithComment.album.id }"><b>삭제</b></button></div>
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
							<h4><b><i class="bi bi-person-square"></i> ${albumWithComment.album.userName }</b></h4>
						</div>
						<div class="w-50 d-flex justify-content-end align-items-center" id="createdAtInput">
						   	<h5><b><fmt:formatDate value="${albumWithComment.album.createdAt }" pattern="yyyy-M-d(E)" /></b></h5>
						</div>
						<div class="w-25 d-flex justify-content-center mr-3 align-items-center" id="weatherInput">
								<c:choose>
									<c:when test="${albumWithComment.album.weather eq '맑음' }">
									<img src="/static/images/sunny.png" width="35" height="35">
									</c:when>
									<c:when test="${albumWithComment.album.weather eq '흐림' }">
									<img src="/static/images/cloud.png" width="35" height="35">
									</c:when>
									<c:when test="${albumWithComment.album.weather eq '비' }">
									<img src="/static/images/rain.png" width="35" height="35">
									</c:when>
									<c:when test="${albumWithComment.album.weather eq '눈' }">
									<img src="/static/images/snow.png" width="35" height="35">
									</c:when>
									</c:choose>
						</div>
				    </div>
				    <!-- /작성자, 날씨 section -->
				    <!-- 학생 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4">
				    	<div class="d-flex ml-3 align-items-center h-75" id="kidsClassInput">
				    		<b>♡${albumWithComment.album.kidsClass }♡</b>
				    	</div>
				    	<div class="d-flex ml-2 align-items-center h-75" id="kidsNameInput" data-kids-id=${albumWithComment.album.kidsId }>
				    		<b>${albumWithComment.album.kidsName }의 알림장</b>
				    	</div>
				    </div>
				    <!-- 학생 section -->
				    <!-- 사진 box-->
					<div class="d-flex justify-content-center mt-1 mb-1">
						<div class="d-flex justify-content-center">
							<div>
								<!-- 이미지 출력 -->
								<div class="picture-full title-text d-flex justify-content-center align-items-center" id="picture">
									<img src="${albumWithComment.album.imagePath }" id="imagePath" class="imagethumbnail" data-album-id="${albumWithComment.album.id }">
								</div>
								<!-- /이미지 출력 -->
								<div class="d-flex justify-content-between">
								<!-- 좋아요 -->
								<div class="d-flex align-items-center title-text justify-content-end mr-3">
									<a href="#" id="likeBtn" data-album-id="${albumWithComment.album.id }" class="ml-2">
										<c:choose>
											<c:when test="${albumWithComment.like }">
												<!-- 풀하트 -->
												<i class="bi bi-suit-heart-fill text-danger" id="heartIcon"></i> 
											</c:when>
												<c:otherwise>
												<!-- 빈하트 -->
													<i class="bi bi-suit-heart title-text" id="heartIcon"></i>
												</c:otherwise>
										</c:choose>
									</a>
									<!-- 좋아요 갯수-->
									<b><span id="likeCount" class="ml-1">${albumWithComment.likeCount }</span> Like</b>
								</div>
								<!-- /좋아요 -->
								<!-- MIME -->
								<input type="file" accept="image/*" id="fileInput" class="d-none">
								<div class="d-flex justify-content-left ml-3"><a href="#" class="mx-2" id="imageUploadBtn"><i class="bi bi-plus-square-fill title-text w-100 h-100"></i></a></div>
								<!-- /사진변경 버튼 -->
								</div>
							</div>
						</div>
					</div>
					<!-- /사진 -->
					
				    <!-- 알림장 section -->
				    <div class="note-detail-section">
					<!-- 알림장 내용  -->
					<textarea id="contentInput" class="note-textarea py-4 px-3 mb-2 w-100 border-0 non-resize title-text">${albumWithComment.album.content }</textarea>
					<!-- /알림장 내용-->
					<!-- 댓글 -->
					<c:forEach var="comment" items="${albumWithComment.commentList }">
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
					<div class="d-flex input-group" id="TypeIsAlbum">
						<input type="text" class="form-control" placeholder="댓글을 입력하세요." id="commentInput-${albumWithComment.album.id }">
						<button type="button" class="btn-green input-group-text" data-album-id="${albumWithComment.album.id }" id="commentSaveBtn">전송</button>
					</div>
					
					<!-- /댓글 입력창 -->
					</div>
					<!-- 앨범 section -->
				</div>
			</c:forEach>
			</div>
			<!-- /page section -->
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
		$(document).ready(function(){
			
			//앨범 수정
				$("#updateAlbumBtn").on("click", function(){
				
				var type = $("#typeInput").val();
				type = "album";
				var albumId = $("#updateAlbumBtn").data("album-id");
				var kidsId = $("#kidsNameInput").data("kids-id");
				var kidsClass = $("#kidsClassInput").val();
				var kidsName = $("#kidsNameInput").val();
				var weather = $("#weatherInput").val();
				var content = $("#contentInput").val();
				
				
				var formData = new FormData();
				formData.append("type", type);
				formData.append("albumId", albumId);
				formData.append("kidsId", kidsId);
				formData.append("kidsClass", kidsClass);
				formData.append("kidsName", kidsName);
				formData.append("weather", weather);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/album/update",
					processData:false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							alert("앨범 수정완료");
							location.reload();
						}else{
							alert("앨범 수정실패");
						}
						
					},
					error:function(e){
						alert("error");
					}
				});
				
				
			});
			
			//앨범 삭제
			$("#deleteAlbumBtn").on("click", function(){
				
				var targetId = $("#deleteAlbumBtn").data("album-id");
				var type = $("#typeInput").val();
				type = "album";
				
				$.ajax({
					type:"get",
					url:"/album/delete",
					data:{"targetId": targetId, "type":type},
					success:function(data){
						if(data.result == "success"){
							alert("앨범 삭제 성공");
							location.href="/album/list_view";
						}else{
							alert("앨범 삭제 실패");
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
			
			
			//코멘트 입력
			$("#commentSaveBtn").on("click", function(){
				
				var targetId = $(this).data("album-id"); //albumId
				var type = $("#TypeIsAlbum").val();
				type = "album";
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
							alert("댓글입력 성공");
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
							alert("댓글 삭제 성공");
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
			
			// 라이크 함수 생성
			function processLike(targetId, type){
				 <!--빈하트 클릭했을때-->
				 if($("#heartIcon").hasClass("bi-suit-heart")){
					
				 $.ajax({
					type:"get",
					url:"/like/create",
					data:{"targetId":targetId, "type":type},
					success:function(data){
							// 좋아요
							if(data.likeList == "success"){
								if($("#heartIcon").hasClass("bi-suit-heart")){
									$("#heartIcon").removeClass("bi-suit-heart");
									$("#heartIcon").addClass("bi-suit-heart-fill");
									
									$("#heartIcon").removeClass("title-text");
									$("#heartIcon").addClass("text-danger");
					
							}else{
								alert("좋아요 입력 실패");
								}
							}	
							$("#likeCount").text(data.likeCount);
					},
					error:function(e){
						alert("error");
					}
				 });
				 
				 <!-- 꽉찬 하트 클릭했을때 -->
				 }else if($("#heartIcon").hasClass("bi-suit-heart-fill")){
					 $.ajax({
						 type:"get",
						 url:"/like/delete",
						 data:{"targetId": targetId, "type":type},
						 success:function(data){
							 if(data.dislikeList == "success"){
								 if($("#heartIcon").hasClass("bi-suit-heart-fill")){
										$("#heartIcon").removeClass("bi-suit-heart-fill");
										$("#heartIcon").addClass("bi-suit-heart");
										
										$("#heartIcon").removeClass("text-danger");
										$("#heartIcon").addClass("title-text");
							
								}else{
									alert("좋아요 취소 실패");
								}
							 }
							 $("#likeCount").text(data.likeCount);
						 },
						 error:function(e){
							 alert("error");
						 }
					 });
					
				 }
				 
			}
			
			// 좋아요 클릭
			 $("#likeBtn").on("click",function(e){	
				 e.preventDefault();
				
				 var targetId = $(this).data("album-id"); //albumId
				 var type = $("#TypeIsAlbum").val();
				 type = "album";
			
				 processLike(targetId, type);
				 
			 });
			 
			 // 이미지 더블클릭했을때도 라이크 온&오프
			 $(".imagethumbnail").on("dblclick", function(){
				 
				 var targetId = $(this).data("album-id"); //albumId
				 var type = $("#TypeIsAlbum").val();
				 type = "album";
				 
				 processLike(targetId, type);
			 });
			 
		});
	</script>

</body>
</html>