<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(function(){
	
	
	if($("#searchWord").val != null){
		$("#searchWord").val("${searchWord}");
		
		
	}
	
	
	
});



function showOne(seq){
	
	 var form_data = { 
	            seq : seq
	       };
	 
	 	 $.ajax({url: "/triplan/admin_showone.tp",
	    	 
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


function board() {
	
	$.ajax({
		
		url: "admin_list.tp",
		success: function(data){
		
			$("#yj_show").html(data);
		
		}
		
	})

}

function searchBoard(){
	
	var searchWord = document.getElementById("searchWord").value;
	alert(searchWord);
	var colName= document.getElementById("colName").value;
	alert(colName);
	
	 var form_data = { 
			 searchWord : searchWord,
			 colName:colName
			 
	       };
	 
	 	 $.ajax({url: "/triplan/admin_searchlist.tp",
	    	 
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


	
<div align="center" style="margin-top: 50px; width:70%;" id="content">
	
		<h2>묻고 답하기 </h2>		
 	  				
 	  				  			
	<p>
	<select name="colName" id="colName" >
		<option value="subject">제목</option>
		<option value="content">내용</option>
		<option value="userid">userid</option>
	</select>
	<input type="text" name="searchWord" id="searchWord" size="20">
	
	<button type="button" onClick="searchBoard();">검색</button>
	<hr>
	<p>	 

		<table id="table">
			<tr>
				<th style="width:50px;">번호</th>
			<th style="width:320px;">제목</th>
			<th style="width:70px;">USERID</th>
			<th style="width:180px;">날짜</th>
			<th style="width:70px;">조회수</th>
			<!-- #123. 파일과 크기를 보여주도록 수정한다. -->
			<th style="width:70px;">파일</th>
			<th style="width:100px;">크기(bytes)</th>
		</tr>
		
		<!-- #21. BoardController 에서 보내온 결과물의 키값인 list 를 
		          JSTL을 사용하여 출력한다. -->
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.seq}</td>
				<c:if test="${vo.depthno > 0}">		
				<td>
				<span style="color: red; padding-left: ${vo.depthno * 20}px;">
				re:
				</span>
				<a href="javascript:showOne('${vo.seq }')">${vo.subject}</a>
				</td></c:if>	
				<c:if test="${vo.depthno == 0}">
				<td><a href="javascript:showOne('${vo.seq }')">${vo.subject}</a></td>
				</c:if>
				<td>${vo.userid}</td>
				<td>${vo.regDate}</td>
				<td align="center">${vo.readCount}</td>
				
				<!-- 
				#126. 첨부파일 여부 표시하기 그리고 첨부파일을 다운로드 할 수 있도록 URL 링크 걸어주기
				먼저 /webapp/resources/images 라는 폴더를 생성한다.
				images 폴더 아래에 disk.gif 라는 이미지파일을 저장한후 아래와 같이 한다. -->
				<td align="center">
				<c:if test="${not empty vo.fileName}">
					<a href="/triplan/download.tp?seq=${vo.seq}">
						<img src="/triplan/resources/images/disk.gif" border="0">
					</a>
				</c:if>	 
				</td>
				
				<td align="center"> 
				<c:if test="${not empty vo.fileName}">
					${vo.fileSize} <!-- 파일크기 -->
				</c:if>	
				</td>
				
			</tr>
		</c:forEach>
		
	</table>
	<ul class="pager" style="width:100%">
    <li class="previous"><a href="#previous" onClick="previousTen()">Previous</a></li>
    <li class="next"><a href="#next" onClick="nextTen()">Next</a></li>
  </ul>
	
	<hr>
	<button type="button" onClick="board();">목록보기</button>
	<br/>
	</div>
	</div>
	