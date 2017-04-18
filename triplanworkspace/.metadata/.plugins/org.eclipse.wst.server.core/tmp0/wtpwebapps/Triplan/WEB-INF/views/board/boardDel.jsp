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
	.clear_d {padding-top: 50px; padding-left: 250px; padding-bottom: 50px}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".clear_d").css("min-height",($(window).height()-55)+"px");
	})
	function goWrite() {
		var delFrm = document.delFrm;
		delFrm.submit();
	}

</script>


<div class="clear_d">
	<h4>글 삭제를 하시려면 암호입력후 삭제버튼을 눌러 주세요.</h4>
	<br/>
	<form name="delFrm" action="/triplan/boardDelEnd.tp" method="post">
	<input type="hidden" name="seq" value="${seq}" />
	<table id="table">
		<tr>
			<th>암호</th>
			<td><input type="password" name="pw" class="short" /></td>   
		</tr>
	</table>
	
	<br/>
	
	<input type="button" value=" 삭제 " onClick="goWrite();"/>
	<input type="button" value=" 취소 " onClick="history.back();"/>
	
	</form>	

</div>

<jsp:include page="../foot.jsp" />


