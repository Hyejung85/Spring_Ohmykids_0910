<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 로그인</title>
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
				<!-- 로그인 제목  -->
				<h1 class="title-text text-center"><i class="bi bi-box-arrow-in-right"></i><span class="ml-2">Log-in</span></h1>
				<form id="loginForm" class="my-5">
					<!-- 선생님/학부모 타입 선택 -->
					<div class="d-flex justify-content-center">
						<div class="mr-5 title-text"><label><input type="radio" name="type" value="선생님"  class="mr-1"><b>선생님</b></label></div>
						<div class="title-text"><label><input type="radio" name="type" value="학부모" class="mr-1"><b>학부모</b></label></div>
					</div>
					<!-- 아이디 입력 -->
					<div class="input-group d-flex">
						<i class="bi bi-person input-group-text box mt-3 btn-green"></i>
						<input type="text" class="form-control mt-3 box" placeholder="아이디" id="loginIdInput">
					</div>
					<!-- 비밀번호 입력 -->
					<div class="input-group d-flex">
						<i class="bi bi-check input-group-text box mt-2 btn-green"></i>
						<input type="password" class="form-control mt-2 box" placeholder="비밀번호" id="passwordInput">
					</div>
					<!-- 로그인 버튼 -->
					<button type="submit" class="btn btn-green btn-block text-white mt-3" id="loginBtn">로그인</button>
				</form>
				<hr>
				<!-- 비밀번호 찾기 링크 -->
				<div  class="text-center"><a href="#"  class="title-text">비밀번호를 잊으셨나요?</a></div>
				<!-- 계정만들기 링크 -->
				<div class="sub-box d-flex pt-5 justify-content-center  w-100">
					계정이 없으신가요?<a class="ml-2 title-text" href="/user/signup_view"><b>가입하기</b></a>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
	$(document).ready(function(){
		$("#loginBtn").on("click", function(e){
			e.preventDefault();
			
			var type = $("input[name=type]:checked").val();
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			
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
			
			$.ajax({
				type:"post",
				url:"/user/sign_in",
				data:{"type":type, "loginId":loginId, "password":password},
				success:function(data){
					if(data.result == "success"){
						alert("로그인 성공");
						location.href="/user/accounts/kidsinfo/list_view";
					}else{
						alert("아이디 또는 비밀번호를 확인해 주세요.");
					}
				},
				error:function(e){
					alert("error");
				}
			})
		});
	});
	
	
	</script>
</body>
</html>