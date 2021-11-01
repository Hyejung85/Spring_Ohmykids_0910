<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 알림장작성</title>
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
					<div class="mx-3 mt-2"><h5><b>알림장 작성</b></h5></div> 
					<!-- 저장 버튼 (학생이 셀렉트되면 id정보를 저장버튼에 주입한다.)-->
					<div class="mx-3"><a href="#" class="btn btn-yellow btn-sm" id="noteSaveBtn"><b>저장</b></a></div>
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
				    <!-- 학생선택 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4">
				    	<div class="w-50 d-flex ml-3 align-items-center h-75">
				    	<b>학생선택</b>
				    	<c:if test="${userType eq '선생님' }">
				    	<a href= "#" class="btn btn-green ml-4" id="kidsInfoForTeacher">전체원아보기</a>
				    	<!-- 모달 -->	   				    	
				    	<button type="button" class="kidsInfoModal d-none btn btn-primary" data-toggle="modal" data-target=".kidsInfoModal-lg"></button>
				    	<!-- /모달 -->
				    	</c:if>
				    	</div>
				    	<!-- 반정보 -->
				    	<div class="w-50 d-flex justify-content-center align-items-center title-text h-75 mx-3">
				    	<select class="form-control text-center" id="kidsClassAndNameInput">
				    		<option value="">--반 & 이름--</option>
				    		<c:forEach var="kid" items="${kidsInfoList }" varStatus="state">
				    		<option value="${kid.kidsClass }-${kid.kidsName }" data-kids-id="${kid.id }" data-kids-userid="${kid.userId }">${kid.kidsClass }-${kid.kidsName }</option>
				    		</c:forEach>		
				    	</select>
				    	</div>
				    </div>
				    <!-- 학생선택 section -->
				    <!-- 알림장 section -->
				    <div class="note-section my-1">
					<!-- 알림장 내용  -->
					<textarea id="contentInput" class="pt-4 px-4 w-100 border-0 non-resize" rows=8 placeholder=
					<c:choose>
						<c:when test="${userType eq '선생님' }">
						"원에서 이렇게 지냈어요."
						</c:when>
						<c:otherwise>
						"가정에서 이렇게 지냈어요."
						</c:otherwise>
					</c:choose>
					></textarea>
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
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
		<!-- 전체원아보기 모달 상세 -->
		<div class="modal fade kidsInfoModal-lg" id="kidsInfoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			<div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title title-text" id="exampleModalLabel">전체 학생 보기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> 
		      </div>
		      <div class="modal-body">
		        <table class="table text-center  my-3 title-text border-success">
					<thead class="table-dark bg-success">
						<tr>
							<th>관리Id</th>
							<th>사진</th>
							<th>소속</th>
							<th>이름</th>
							<th>성별</th>
							<th>생년월일</th>
							<th>부모정보</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="kids" items="${kidsInfoList }">	
						<tr>
							<th><a href="/kidsinfo/detail_view?id=${kids.id }" class="title-text">${kids.id }</a></th>
							<td><img src="${kids.imagePath }" width="100"></td>
							<td>${kids.kidsClass }</td>
							<td>${kids.kidsName }</td>
							<td>${kids.kidsGender }</td>
							<td><fmt:formatDate value="${kids.kidsBirth }" pattern="YYYY-M-d"/></td>
							<td>${kids.relationship } - ${kids.userName }</td>
							<td><input type="radio" name="choice" data-kids-id="${kids.id }" id="radiobox-${kids.id }" value="${kids.kidsClass }-${kids.kidsName}"></td>
						</tr>
						</c:forEach>
					</tbody>
				 </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-white border-success" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-green" id="kidsIdSaveBtn" data-kids-id="${kids.id }">선택완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- /전체원아보기 모달 상세 -->

	</div>
	<script>
		$(document).ready(function(){
			//저장버튼에 kidsId를 주입한다.
			$("#kidsClassAndNameInput").on("change",function(){
				var kidsId = $("#kidsClassAndNameInput option:selected").data("kids-id");
				$("#noteSaveBtn").data("kids-id", kidsId);
			});
			
			//알림장 저장
			$("#noteSaveBtn").on("click", function(e){
				
				e.preventDefault();
				
				var type = $("#typeInput").val();
				type = "note";
				var kidsId = $("#kidsClassAndNameInput option:selected").data("kids-id");
				var parentsId = $("#kidsClassAndNameInput option:selected").data("kids-userid");
				//kidsClass와 kidsClass 쪼개기
				var options = $("#kidsClassAndNameInput option:selected").val(); //select box
				var value = options.split("-");
				var kidsClass = value[0];
				var kidsName = value[1];
				var weather = $("#weatherInput option:selected").val();  //select box
				var content = $("#contentInput").val();
				
				if(options == null || options == "" || options == "--반 & 이름--"){
					alert("학생을 선택해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("type", type);
				formData.append("kidsId", kidsId);
				formData.append("kidsClass", kidsClass);
				formData.append("kidsName", kidsName);
				formData.append("parentsId", parentsId);
				formData.append("weather", weather);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/note/create",
					processData: false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							//alert("알림장 작성완료");
							location.href="/note/list_view";
							//location.href="/note/detail_view?id=${result.id}"; --> 보류
						}else{
							alert("알림장 작성을 실패했습니다.");
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
			
			//모달 열기
			$("#kidsInfoForTeacher").on("click",function(){
				$(".kidsInfoModal").click();
				
				// 모달에서 학생 선택완료 > 셀렉트 박스 해당 학생으로 변경 
				$("#kidsIdSaveBtn").on("click", function(){
					//체크값 가져오기 (반-이름)
					var obj_length = document.getElementsByName("choice").length;
					
					for(var i=0; i < obj_length; i++){
						if(document.getElementsByName("choice")[i].checked == true){
							var result = document.getElementsByName("choice")[i].value
							
							//셀렉트 박스 값 변경하기
							$("#kidsClassAndNameInput").val(result).prop("selected", true);
							
							//모달창 닫기
							$("#kidsInfoModal").hide();
							$(".modal-backdrop").remove(); //모달창을 호출할대 발생한 레이어가 남아있어 삭제처리하여 보이지 않게 함
							
							
						}
					
					}
					
				});
			});
			

			
			
			
		});
	
	</script>
</body>
</html>