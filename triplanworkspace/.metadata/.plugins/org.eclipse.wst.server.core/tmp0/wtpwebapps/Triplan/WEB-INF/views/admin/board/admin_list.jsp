<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script type="text/javascript">

function showOne(seq){
	
	 var form_data = { 
	            seq : seq,
	            groupno:"${vo.groupno}",
	            fk_seq : "${vo.fk_seq}",
	            depthno : "${vo.depthno}"
	            
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

function writeOne(){

	alert("dd");
	
	$.ajax({url: "/triplan/admin_writeFrm.tp",
	  type: "GET",
     dataType: "html", 
     success: function(data){
  	  var result = data;
  	   
  	  	$("#content").empty;
		$("#content").html(result);  			
		           
     }// end of success----------------------
 });// end of $.ajax();----------------------	
	
}

function previousTen(start,end){
	
	if(start != 1 ){
	start = parseInt(start) - 10 ;
	end = parseInt(end) - 10;
	
	
	var form_data = { 
			 start : start,
			 end : end
			 
	       };
	 
	 	 $.ajax({url: "/triplan/admin_paginglist.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here").empty;
			$("#here").html(result);  			
			           
	      }// end of success----------------------
	     
	  });// end of $.ajax();----------------------	
	} else if(start == 1){
		 
	    	  alert("전 페이지가 없습니다.");
	    	  return;
	   
		
	}
}

function nextTen(start,end){
	
	//alert("돼냐...");
	//alert(start);
	//alert(end);
	
	//alert("${totalCount}");
	var total = "${totalCount}";
	//alert(end);
	
	
	if((end > total) || (end == total)){
	
		alert("다음페이지가 없습니다");
		return;
	}
	var start = parseInt(start) + 10;
	var end = parseInt(end) + 10;
	
	//alert("=========");
	//alert(start);
	//alert(end);
	
	
	var form_data = { 
			start:start,
			end:end
			 
	       };
	 
	 	 $.ajax({url: "/triplan/admin_paginglist.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here").empty;
			$("#here").html(result);  			
			           
	      }// end of success----------------------
	      
	  });// end of $.ajax();----------------------	
	}


</script>


	
<div align="center" style="margin-top: 50px; width:70%; margin-left:15%" id="content">
	
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
	<div id="here">
		<table id="table" style="width:70%">
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
					
						<img src="/triplan/resources/images/disk.gif" border="0">
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
	
<ul class="pager" style="width:70%">
    <li class="previous"><a href="#previous" onClick="previousTen('${start}','${end}')">Previous</a></li>
    <li class="next"><a href="#next" onClick="nextTen('${start}','${end}')">Next</a></li>
  </ul>
	</div>
	<hr>
	<button type="button" onClick="board();" class="btn btn-success">목록보기</button>
	<button type="button" onClick="writeOne();" class="btn btn-info">글쓰기</button>
	<hr>
	<br/>
	</div>
