<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<header>
			<div class="rainbow"></div>
			<div class="d-flex justify-content-between mx-3">
				<div class="d-flex title-text">
					<img class="mt-3" width="50px" height="50px" src="/static/images/baby_girl.png">
					<h2 class="mx-2 mt-3">Oh My Kids</h2>
					<img class="mt-3" width="50px" height="50px" src="/static/images/baby_boy.png">
				</div>
				<c:choose>
					<c:when test="${not empty userName }">
						<div class="mt-4 title-text"><b>${userName }님</b> <a href="/user/sign_out" class="title-text">Log-out</a></div>
					</c:when>
					<c:otherwise>
						<div class="mt-4 title-text"> <a href="/user/signin_view" class="title-text"><b>Log-in</b></a></div>
					</c:otherwise>
				</c:choose>
			</div>
	</header>