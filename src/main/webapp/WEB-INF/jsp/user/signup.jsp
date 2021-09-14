<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 회원가입</title>
<!-- bootstrap CDN link -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/static/css/style.css" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />
		<section class="d-flex justify-content-center align-items-center">
			<div class="sign-section p-5">
				<!-- 회원가입 제목  -->
				<h1 class="title-text text-center"><i class="bi bi-stickies"></i><span class="ml-2">회원가입</span></h1>
				<form method="post" action="/user/sign_up" id="signupForm" class="my-5">
					<!-- 선생님/학부모 구분 -->
					<div class="d-flex justify-content-center">
						<div class="mr-5 title-text"><label><input type="radio" name="type" value="teacher"  class="mr-1"><b>선생님</b></label></div>
						<div class="title-text"><label><input type="radio" name="type" value="parent" class="mr-1"><b>학부모</b></label></div>
					</div>
					<!-- 아이디 -->
					<div class="d-flex mt-3">
						<div class="input-group d-flex">
							<i class="bi bi-person input-group-text box mt-3 btn-green"></i>
							<input type="text" class="form-control mt-3 box " placeholder="아이디" id="loginIdInput" name="loinId">
						</div>
						<button type="button" class="btn btn-green btn-sm mt-3 ml-2 text-white" id="idDuplicateBtn">중복확인</button>
					</div>
					<!-- 아이디 중복여부 확인-->
					<div class="text-success d-none" id="noneDuplicateDiv">
						<small>사용 가능한 아이디입니다.</small>
					</div>
					<div class="text-danger d-none" id="duplicateDiv">
						<small>중복된 아이디입니다.</small>
					</div>
					<!-- 비밀번호-->
					<div class="input-group d-flex">
						<i class="bi bi-check input-group-text box mt-2 btn-green"></i>
						<input type="password" class="form-control mt-2 box" placeholder="비밀번호" id="passwordInput" name="password">
					</div>
					<div class="input-group d-flex">
						<i class="bi bi-check-all input-group-text box mt-2 btn-green"></i>
						<input type="password" class="form-control mt-2 box" placeholder="비밀번호 확인" id="passwordCheckInput">
					</div>
					<!-- 비밀번호 일치여부 확인 -->
					<div id="errorPassword" class="text-danger d-none"><small>비밀번호가 일치하지 않습니다.</small></div>
					<!-- 이름-->
					<div class="input-group d-flex">
						<i class="bi bi-brush input-group-text box mt-2 btn-green"></i>
						<input type="text" class="form-control mt-2 box"  placeholder="이름" id="nameInput" name="name">
					</div>
					<!-- 이메일-->
					<div class="input-group d-flex">
						<i class="bi bi-envelope-fill input-group-text box mt-2 btn-green"></i>
						<input type="text" class="form-control mt-2 box" placeholder="이메일 " id="emailInput" name="email">
					</div>
					<!-- 가입하기 버튼-->
					<button type="submit" class="btn btn-green btn-block text-white mt-3" id="signupBtn">가입하기</button>
				</form>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			var isIdCheck = false;
			var isDuplicate = true;
			
			$("#signupForm").on("submit",function(e){
				e.preventDefault();

				var type = $("input[name=type]:checked").val();
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordCheck = $("#passwordCheckInput").val();
				var name = $("#nameInput").val().trim();
				var email = $("#emailInput").val().trim();
				
				if(type == null || type ==""){
					alert("선생님 또는 학부모님 항목을 선택해주세요.");
					return;
				}
				if(loginId == null || loginId ==""){
					alert("아이디를 입력해주세요.");
					return;
				}
				if(password == null || password ==""){
					alert("비밀번호를 입력해주세요.");
					return;
				}
				if(password != passwordCheck){
					$("#errorPassword").removeClass("d-none");
					return;
				}
				if(name == null || name ==""){
					alert("이름을 입력해주세요.");
					return;
				}
				if(email == null || email ==""){
					alert("이메일을 입력해주세요.");
					return;
				}
				// 아이디 중복체크 했는지
				if(isIdCheck == false){
					alert("아이디 중복체크를 해주세요.");
					return;
				}
				
				// 아이디가 중복되었는지
				if(isDuplicate == true){
					alert("아이디가 중복되었습니다.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"type":type, "loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data){
						if(data.result == "success"){
							alert("회원가입 성공! 로그인 화면으로 이동합니다.");
							location.href="/user/signin_view";
						}else{
							alert("회원가입 실패");
						}
					},
					error:function(e){
						alert("error");
					}
					
				});
				return false;
			});
			
			$("#idDuplicateBtn").on("click", function(){
				var loginId = $("#loginIdInput").val();
				
				if(loginId == null || loginId == ""){
					alert("아이디를 입력하세요");
					return;
				}
				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"loginId":loginId},
					success:function(data){
						isIdCheck = true;
						
						if(data.is_duplicate){
							isDuplicate = true;
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
						}else{
							isDuplicate = false;
							$("#duplicateDiv").addClass("d-none");
							$("#noneDuplicateDiv").removeClass("d-none");
						}
					},
					error:function(e){
						alert("아이디 중복확인 실패");
					}
				});
			});
		});
	</script>
</body>
</html>