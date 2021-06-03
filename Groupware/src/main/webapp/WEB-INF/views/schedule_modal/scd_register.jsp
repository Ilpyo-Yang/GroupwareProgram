<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
	
	h2 {
		margin-bottom:30px;
	}
	
	#container {
		margin: 20px;
	}
	
	table {
		border-collapse: collapse;
		margin-top: 10px; 
	}
	
	td {
		padding: 10px 0;
	}

	#title {
		padding:0 20px 0 10px;
		font-weight: bold;
		border-right: 3px solid #8cb1d9;
		text-align:right;
	}
	
	#contents {
		padding-left:10px;
	}
	
	.btn {
		border: none;
		box-shadow: 2px 2px 2px gray;
		width: 70px;
		height:40px;
		border-radius: 2pt;
		cursor: pointer;
		font-size: 13pt;
		font-weight: bold;
	}
	
	#btnScdReg {
		background: #0099cc;
		color: white;
	}
	
	#btnScdReg:hover {
		border: solid 2px #0099cc;
		background: white;
		color: #0099cc;
	}
	
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$.datepicker.regional['ko'] = {
		        closeText: '닫기',
		        prevText: '이전달',
		        nextText: '다음달',
		        currentText: '오늘',
		        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		        '7월','8월','9월','10월','11월','12월'],
		        dayNames: ['일','월','화','수','목','금','토'],
		        dayNamesShort: ['일','월','화','수','목','금','토'],
		        dayNamesMin: ['일','월','화','수','목','금','토'],
		        weekHeader: 'Wk',
		        dateFormat: 'yy-mm-dd',
		        firstDay: 0,
		        isRTL: false,
		        showMonthAfterYear: true,
		        yearSuffix: '',
		        changeMonth: true,
		        changeYear: true,
		        showButtonPanel: true,
		        yearRange: 'c-99:c+99',
		    };
		    $.datepicker.setDefaults($.datepicker.regional['ko']);

		    $('#from').datepicker();
		    $('#from').datepicker("option", "maxDate", $("#to").val());
		    $('#from').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#to").datepicker( "option", "minDate", selectedDate );
		    });

		    $('#to').datepicker();
		    $('#to').datepicker("option", "minDate", $("#from").val());
		    $('#to').datepicker("option", "onClose", function ( selectedDate ) {
		        $("#from").datepicker( "option", "maxDate", selectedDate );
		    });
		
		    $("button#btnScdReg").click(function(){
		    	
		    	var frm = document.scdRegFrm;
			    frm.method = "POST";
			    frm.action = "<%=ctxPath%>/scdRegEnd.opis";
			    frm.submit();
		    });
		    
		    
		    
	});// end of $(document).ready(function(){}---------------------------------
	
	
	
	
</script>

<div id="container">
<h2>일정 등록하기</h2>

<form name="scdRegFrm">
	<table>
		<tr class="division schedule">
			<td id="title">일정 구분</td>
			<td id="contents">
				<input type="hidden" id="scdno" name="scdno" value="${requestScope.scdno}"/>
				<select name="fk_scdno2">
					<option>구분 선택</option>
					<c:if test="${sessionScope.loginuser.mbr_id eq 'admin'}">
						<option value="0">전체일정</option>
					</c:if>
					<option value="1">부서일정</option>
					<option value="2">개인일정</option>
				</select>
			</td>
		</tr>
		<tr class="subject schedule">
			<td id="title">제목</td>
			<td id="contents"><input type="text" name="scdsubject" id="subject" size="30" placeholder="제목을 입력하세요." autocomplete="off" required /></td>
		</tr>
		<tr class="date schedule">
			<td id="title">일자</td>
			<td id="contents">
				<label for="scdstartdate" id="start">시작일</label>
				<input type="text" id="from" name="scdstartdate" readonly required/>
				<span>&nbsp;~&nbsp;</span>
				<label for="scdenddate" id="end">종료일</label>
				<input type="text" id="to" name="scdenddate" readonly required/>
			</td>
		</tr>
		<tr class="time schedule">
			<td id="title">시간</td>
			<td id="contents">
				<select id="time1" name="scdstartTm">
				<c:forEach var="i" begin="9" end="18">
					<c:set var="startTm" value="${i>9?i:'0'}${i>9?'':i}"/>
					<option value="${i>9?i:'0'}${i>9?'':i}:00" <c:if test="${data.startDispTm eq startTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
				</c:forEach>
				</select>
				<span>&nbsp;부터</span>
				<select id="time2" name="scdendTm">
					<c:forEach var="i" begin="10" end="18">
						<c:set var="endTm" value="${i>9?i:'0'}${i>9?'':i}"/>
						<option value="${i>9?i:'0'}${i>9?'':i}:00" <c:if test="${data.endDispTm eq endTm}">selected</c:if>>${i>9?i:'0'}${i>9?'':i}:00</option>
					</c:forEach>
				</select>
				<span>&nbsp;까지&nbsp;</span>
			</td>
		</tr>
		<tr class="place schedule">
			<td id="title">장소</td>
			<td id="contents">
				<input type="text" name="place"/>
			</td>
		</tr>
		<tr class="attandance schedule">
			<td id="title">참석자</td>
			<td id="contents">
				<input type="hidden" name="fk_mbr_seq" value="${sessionScope.loginuser.mbr_seq}" /> 
				<input type="text" name="attendance"/>
				<button type="button" onclick="">주소록</button>
			</td>
		</tr>
	
	</table>

	<div style="float:right;">
		<button type="submit" id="btnScdReg" class="btn">등록</button>
		<button type="reset" class="btn">취소</button>
	</div>
	
</form>



</div>