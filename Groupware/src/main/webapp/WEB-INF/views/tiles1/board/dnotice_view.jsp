<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String ctxPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=ctxPath %>/resources/css/menu.css" />		

<style type="text/css">

 #dntc_content {
    width: 80%;
    margin: 50px 0 0 300px;
 }

 #table{
 	 margin-bottom: 30px;
 }
 
 #table td{
 	padding: 5px;
 }
 
 tr#title{
 	border-top: 3px solid black;
 	border-bottom: 1px solid lightgray;
 }
 
 div.prev_next{
 	margin-bottom: 1%; 
 	border-bottom: 1px solid lightgray; 
 	width:70%;
 }
 
 .move {cursor: pointer;}
 .moveColor {color: #660029; font-weight: bold;}
 
</style>

<jsp:include page="./board_sidebar.jsp" />
<script type="text/javascript">

	$(document).ready(function(){
		
		$("span.move").hover(function(){$(this).addClass("moveColor");},
							 function(){$(this).removeClass("moveColor");});	
		
	}); // end of $(document).ready(function(){})-----------------------------------------

	function goDelete(dnotice_seq){
		if(confirm("정말로 삭제하시겠습니까?")==true){
        	location.href="<%=ctxPath%>/dnotice_delEnd.opis?dnotice_seq="+dnotice_seq;
    	}
	}
</script>

<div style="width: 1460px;">
	
	<!-- 게시판제목 -->
	<div style="padding: 15px; font-size: 25px; font-weight: 600; height: 60px; width: 100%; background-color: #f2f2f2; color: #555;">
	&nbsp;&nbsp;부서 공지사항
	</div>
	
	<!-- 글내용 -->
	<div id="dntc_content">
	   	<c:if test="${not empty requestScope.dnoticevo}">
	   	 <table id="table">
	         <tr id="title">
	            <td style="width: 800px;"><h3>${requestScope.dnoticevo.dtitle}</h3></td>
	            <td style="width: 200px;">${requestScope.dnoticevo.dwritedate}</td>
	            <td style="width: 100px;">조회&nbsp;${requestScope.dnoticevo.dhit}</td>
	         </tr>
	         <tr>
	            <td colspan="3" style="height: 400px; border-bottom: 1px solid black;">
	            	<p style="word-break: break-all;">${requestScope.dnoticevo.dcontent}</p>
	            </td>
	         </tr>
	   	 </table>
	   	 
	   	 <!-- 이전글, 다음글 -->
	   	 <div class="prev_next">이전글&nbsp;&nbsp;&nbsp;<span class="move" onclick="javascript:location.href='dnotice_view.opis?dnotice_seq=${requestScope.dnoticevo.previousseq}'">${requestScope.dnoticevo.previoustitle}</span></div>
	   	 <div class="prev_next">다음글&nbsp;&nbsp;&nbsp;<span class="move" onclick="javascript:location.href='dnotice_view.opis?dnotice_seq=${requestScope.dnoticevo.nextseq}'">${requestScope.dnoticevo.nexttitle}</span></div>   	 
	   	 
	   </c:if>
	   
	   <c:if test="${empty requestScope.dnoticevo}">   		
	      <div style="padding: 50px 0; font-size: 16pt; color: red;">존재하지 않습니다</div>
	   </c:if>
   
	   <c:if test="${empty requestScope.dnoticevo}">   		
	      <div style="padding: 50px 0; font-size: 16pt; color: red;">존재하지 않습니다</div>
	   </c:if>
   
	   <button type="button" onclick="javascript:location.href='<%=ctxPath%>/dnotice_list.opis'">전체목록보기</button>
	   <button type="button" onclick="javascript:location.href='<%=ctxPath%>/dnotice_edit.opis?dnotice_seq=${requestScope.dnoticevo.dnotice_seq}'">수정</button>
	   <button type="button" onclick="goDelete(${requestScope.dnoticevo.dnotice_seq})">삭제</button>
   
   </div>
</div>