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
			<!-- /캘린더 -->
			
			<!-- 이벤트 입력 모달 버튼(숨김) -->
			<input type="button" class="inputModal d-none" data-toggle="modal" data-target="#inputModal"></button>
			<!-- /이벤트 입력 모달 버튼(숨김) -->
			
			
		</section>
		<!-- 풋터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />  
	</div>
	
			<!-- 이벤트 입력 모달 상세 -->
			<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title title-text" id="exampleModalLabel"><b>스케줄 입력</b></h5>
			        <button type="button" class="closeBtn close title-text" data-dismiss="modal" aria-label="Close" id="closeBtn">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label title-text">반선택</label>
			            <select class="form-control" id="kidsClassInput" name="kidsClassInput">
			            	<option value="전체">전체</option>
			            	<option value="기쁨반">기쁨반</option>
			            	<option value="사랑반">사랑반</option>
			            	<option value="평화반">평화반</option>
			            </select>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="col-form-label title-text">Title</label>
			            <input type="text" class="form-control" id="titleInput"  name="titleInput">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="col-form-label title-text">Description</label>
			            <textarea class="form-control" id="descriptionInput" name="descriptionInput"></textarea>
			          </div>
			          <c:if test="${userType eq '선생님' }">
			          <div class="form-group">
			            <label for="edit-color" class="col-form-label title-text">Schedule Color</label>
			              <select class="inputModal form-control" name="color" id="colorInput" name="colorInput"> 
	                          <option value="#D25565" style="color:#D25565;">빨간색</option>
	                          <option value="#9775fa" style="color:#9775fa;">보라색</option>
	                          <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
	                          <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
	                          <option value="#f06595" style="color:#f06595;">핑크색</option>
	                          <option value="#63e6be" style="color:#63e6be;">연두색</option>
	                          <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
	                          <option value="#4d638c" style="color:#4d638c;">남색</option>
                           </select>
			          </div>
			          </c:if>
			           <div class="form-group d-none">
			            <label for="recipient-name" class="col-form-label title-text">id</label>
			            <input type="text" class="form-control" id="idInput"  name="idInput">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="closeBtn btn btn-white border-success" id="closeBtn" data-dismiss="modal">닫기</button>
			        <c:if test="${userType eq '선생님' }">
		        		<button type="button" class="eventDeleteBtn btn btn-danger text-white" id="eventDeleteBtn">삭제</button>
			        	<button type="button" class="btn btn-green" id="eventSaveBtn">저장/수정</button>
			        </c:if>
			      </div>
			    </div>
			 </div>
			</div>
		    <!-- /이벤트 입력 모달 상세 -->
			 
		  	
	<script>
	$("document").ready(function(){
			
		$(function(){
			<!--캘린더 기본 셋팅-->
			// calendar element 취득
			var calendarEl = $('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
			height: '700px', // calendar 높이 설정
			expandRows: true, // 화면에 맞게 높이 재설정
			
			slotMinTime: '09:00', // Day 캘린더에서 시작 시간
			slotMaxTime: '18:00', // Day 캘린더에서 종료 시간
			
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
			firstDay: 1, //월요일이 먼저 오게
			locale: 'ko', // 한국어 설정
			<!--/캘린더 기본 셋팅-->
			
			<!--일정 생성-->
			select: function(event) {
				
				//날짜셀을 클릭하면 선생님만 모달창이 뜬다.
				if(${userType == "선생님"}){
					//모달을 클릭한다.
				 	$(".inputModal").click();	
					
					// 모달 창 닫기 버튼 클릭 시 내용 초기화
					$(".closeBtn").on("click", function(){
						$("#inputModal").find('form')[0].reset() //모달 클리어
						$("#eventSaveBtn").unbind() //저장 버튼에 기 선택된 날짜가 바인딩되지 않도록 함
					});
					
					calendar.unselect();//달력 선택 취소
					
					//저장 버튼 클릭
				 	$("#eventSaveBtn").on("click", function(){
						//객체 생성
						
						var kidsClass = $("#kidsClassInput option:selected").val();
						var title = $("#titleInput").val();
						var description = $("#descriptionInput").val();
						var start = event.start//.getFullYear() + "-" + arg.start.getMonth() + "-" + arg.start.getDate();
						var end = event.end//.getFullYear() + "-" + arg.end.getMonth() + "-" + arg.end.getDate();
						var color = $("#colorInput option:selected").val();
						
						if(title == null || title ==""){
							alert("스케줄 Title을 입력해 주세요.");
							return;
						}
						
						var formData = new FormData();
						formData.append("start", start);
						formData.append("end", end);
						formData.append("kidsClass", kidsClass);
						formData.append("title", title);
						formData.append("description", description);
						formData.append("color", color);
				
						
				 		$.ajax({
				 			type:"POST",
							url:"/schedule/create",
							processData:false,
							contentType:false,
							data:formData,
							success:function(data){
								if(data.result == "success"){
									location.reload();
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
			<!--/일정 생성-->
			
			<!--일정 목록 : DB에서 가져오기 -->
			events: [
				
				<!--생일정보 : 매년 반복 작업 필요-->
				<c:forEach var="kid" items="${kidsBirthList}">
				{
					id : ${kid.id},
					title : "♡ ${kid.kidsName} 생일 ♡",
					start : "<fmt:formatDate value="${kid.kidsBirth}" pattern="YYYY-MM-dd" timeZone = "KST"/>",
					end : "<fmt:formatDate value="${kid.kidsBirth}" pattern="YYYY-MM-dd" timeZone = "KST"/>",
					backgroundColor  : "#63e6be"
				},
				</c:forEach>
				<!-- 저장된 이벤트 정보-->
				<c:forEach var="plan" items="${scheduleList}">
				{
					id : ${plan.id},
					title : "${plan.title}",
					start : "<fmt:formatDate value="${plan.start}" pattern="YYYY-MM-dd" timeZone = "KST"/>",
					end : "<fmt:formatDate value="${plan.end}" pattern="YYYY-MM-dd" timeZone = "KST"/>",
					display : "${plan.kidsClass}", //반정보
					overlap : "${plan.description}",
					backgroundColor : "${plan.color}"

				},
				</c:forEach>
	
			],
			
			<!--/일정 목록 : DB에서 가져오기 -->
			
			<!--일정 상세 보기 -->
			eventClick: function(event, element){
			 		//모달 클릭
			
					$(".inputModal").click();
					$("#inputModal").find("#kidsClassInput").val(event.event.display); // kidsClass는 undefined로 event object에 있는것으로 대체 사용
					$("#inputModal").find("#titleInput").val(event.event.title);
					$("#inputModal").find("#colorInput").val(event.event.backgroundColor);
					$("#inputModal").find("#descriptionInput").val(event.event.overlap); // description는 undefined로 event object에 있는것으로 대체 사용
					$("#inputModal").find("#idInput").val(event.event.id); // event object의 id는 String으로 int로 변환 사용 필요
					
					<!--일정 수정 -->
					$("#eventSaveBtn").on("click",function(){
				
						//모달(eventUpdateBtn)에 날짜를 주입한다.
						//$(".eventSaveBtn").data("id", id);
						
						var idString = $("#idInput").val();
						var id = parseInt(idString);
						var kidsClass = $("#kidsClassInput option:selected").val();
						var title = $("#titleInput").val();
						var description = $("#descriptionInput").val();
						var color = $("#colorInput option:selected").val();
						var start = event.start//.getFullYear() + "-" + arg.start.getMonth() + "-" + arg.start.getDate();
						var end = event.end//.getFullYear() + "-" + arg.end.getMonth() + "-" + arg.end.getDate();
							
						var formData = new FormData();
						formData.append("id", id);
						formData.append("start", start);
						formData.append("end", end);
						formData.append("kidsClass", kidsClass);
						formData.append("title", title);
						formData.append("description", description);
						formData.append("color", color);
						
					
							$.ajax({
								type:"POST",
								url:"/schedule/update",
								processData:false,
								contentType:false,
								data:formData,
								success:function(data){
									if(data.result == "success"){
										$(".inputModal").hide();
										location.reload();
									}else{
										alert("일정 수정 실패");
									}
								},
								error:function(e){
									alert("error");
								}
								
							});
					});
					<!--/일정 수정 -->
					
					<!--일정 삭제 -->
					$("#eventDeleteBtn").on("click",function(){
				
						//var id = $(this).data("schedule-id");
						//모달(eventDeleteBtn)에 날짜를 주입한다.
						//$(".eventDeleteBtn").data("id", id);
						var idString = $("#idInput").val();
						var id = parseInt(idString);
						
							$.ajax({
								type:"GET",
								url:"/schedule/delete",
								data:{"id": id},
								success:function(data){
									if(data.result == "success"){
										location.reload();
									}else{
										alert("일정 삭제 실패");
									}
								},
								error:function(e){
									alert("error");
								}
								
							});
					});
					<!--일정 삭제 -->
					
			},
			<!--/일정 상세 보기 -->
			
			
			
			});
		
		<!-- 캘린더 랜더링 -->
			calendar.render();
		});
		
		//SELECT 색상 변경
		$("#colorInput").change(function(){
			$(this).css("color", $(this).val());
		});
		
		
	});

	</script>
</body>

</html>