<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 스케줄 목록</title>
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
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<!-- 네비 -->
		<c:import url="/WEB-INF/jsp/include/menu.jsp" />
		<section class="d-flex justify-content-center align-items-top mt-3">
			<!-- 캘린더 -->
			<div id='calendar-container' class="mt-3">
			<div id='calendar'></div>
			</div>
			<!-- 모달 버튼(숨김) -->
			<input type="button" class="inputModal d-none" data-toggle="modal" data-target="#inputModal"></button>
			<!-- 모달 상세 -->
			<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title title-text" id="exampleModalLabel"><b>스케줄 입력</b></h5>
			        <button type="button" class="close title-text" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label title-text">반선택</label>
			            <select class="form-control" id="kidsClassInput">
			            	<option value="전체">전체</option>
			            	<option value="기쁨반">기쁨반</option>
			            	<option value="사랑반">사랑반</option>
			            	<option value="평화반">평화반</option>
			            </select>
			          </div>
			          <%-- <div class="form-group">
			            <label for="recipient-name" class="col-form-label title-text">시작날짜</label>
			            <input type="text" class="form-control" id="startInput" value="${start}">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label title-text">종료날짜</label>
			            <input type="text" class="form-control" id="endInput" value="날짜">
			          </div> --%>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label title-text">Title</label>
			            <input type="text" class="form-control" id="titleInput">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label title-text">Description</label>
			            <textarea class="form-control" id="descriptionInput"></textarea>
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-green" id="eventSaveBtn">저장</button>
			      </div>
			    </div>
			  </div>
			</div>
		</section>
		<!-- 풋터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	<script>
	$("document").ready(function(){
		
		$(function(){
			
			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '700px', // calendar 높이 설정
			expandRows: true, // 화면에 맞게 높이 재설정
			
			//slotMinTime: '08:00', // Day 캘린더에서 시작 시간
			//slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
			
			// 해더에 표시할 툴바
			headerToolbar: {
				left: 'title',
				center: '',
				right: 'dayGridMonth,listWeek today prev,next', //timeGridWeek,timeGridDay,
			},  
			initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
			editable: true, // 수정 가능?
			selectable: true, // 달력 일자 드래그 설정가능
			nowIndicator: true, // 현재 시간 마크
			dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			locale: 'ko', // 한국어 설정
			/* eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				console.log(obj);
			},
			eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				console.log(obj);
			},
			eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
				console.log(obj);
			},
			select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
			var title = prompt('Event Title');
			if (title) {
				calendar.addEvent({
					title: title,
					start: arg.start,
					end: arg.end,
					allDay: arg.allDay
				});
			} 
			
			calendar.unselect() //달력 선택 취소
			}, */
			
			//날짜 클릭 이벤트
			select: function(arg) {
				//날짜셀을 클릭하면 선생님만 모달창이 뜬다.
				if(${userType == "선생님"}){
					//모달을 클릭한다.
				 	$(".inputModal").click();	
					//저장 버튼 클릭
				 	$("#eventSaveBtn").on("click", function(){
						//객체 생성
						var start = arg.start.getFullYear() + "-" + arg.start.getMonth() + "-" + arg.start.getDate();
						var end = arg.end.getFullYear() + "-" + arg.end.getMonth() + "-" + arg.end.getDate();
						/* var startDate = $("#startInput").val();
						var endDate = $("#endInput").val();
						startDate = start;
						endDate = end; */
						
						var kidsClass = $("#kidsClassInput option:selected").val();
						var title = $("#titleInput").val();
						var description = $("#descriptionInput").val();
		
						//모달(eventSaveBtn)에 날짜를 주입한다.
						//$("#eventSaveBtn").data("start", start);
						
						var formData = new FormData();
						formData.append("start", start);
						formData.append("end", end);
						formData.append("kidsClass", kidsClass);
						formData.append("title", title);
						formData.append("description", description);
						
				 		$.ajax({
				 			type:"GET",
							url:"/schedule/create",
							data:formData,
							success:function(data){
								if(data.result == "success"){
									alert("스케줄 저장 성공");
								}else{
									alert("스케줄 저장 실패");
								}
							},
							error:function(e){
								alert("error");
							}
				 		});
					});
				 }
				
			},
			
			//DB에 일정을 저장한다.
			
			events: [
				{
					title:'소풍'
					, start:'2021-10-29'
				},
				{
					title:'요리'
					, start:'2021-10-29'
				}
				/* $.ajax({
					type:"GET",
					url:"/schedule/list",
					data:{"title"title, "start":start},
					success:function(data){
						if(data.result == "success"){
							
						}else{
							alert("스케줄 저장 실패");
						}
					},
					error:function(e){
						alert("error");
					}
				}); */
			]
			
			});
						
			// 캘린더 랜더링
			calendar.render();
		});
	});

	</script>
</body>

</html>