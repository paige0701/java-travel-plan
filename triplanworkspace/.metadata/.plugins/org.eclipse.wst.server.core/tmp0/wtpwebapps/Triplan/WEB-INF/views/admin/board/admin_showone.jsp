<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="com.spring.model.MemberVO" %> 

<!-- #129. context path 알아오기 -->
<%
	String contxtPath = request.getContextPath(); 
%>


<style type="text/css">
	table, th, td, input, textarea { border: 1px solid gray; } 
	#table, #table2 {border-collapse: collapse; width: 600px;}
	#table th, #table td {padding: 5px;}
	#table th {width: 120px; background-color: #DDDDDD;} 
	
	.long {width: 470px;}
	.short {width: 120px;}
	a {text-decoration: none;}
	 	
</style>

<script type="text/javascript">
	function goWriteComment(parentSeq) {
		var comm = $("#sy_comment").val().trim();
		if(comm == "")
		{
			alert("댓글을 입력하세요.");
		}
		else {
			
			var content = document.getElementById("sy_comment").value;
			alert(content);
			alert(parentSeq);
			var form_data = { 
					
					parentSeq : parentSeq,
					content:content
		       };
		 
		 	 $.ajax({url: "/triplan/admin_writeComment.tp",
		    	 
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
				$("#comment").html(result);  			
				           
		      }// end of success----------------------
		  });// end of $.ajax();----------------------	
			
		}
	}
	
	function board() {
		
		$.ajax({
			
			url: "admin_list.tp",
			success: function(data){
			
				$("#yj_show").html(data);
			
			}
			
		})

	}

	
	function deleteOne(seq){
		
		
		var n = confirm("관리자 권한으로 "+seq +"번 게시글을 삭제하시겠습니까 ? ");
			if(n == true){
			
		 var form_data = { 
		            seq : seq
		       };
		 
		 	 $.ajax({url: "/triplan/admin_delete.tp",
		    	 
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
		   	  	$("#content").empty;
				$("#content").html(result);  			
				           
		      }// end of success----------------------
		  });// end of $.ajax();----------------------	
		
	}
}
	

	function writeReplyFrm(){
		
		var fk_seq = "${vo.seq}";
		 alert("fk_seq = " + fk_seq);
		var groupno = "${vo.groupno}";
		 alert("groupno = " + groupno);

		var depthno = "${vo.depthno}";
		 alert("depthno = " + depthno);

		var form_data = { 
		          
		            fk_seq : fk_seq,
		            groupno : groupno,
		            depthno : depthno
		       };
		 
		 	 $.ajax({url: "/triplan/admin_writeFrm.tp",
		    	 
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
		   	  	$("#content").empty;
				$("#content").html(result);  			
				           
		      }// end of success----------------------
		  });// end of $.ajax();----------------------	
		
	}
</script>

<div class="clear_d" style="width:70%; margin-left:3%">
<h2>묻고 답하기</h2>

	<table id="table">
		
		<c:if test="${empty vo}">그런거 없져</c:if>
		<c:if test="${not empty vo}">
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
		 </c:if>
	</table>

	<br/>
	
	<button type="button" onClick="board();">목록보기</button>
	<button type="button" onClick="writeReplyFrm()">답변글쓰기</button>
	<button type="button" onClick="deleteOne('${vo.seq}')" >삭제</button> 
	
	<p>
	
	
<div align="left" style="margin-left:10%">
    	
    	Userid : <input type="text" id="sy_userid" value=" admin" size="10"  readonly /><br/>
    	댓글  :  <input type="text" id="sy_comment"  name="content" size="50" style="margin-top:2%; margin-left:2%"/>
    
		<input type="button" value="쓰기" onClick="goWriteComment('${vo.seq}');" /> 
</div>   

    <br/>
    
    <!-- #73. 댓글 목록 보여주기 -->
    <div id="comment">
    <table id="table2">
    	<c:forEach var="commentVO" items="${commentList}">
			<tr>
				<td>${commentVO.userid}</td>
				<td>${commentVO.content}</td>
				<td>${commentVO.regDate}</td>
			</tr>    	
    	</c:forEach>
    </table>
    </div>
    </div>
    
    <br/><br/>
     




