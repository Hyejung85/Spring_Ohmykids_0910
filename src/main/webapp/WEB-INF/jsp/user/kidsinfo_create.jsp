<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 자녀정보등록</title>
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
		<form id="kidsinfoForm" method="post" action="/user/accounts/kidsinfo/create">	
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-center w-100 mt-3">
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
		</form>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
		$(document).ready(function(){
			//datepicker
			$("#kidsBirthInput").datepicker({
				dateFormat:"yy-mm-dd"
				, showMonthAfterYear:true
				, yearRange: '1950:2030'
				, changeYear: true
				, changeMonth: true
				, monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				, dayNamesMin: ['일','월','화','수','목','금','토']
			});
			
			//사진변경 버튼 클릭시 파일인풋 클릭 이벤트
			$("#imageUploadBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			//자녀정보 입력
			$("#kidsinfoForm").on("submit",function(e){
				
				e.preventDefault();
				
				var kidsName = $("#kidsNameInput").val();
				var kidsBirth = $("#kidsBirthInput").datepicker().val(); // datepicker
				var kidsGender = $("#kidsGenderInput option:selected").val(); //select box
				var kidsClass = $("#kidsClassInput option:selected").val(); //select box
				var relationship = $("#relationshipInput option:selected").val(); //select box
				
				if(kidsName == null || kidsName ==""){
					alert("자녀의 이름을 입력해 주세요.");
					return;
				}
				if(kidsBirth == null || kidsBirth ==""){
					alert("자녀의 생일을 선택해주세요.");
					return;
				}
				if(kidsGender == null || kidsGender == ""){
					alert("자녀의 성별을 선택해주세요.");
					return;
				}
				if(kidsClass == null || kidsClass ==""){
					alert("자녀가 소속된 반을 선택해주세요.");
					return;
				}
				if(relationship == null || relationship == ""){
					alert("자녀와의 관계를 선택해주세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("kidsName", kidsName);
				formData.append("kidsBirth", kidsBirth);
				formData.append("kidsGender", kidsGender);
				formData.append("kidsClass", kidsClass);
				formData.append("relationship", relationship);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/kidsinfo/create",
					processData:false, //파일업로드 필수
					contentType:false, //파일업로드 필수
					data:formData,
					success:function(data){
						if(data.result == "success"){
							alert("자녀정보 등록 성공");
							location.href="/kidsinfo/list_view";
						}else{
							alert("자녀정보등록에 실패했습니다.");
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
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