<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.MemberVO" %> 

<jsp:include page="../top.jsp" />	

<style type="text/css">
	table, th, td, input, textarea { border: 1px solid gray; } 
	#table {border-collapse: collapse; width: 600px;}
	#table th, #table td {padding: 5px;}
	#table th {width: 120px; background-color: #DDDDDD;} 
	#table td {width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;}
	.clear_d {padding-top: 50px; padding-left: 250px; padding-bottom: 50px;}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".clear_d").css("min-height",($(window).height()-55)+"px");
	})
	function goWrite() {
		var subj = $("#sy_subject").val().trim();
		var cont = $("#sy_content").val().trim();
		var pass = $("#sy_pw").val().trim();
		if(subj == "")
		{
			alert("제목을 입력하세요.");
		}
		else if(cont == "") {
			alert("내용을 입력하세요.");
		}
		else if(pass == ""){
			alert("암호를 입력하세요.");
		}
		else{
			var writeFrm = document.writeFrm;
			writeFrm.submit();
		}
	}

</script>

<div class="clear_d">
	<h2>묻고 답하기</h2>
	
	<!-- 
	<form name="writeFrm" action="/board/addEnd.action" method="post"> 
	-->
	<!-- #112. 파일첨부하기. 위의 문장을 주석처리 한후 아래와 같이 한다. 
	           enctype="multipart/form-data" 을 해주어야만 파일첨부가 된다.  -->
	<form name="writeFrm" action="/triplan/boardAddEnd.tp" method="post" enctype="multipart/form-data"> 
	<table id="table">
		<tr>
			<th>USERID</th>
<% 
		MemberVO loginUser = (MemberVO)session.getAttribute("member");
%>
			<td><input type="text" name="userid" class="short" value="<%= loginUser.getUserid() %>" readonly /></td>   
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" id="sy_subject" name="subject" class="long" /></td>   
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="sy_content" name="content"  class="long" style="height: 200px;"></textarea></td>   
		</tr>
		
		<!-- #113. 파일첨부 타입 추가하기 -->
		<tr>
			<th>파일첨부</th>
			<td><input type="file" name="attach" /></td>
		</tr>
		
		<tr>
			<th>암호</th>
			<td><input type="password" id="sy_pw" name="pw" class="short" /></td>   
		</tr>
	</table>
	
	<br/>
	
	<!-- #100. 답변글인 경우 부모글의 seq값인 fk_seq 값과 
	                    부모글의 groupno 값과 부모글의 depthno 값을 
	           hidden 타입으로 보내주어야 한다. -->
	<input type="hidden" name="fk_seq" value="${fk_seq}" />           
	<input type="hidden" name="groupno" value="${groupno}" />
	<input type="hidden" name="depthno" value="${depthno}" />
	
	<input type="button" value=" 쓰기 " onClick="goWrite();"/>
	<input type="button" value=" 취소 " onClick="history.back();"/>
	
	</form>	
	
</div>
<jsp:include page="../foot.jsp" />



