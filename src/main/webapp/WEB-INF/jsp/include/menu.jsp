<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

		<nav class="navbar navbar-expand-lg nav-tabs">
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="nav nav-fill">
		      <!-- 자녀관리 -->
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle title-text" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          <c:choose>
			          	<c:when test="${userType eq '선생님'}">My students 관리</c:when>
			          	<c:otherwise>My Kids 관리</c:otherwise>
		          	</c:choose>
		        </a>
		        <!-- 자녀관리 submenu dropdown-->
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <c:if test="${userType eq '학부모' }">
		          <a class="dropdown-item title-text" href="/kidsinfo/create_view">자녀정보등록</a>
		          <div class="dropdown-divider"></div>
		          </c:if>
		          <c:choose>
			          <c:when test="${userType eq '선생님'}">
		          		<a class="dropdown-item title-text" href="/kidsinfo/studentsinfo/list_view">학생목록</a>
		          	  </c:when>
		          	  <c:otherwise>
		          	  	<a class="dropdown-item title-text" href="/kidsinfo/list_view">자녀목록</a>
		          	  </c:otherwise>
		          	</c:choose>
		        </div>
		        <!-- /자녀관리 submenu dropdown-->
		      </li>
		      <!-- /자녀관리 -->
		   	  <!-- 알림장 -->
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle title-text" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          알림장
		        </a>
		        <!-- 알림장 submenu dropdown-->
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item title-text" href="/note/create_view">알림장작성</a>
		          <div class="dropdown-divider"></div>
		          <a class="dropdown-item title-text" href="/note/list_view">알림장목록</a>
		        </div>
		        <!-- /알림장 submenu dropdown-->
		      </li>
		      <!-- /알림장 -->
		      <!-- 앨범 -->
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle title-text" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          앨범
		        </a>
		        <!-- 앨범 submenu dropdown-->
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <c:if test="${userType eq '선생님' }">
		          <a class="dropdown-item title-text" href="/album/create_view">앨범작성</a>
		          <div class="dropdown-divider"></div>
		          </c:if>
		          <a class="dropdown-item title-text" href="/album/list_view">앨범목록</a>
		        </div>
		        <!-- /앨범 submenu dropdown-->
		      </li>
		      <!-- /앨범 -->
		      <!-- 공지 -->
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle title-text" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          공지
		        </a>
		        <!-- 공지 submenu dropdown-->
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <c:if test="${userType eq '선생님' }">
		          <a class="dropdown-item title-text" href="/notice/create_view">공지작성</a>
		          <div class="dropdown-divider"></div>
		          </c:if>
		          <a class="dropdown-item title-text" href="/notice/list_view">공지목록</a>
		        </div>
		        <!-- /공지 submenu dropdown-->
		      </li>
		      <!-- /공지 -->
		      <!-- 스케줄 -->
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle title-text" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          스케줄
		        </a>
		        <!-- 스케줄 submenu dropdown-->
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item title-text" href="/schedule/list_view">스케줄목록</a>
		        </div>
		        <!-- /스케줄 submenu dropdown-->
		      </li>
		      <!-- /스케줄 -->
		    </ul>
		   </div>
		</nav>