<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../top.jsp" />

<style type="text/css">
	table, th, td, input, textarea { border: none; } 
	#table {border-collapse: collapse; width: 600px;}
	#table th, #table td {padding: 5px;}
	#table th {width: 120px; background-color: #DDDDDD;} 
	#table td {width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;}
	.clear_d {padding-top: 50px; padding-left: 250px; padding-bottom: 50px}
</style>

<script type="text/javascript">
	$(document).readt(function(){
		$(".clear_d").css("min-height",($(window).height()-55)+"px");
	})
	function goWrite() {
		var delFrm = document.delFrm;
		delFrm.submit();
	}

</script>


<div class="clear_d">
	<h4>댓글 삭제하기</h4>
	
	<form name="delFrm" action="/triplan/boardCommentDelEnd.tp" method="post">
	<input type="hidden" name="seq" value="${seq}" />
	<input type="hidden" name="parentSeq" value="${parentSeq}" />
	<table id="table">
		<tr>
			<td>댓글을 정말로 삭제하시겠습니까?</td>   
		</tr>
	</table>
	
	<br/>
	
	<input type="button" value=" 삭제 " onClick="goWrite();"/>
	<input type="button" value=" 취소 " onClick="history.back();"/>
	
	</form>	

</div>

<jsp:include page="../foot.jsp" />