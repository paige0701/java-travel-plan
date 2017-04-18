<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="com.spring.model.MemberVO" %> 

<!-- #129. context path 알아오기 -->
<%
	String contxtPath = request.getContextPath(); 
%>

<jsp:include page="../top.jsp" />

<style type="text/css">
	table, th, td, input, textarea { border: 1px solid gray; } 
	#table, #table2 {border-collapse: collapse; width: 600px;}
	#table th, #table td {padding: 5px;}
	#table th {width: 120px; background-color: #DDDDDD;} 
	#table td {width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;}
	a {text-decoration: none;}
	.clear_d {padding-top: 50px; padding-left: 250px; padding-bottom: 50px}
	 	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$(".clear_d").css("min-height",($(window).height()-55)+"px");
		
	})
	function goWrite() {
		var comm = $("#sy_comment").val().trim();
		if(comm == "")
		{
			alert("댓글을 입력하세요.");
		}
		else {
			
			var addWriteFrm = document.addWriteFrm;
			addWriteFrm.submit();
		}
	}
	
	/* function commDel() {
		var commDelFrm = document.commDelFrm;
		commDelFrm.submit();
	} */

</script>

<div class="clear_d">
<h2>묻고 답하기</h2>

	<table id="table">
		<tr>
			<th>글작성번호</th>
			<td>${vo.seq}</td>
		</tr>
		<tr>
			<th>USERID</th>
			<td>${vo.userid}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.content}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.readCount}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${vo.regDate}</td>
		</tr>
		
		<!-- #130. 첨부파일 이름 및 파일크기 보여주기 -->
		<tr>
			<th>첨부파일</th>
			<td>
				<a href="<%=contxtPath%>/boardDownload.tp?seq=${vo.seq}">
				  ${vo.orgFileName}
				</a>
			</td>
		</tr>
		<tr>
			<th>파일크기(bytes)</th>
			<td>${vo.fileSize}</td>
		</tr>
		
	</table>

	<br/>
	
	<button type="button" onClick="location.href='/triplan/boardList.tp';">목록보기</button>
<c:if test="${vo.userid != userid && userid != 'admin'}">
	<button type="button" disabled="disabled" >수정</button>
	<button type="button" disabled="disabled" >삭제</button> 
</c:if>	
<c:if test="${vo.userid == userid || userid == 'admin'}">
	<button type="button" onClick="location.href='/triplan/boardEdit.tp?seq=${vo.seq}';">수정</button>
	<button type="button" onClick="location.href='/triplan/boardDel.tp?seq=${vo.seq}';">삭제</button> 
</c:if>


	<!-- #98. 답변글쓰기 버튼 추가하기(현재 보고 있는 글이 작성하는 답변글의 원글[부모글]이 된다.) -->
	<button type="button" onClick="location.href='/triplan/boardAdd.tp?fk_seq=${vo.seq}&groupno=${vo.groupno}&depthno=${vo.depthno}';">답변글쓰기</button>
	
	<p>
	
	
   <!-- #61. 댓글쓰기 폼 추가 -->	
    <form name="addWriteFrm" action="/triplan/boardAddComment.tp" method="post">
    	USERID : <input type="text" name="userid" class="short" value="${userid}" readonly/><br/><br>
    	댓글 : <input type="text" id="sy_comment" name="content" class="long" />
    	
    	<!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모 글번호) -->
    	<input type="hidden" name="parentSeq" value="${vo.seq}" />
		<input type="button" value="쓰기" onClick="goWrite();" /> 
    </form>

    <br/>
    
    <!-- #73. 댓글 목록 보여주기 -->
    <table id="table2">
    	<c:forEach var="commentVO" items="${commentList}">
			<tr>
				<td>${commentVO.userid}</td>
				<td>${commentVO.content}</td>
				<td>${commentVO.regDate}</td>
				<c:if test="${commentVO.userid != userid && userid != 'admin'}">
				<td style="border: 0px;"><input type="button" disabled="disabled" value="삭제" style="width:100%;"/></td>
				</c:if>	
				<c:if test="${commentVO.userid == userid || userid == 'admin'}">
				<td style="border: 0px;"><input type="button" onClick="location.href='/triplan/boardCommentDel.tp?seq=${commentVO.seq}&parentSeq=${commentVO.parentSeq}';" value="삭제" style="width:100%;"	 /></td>
				</c:if> 
				
			</tr>  
			 	
    	</c:forEach>
    </table>
    </div>
      
<jsp:include page="../foot.jsp" />








