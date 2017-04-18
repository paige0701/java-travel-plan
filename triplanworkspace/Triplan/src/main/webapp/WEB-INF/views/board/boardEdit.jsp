<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	//	}
	//	else if(pass == ""){
	//		alert("암호를 입력하세요."); 
		}
		else{
			var editFrm = document.editFrm;
			editFrm.submit();
		}
	}

</script>

<div class="clear_d">
	<h2>글 수정하기</h2>
	
	<form name="editFrm" action="/triplan/boardEditEnd.tp" method="post">
	<input type="hidden" name="seq" value="${vo.seq}" />
	<table id="table">
		<tr>
			<th>USERID</th>
			<td><input type="text" name="userid" value="${vo.userid}" readonly class="short" /></td>   
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" id="sy_subject" name="subject" value="${vo.subject}" class="long" /></td>   
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="sy_content" name="content" class="long" style="height: 200px;">${vo.content}</textarea></td>   
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" id="sy_pw" name="pw" class="short" /></td>   
		</tr>
	</table>
	
	<br/>
	
	<input type="button" value=" 완료 " onClick="goWrite();"/>
	<input type="button" value=" 취소 " onClick="history.back();"/>
	
	</form>	
</div>

<jsp:include page="../foot.jsp" />




