<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/workmanage.css" />    

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="./workmanage_sidebar.jsp" />

<style type="text/css">
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#datepicker_deadline").datepicker({
			showOn : "button",
			buttonImage : "<%=request.getContextPath()%>/resources/images/icon_calendar.png",
			buttonImageOnly : true,
			buttonText : "Select date"
		});

		var checkRadio = $("input[name=workType]:checked");
		onlyWorkInput(checkRadio);
		
	});
	
	// == 업무 요청, 업무 보고 일 경우에만 담당자, 참조자  input 보여주기 == //
	function onlyWorkInput(item) {
		var checkVal = $(item).val();
		
		if (checkVal == 0) {
			$("tr.onlyWorkInput").hide();
		} 
		else {
			$("tr.onlyWorkInput").show();
		}
	}
	
	function checkStar() {
		
	}
	
	
	function submitWorkRegFrm() {
		var frm = document.workRegFrm;
		
		frm.action = "";
		frm.method = "post";
		frm.submit();
	}
</script>

<div class="container workcontainer">
	<h3>업무 등록</h3>
	
	<br>
	
	<form id="workRegFrm">
		<table class="table table-striped workRegtable">
			<tbody>
				<tr>
					<td style="width: 10%;"><span class="star">*</span>제목</td>
					<td style="width: 70%;"><input name="subject"/></td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무형태</td>
					<td>
						<input type="radio" id="mytodo" value="0" name="workType" onclick="onlyWorkInput(this);" checked="checked"/> 
						<label for="mytodo">나의 할일</label> 
							
						<input type="radio" id="workRequest" value="1" name="workType" onclick="onlyWorkInput(this);"/> 
						<label for="workRequest">업무 요청</label>
	
						<input type="radio" id="workReport" value="2" name="workType" onclick="onlyWorkInput(this);"/>
						<label for="workReport">업무 보고</label>
					</td>
				</tr>
				<tr>
					<td><span class="star">*</span>업무기한</td>
					<td><input type="text" name="deadline" id="datepicker_deadline" /></td>
				</tr>
				
				<tr class="onlyWorkInput">
					<td><span class="star">*</span>담당자</td>
					<td><input name="manager" placeholder="사용자" /></td>
				</tr>
				<tr class="onlyWorkInput">
					<td>참조자</td>
					<td><input name="referrer" placeholder="사용자" /></td>
				</tr>
			
				<tr>
					<td>파일 업로드</td>
					<td><button name="addfile" type="button">파일추가</button></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" cols="60" rows="10"></textarea></td>
				</tr>
				<tr id="workRegBtn">
					<td colspan="2">
						<button type="button" onclick="submitWorkRegFrm()">저장</button>
						<button type="button" >취소</button>
					</td>
				</tr>
			</tbody>
		</table>	
	</form>
</div>