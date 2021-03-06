<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ohmykids - 투표상세</title>
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
			<div id="typeIsVote">
			<c:forEach var="voteWithComment" items="${voteWithCommentList }" varStatus="status">
			<!-- submenu-bar -->
			<div class="submenu-bar d-flex justify-content-top mt-3 w-100">
				<div class="d-flex justify-content-between align-items-center w-100">
					<!--  title -->
					<div class="mx-3 mt-2"><h5><b>공지 상세</b></h5></div> 
					<div class="d-flex justify-content-center align-items-center">
						<!-- 목록 버튼 -->
						<div class="mr-2"><a href="/notice/list_view" class="btn btn-yellow btn-sm"><b>목록으로</b></a></div>
						<!-- 수정 버튼 -->
						<c:if test="${voteWithComment.vote.userId eq userId }">
						<div class="mr-2"><button type="button" class="btn btn-info text-white btn-sm" id="updateVoteBtn" data-vote-id="${voteWithComment.vote.id }"><b>수정</b></button></div>
						<!-- 삭제 버튼 -->
						<div class="mr-3"><button type="button" class="btn btn-danger text-white btn-sm" id="deleteVoteBtn" data-vote-id="${voteWithComment.vote.id }"><b>삭제</b></button></div>
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
							<h4><b><i class="bi bi-person-square"></i> ${voteWithComment.vote.userName } ${voteWithComment.vote.userType }</b></h4>
						</div>
						<div class="w-35 d-flex justify-content-end align-items-center" id="createdAtInput">
						   	<h5><b><fmt:formatDate value="${voteWithComment.vote.createdAt }" pattern="yyyy-M-d(E)" /></b></h5>
						</div>
						<div class="w-15 d-flex justify-content-end align-items-center ml-3" id="createdAtInput">
							<c:choose>
									<c:when test="${voteWithComment.vote.weather eq '맑음' }">
										<img src="/static/images/sunny.png" width="35" height="35">
									</c:when>
									<c:when test="${voteWithComment.vote.weather eq '흐림' }">
										<img src="/static/images/cloud.png" width="35" height="35">
									</c:when>
									<c:when test="${voteWithComment.vote.weather eq '비' }">
										<img src="/static/images/rain.png" width="35" height="35">
									</c:when>
									<c:when test="${voteWithComment.vote.weather eq '눈' }">
										<img src="/static/images/snow.png" width="35" height="35">
									</c:when>
							</c:choose>
						</div>
				    </div>
				    <!-- /작성자 section -->
				    <!-- 공지 타입, 반선택 section -->
				    <div class="studentInfo-secton d-flex align-items-center py-4">
				    	<!-- 공지타입 -->
				    	<div class="w-50 d-flex ml-3 align-items-center h-75">
				    	<select class="form-control text-center btn-yellow" id="noticeTypeInput">
				    		<option value="${voteWithComment.vote.noticeType}">
					    		<c:if test="${voteWithComment.vote.noticeType eq 'vote'}">
					    			투표
					    		</c:if>
				    		 </option>
				    	</select>
				    	</div>
				    	<!-- 반정보 -->
				    	<div class="w-50 d-flex justify-content-center align-items-center title-text h-75 mx-3">
				    	<select class="form-control text-center" id="kidsClassInput">
				    		<option value="${voteWithComment.vote.kidsClass }">-- ${voteWithComment.vote.kidsClass } --</option>
				    		<c:forEach var="kid" items="${kidsClassList }" varStatus="state">
				    		<option value="${kid.kidsClass }" data-kids-class="${kid.kidsClass }">${kid.kidsClass }</option>
				    		</c:forEach>		
				    	</select>
				    	</div>
				    </div>
				    <!-- 공지 title -->
				    <div class="title-section d-flex  mt-1 py-2 px-3"> 
				    	<div class ="mt-2"><b>Title</b></div>
				    	<textarea class="form-control ml-2 mt-1 title-text border-0 font-weight-bold" id="titleInput"> ${voteWithComment.vote.title }</textarea>
				    </div>
				    <!-- 공지 section -->
				    <div class="note-section my-1">
					<!-- 공지 내용  -->
					<textarea id="descriptionInput" class="title-text pt-4 px-4 w-100 border-0" >${voteWithComment.vote.description }</textarea>
					<!-- /공지 내용-->
					<!-- 투표 box -->
					<div class="m-3 mb-5" id="selectVoteBox">
						
						<!-- 찬성 -->
						<div class="green-border title-text pt-2 d-flex justify-content-between">
							<c:choose>
							<c:when test = "${voteWithComment.agree }">
								<div><input type="radio" checked name="vote" class="vote-radio ml-3" id="agreeInput" value="agree" class="ml-3 mr-2" data-vote-id="${voteWithComment.vote.id }"><b> 찬성</b></div> 
							</c:when>
							<c:otherwise>
								<div><input type="radio" name="vote" class="vote-radio ml-3" id="agreeInput" value="agree" class="ml-3 mr-2" data-vote-id="${voteWithComment.vote.id }"><b> 찬성</b></div> 
							</c:otherwise>
							</c:choose>
							<div class="d-flex mr-3 mb-3">
								<div><i class="bi bi-person-fill title-text mb-3"></i></div>
								<div class="ml-1" id="agreeCount">${voteWithComment.agreeCount }</div>
								<div><small>명</small></div>
							</div>
						</div>
						
						<!-- 반대 -->
						<div class="green-border title-text pt-2 my-2 d-flex justify-content-between">
							<c:choose>
							<c:when test = "${voteWithComment.disagree }">
								<div><input type="radio" name="vote" checked class="vote-radio ml-3" id="disagreeInput" value="disagree" class="ml-3 mr-2" data-vote-id="${voteWithComment.vote.id }" ><b> 반대</b></div> 
							</c:when>
							<c:otherwise>
								<div><input type="radio" name="vote" class="vote-radio ml-3" id="disagreeInput" value="disagree" class="ml-3 mr-2" data-vote-id="${voteWithComment.vote.id }" ><b> 반대</b></div> 
							</c:otherwise>
							</c:choose>
							<div class="d-flex mr-3 mb-3">
								<div><i class="bi bi-person-fill title-text mb-3"></i></div>
								<div class="ml-1" id="disagreeCount">${voteWithComment.disagreeCount }</div>
								<div><small>명</small></div>
							</div>
						</div>
						<!-- 종료 -->
						<div class="title-text ml-2 d-flex align-items-center">
							<small class="w-25"><b>종료일자</b></small>
							<input type="text" class="form-control box w-75" value='<fmt:formatDate value="${voteWithComment.vote.endDate }" pattern="yyyy-MM-dd" />' id="endDateInput">
						</div>
					</div>
					<!-- /투표 box -->
					<!-- 댓글 -->
					<c:forEach var="comment" items="${voteWithComment.commentList}">
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
						<input type="text" class="form-control" placeholder="댓글을 입력하세요." id="commentInput-${voteWithComment.vote.id }">
						<button type="button" class="btn-green input-group-text" data-vote-id="${voteWithComment.vote.id }" id="commentSaveBtn">전송</button>
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
			
			//datepicker
			$("#endDateInput").datepicker({
				dateFormat:"yy-mm-dd"
				, showMonthAfterYear:true
				, yearRange: '1950:2030'
				, changeYear: true
				, changeMonth: true
				, monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
				, dayNamesMin: ['일','월','화','수','목','금','토']
			});
			
			//코멘트 입력
			$("#commentSaveBtn").on("click", function(){

				var targetId = $(this).data("vote-id"); //voteId
				var type = $("#TypeIsVote").val();
				type = "vote";
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
			$("#updateVoteBtn").on("click", function(){
				var postType = $("typeInput").val();
				postType = "notice";
				var voteId = $("#updateVoteBtn").data("vote-id");
				var kidsClass = $("#kidsClassInput option:selected").val();
				var noticeType = $("#noticeTypeInput option:selected").val();
				var weather = $("#weatherInput option:selected").val();
				var title = $("#titleInput").val();
				var description = $("#descriptionInput").val();
				var endDate = $("#endDateInput").val();
				
				var formData = new FormData();
				formData.append("postType", postType);
				formData.append("voteId", voteId);
				formData.append("kidsClass", kidsClass);
				formData.append("noticeType", noticeType);
				formData.append("weather", weather);
				formData.append("title", title);
				formData.append("description", description);
				formData.append("endDate", endDate);
				
				$.ajax({
					enctype:"multipart/form-data", //파일업로드 필수
					type:"POST",
					url:"/notice/vote/update",
					processData:false, //파일업로드 필수
					contentType: false, //파일업로드 필수
					data:formData, 
					success:function(data){
						if(data.result == "success"){
							alert("투표 수정완료");
							location.href="/notice/list_view";
						}else{
							alert("투표 수정실패");
						}
						
					},
					error:function(e){
						alert("error");
					}
				});
				
			});
			
			//투표 삭제
			$("#deleteVoteBtn").on("click",function(){
				var voteId = $("#updateVoteBtn").data("vote-id");
				var noticeType = $("#noticeTypeInput option:selected").val();
				
				$.ajax({
					type:"GET",
					url:"/notice/vote/delete",
					data:{"id": voteId, "noticeType":noticeType},
					success:function(data){
						if(data.result == "success"){
							alert("삭제성공");
							location.href="/notice/list_view";
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
			});
			
			//투표 찬/반 입력
			
			<!-- 종료일자 이내일때만-->
				//종료일자
				var endDate = $("#endDateInput").val();
				var endDateArr = endDate.split("-");
				
				//오늘
				var now = new Date();
				var today = now.format("yyyy-MM-dd");
				var todayArr = today.toString().split("-");
				
 				var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
				var todayArrCompare = new Date(todayArr[0], parseInt(todayArr[1])-1, todayArr[2]);
				
				//종료일자 경과
				if(endDateCompare.getTime() < todayArrCompare.getTime()) {
					
					$("input[name='vote']").attr('disabled', true);
					alert("투표 종료일자를 경과하여 투표를 할 수 없습니다. ");
					return;
					
					<!--종료일자 이내라면-->
					}else{
						<!--학부모만-->
						if(${userType eq "학부모"}){
							
							<!-- 투표를 했다면 = 찬성또는 반대에 checked가 되어있는 상태라면-->
							if($("input:radio[name='vote']").is(':checked')){
									$("input[name='vote']").attr('disabled', true);
								
							<!-- 투표를 안했다면-->
							}else{
								
							<!--라디어 클릭 펑션-->
							$(".vote-radio").on("click",function(e){
								e.preventDefault();
								var valueCheck = $(".vote-radio:checked").val();
								var voteId = $(".vote-radio:checked").data("vote-id");
			
										//체크된 값이 찬성일때
										if(valueCheck == "agree"){
											$.ajax({
												type: "GET",
												url: "/notice/vote/agree/create",
												data: {"voteId": voteId},
												success : function(data){
													if(data.agree == "success"){
													
														$("input:radio[name='vote']:radio[value='agree']").prop('checked', true); // 찬성선택하기
														$("input:radio[name='vote']:radio[value='disagree']").attr('disabled', true); // 반대하기 비활성화
														$("input:radio[name='vote']:radio[value='agree']").attr('disabled', true); // 찬성비활성화(찬성이 계속 선택되는것 방지)
														
													}else{
														alert("찬성 입력 실패");
													}
													$("#agreeCount").text(data.agreeCount);
												},
												error:function(e){
													alert("error");
												}
											});
										//체크된 값이 반대일때	
										}else{
											$.ajax({
												type: "GET",
												url: "/notice/vote/disagree/create",
												data: {"voteId": voteId},
												success : function(data){
													if(data.disagree == "success"){
													
														$("input:radio[name='vote']:radio[value='disagree']").prop('checked', true); // 반대선택하기
														$("input:radio[name='vote']:radio[value='agree']").attr('disabled', true); // 찬성하기 비활성화
														$("input:radio[name='vote']:radio[value='disagree']").attr('disabled', true); //반대하기 비활성화(반대가 게속 선택되는 것 방지)
													
													}else{
														alert("반대 입력 실패");
													}
													$("#disagreeCount").text(data.disagreeCount);
												},
												error:function(e){
													alert("error");
												}
											});
										}
										<!--/체크된 값이 반대일때	-->		
								});
								<!--/라디오 체크 펑션-->
									
								}
								<!--/투표를 안했다면-->	
							}
						   <!--/종료일자 이내라면-->
					}
					<!--/학부모 일때만-->	
				
			
	});
				
					
			
	
		
		
		Date.prototype.format = function (f) {
		    if (!this.valueOf()) return " ";
		    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
		    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
		    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
		    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
		    var d = this;

		    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
		        switch ($1) {
		            case "yyyy": return d.getFullYear(); // 년 (4자리)
		            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
		            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
		            case "dd": return d.getDate().zf(2); // 일 (2자리)
		            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
		            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
		            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
		            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
		            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
		            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
		            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
		            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
		            default: return $1;
		        }
		    });
		};

		String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
		String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
		Number.prototype.zf = function (len) { return this.toString().zf(len); };
		

		
	</script>
		
</body>
</html>