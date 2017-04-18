<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- #125. context path 알아오기 -->
<%
	String contxtPath = request.getContextPath(); 
%>

<jsp:include page="../top.jsp" />

<style type="text/css">
	table, th, td, input, textarea { border: 1px solid gray; }
	 
	/* #124. 테이블의 가로 폭 늘이기 */
	#table {border-collapse: collapse; /* width: 700px; */ width: 870px;}
	#table th, #table td {padding: 5px;}
	#table th {background-color: #DDDDDD;} 
	#table td {}
	a{text-decoration: none;
	  color:blue;}
	.clear_d {
	 	padding-top: 50px; padding-left: 250px;
	}
   
   /* #133. Ajax(검색어 입력시 검색단어 자동완성하기)관련 추가하기 2 */
   #displayList a {color: #0000FF;}
   #table2 {border-collapse: collapse;  width: 600px;}
   
</style>

<!-- #134. Ajax(검색어 입력시 검색단어 자동완성하기)관련 추가하기 3 -->
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>

<script type="text/javascript">
	function goSearch() {
		var searchFrm = document.searchFrm;
		
		var search = document.getElementById("search").value; 
		
		if(search == null || search.trim() == "") {
			alert("검색어를 입력하세요!!");
		}
		else {
			searchFrm.submit();
		}
	}

	
	// #60. 검색조건에 따른 글목록 조회시 
	//      검색컬럼 및 검색어가 그대로 유지되게끔 해주어야 한다.
	function searchKeep() {
		<c:if test="${not empty column && not empty search}">
			document.getElementById("column").value = "${column}";
			document.getElementById("search").value = "${search}";
		</c:if>
	}
	
	
	window.onload = function(){
		searchKeep();
	}
	
	
  /* #135. Ajax(검색어 입력시 검색단어 자동완성하기)관련 추가하기 4 */
  $(document).ready(function(){
	  
	  $("#displayList").hide();
	  $(".clear_d").css("min-height",($(window).height()-55)+"px");
	  
	  $("#search").keyup(function(){
		  
		  var form_data = { 
				            column : $("#column").val(),   // 키값 : 밸류값
				            search : $("#search").val()    // 키값 : 밸류값
		                  };
		
		  $.ajax({url: "/triplan/boardWordSearchShow.tp",
		      type: "POST",
		      data: form_data, // 서버로 보내는 ajax 요청 데이터
		      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
		      success: function(data){ // success ==> 서버로 부터 ajax 요청이 성공적으로 수행되었다는 응답을 받은 후 수행해야할 처리내용을 기술하는 콜백함수이다. 
		    	             // data ==> ajax 요청에 의해 서버로 부터 리턴받은 데이터.
		    	             
		   /* === #144. Ajax(검색어 입력시 검색단어 자동완성하기)관련 === */
		   
		    	       var resultText = data;
		    //	       alert("확인용 : "+resultText);
		    	       /* data는  /board/wordSearchShow.action 에서 
		    	                  응답해준 결과물로서 그 형태는 아래처럼 띌것이다. 
		    	                  문자열갯수|문자열1,문자열2,문자열3  의 형태가 된다.
		    	                  예> 3|한석규,한경규,한미자    
		   	           */
		    	       var resultArr = resultText.split('|'); 
		    	       // | 을 기준으로 분할하여 문자열 배열변수에 저장한다.
		    	       // 즉, resultArr[0] 에는 문자열갯수가 들어가고,
		    	       // resultArr[1] 에는 | 다음의 문자열들이 들어간다.
		    	       // 예> resultText 가 3|한석규,한경규,한미자   이라면
		    	       // resultArr[0] 에는 3 이 들어가고,
		    	       // resultArr[1] 에는 한석규,한경규,한미자 들어간다.
		    	       var count = parseInt(resultArr[0]);
		    	       // 문자열로 되어진 결과물의 갯수를 실제 숫자 타입인 int 타입으로
		    	       // 변환해서 count 변수에 저장함.
		    //	       alert("확인용 : "+count);
		    	       
		    	       if(count > 0) { // 검색된 데이터가 존재할 경우
		    	    	   var wordArr = resultArr[1].split(',');
		    	           // , 를 구분자로 쪼개어 문자열 배열로 생성함.
		    	        
		    	           var resultHtml = "";
		    	           for(var i=0; i<wordArr.length; i++) {
		    //	        	   alert("확인용 : "+wordArr[i]);   
		    	        	
		    				   resultHtml += "<a href='javascript:wordChoice(\""+wordArr[i]+"\")'><span style='color:red; font-weight:bold;'>"+ $("#search").val() +"</span>"+ wordArr[i].substring( $("#search").val().length,  wordArr[i].length ) +"</a><br/>"; 
		    	        	   // 검색어만 글자의 굵기를 굵게, 글자색깔은 빨강색으로 하려고 한다.
		    	        	   
		    	           }// end of for------------------------
		    	           
		   // 	           alert("확인용 : "+resultHtml);    
		    	           
		    	           $("#displayList").html(resultHtml);
		    	           $("#displayList").show();
		    	           
		    	       }
		    	       else { // 검색된 데이터가 존재하지 않을 경우
		    	    	   $("#displayList").hide();
		    	       }
		    	             
		      }// end of success----------------------
	  	  });// end of $.ajax();----------------------
		  
	  }); // end of $("#search").keyup();-------------
	  
  });// end of $(document).ready();-------------------
  
  
  function wordChoice(search) {
	  $("#search").val(search);
	  $("#displayList").hide();
  }

  
	/* ===== #147. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 3) ======= */
	function rankN() {
		// alert("rankN 확인용");
		
		/*
			jQuery 에서 JSON 형태의 데이터를 처리해주는 전용메소드가 getJSON 메소드이다.
			사용방법은 아래와 같다.
		
			     $.getJSON("데이터를 가져올 URL명", function(data){	} );
					
			위의것은 아래 내용의 단축한 것이다.

			$.ajax({
			   	  	 url: "데이터를 가져올 URL명",
			   	   //data: json,   // 서버로 보내는 ajax 요청 데이터
			   	   	 dataType: "json",
		    	     success: function(data){
					    		  
		    		 }
		          });
		 */
		var rank = parseInt( $("#rankSelect").val() );
		
		if(rank==0) {
			$("#displayRankN").empty();
		} 
		else if(rank==5 || rank==10) {
	 
			 $.ajax({
					 url: "/triplan/listRankN.tp",
					 type: "GET",
					 data: "rankN="+$("#rankSelect").val(),  // 전송해야할 데이터
					  // 전송방식이 get 이든 post 이든 
					  // listRankN.action?rankN=5 처럼 보내게 된다.
					  // !!! 그리고 중요한 것은 !!! 
					  // ajax 를 이용한 전송 방식에는 url, data 가 구분되어져 있으므로 
					  // 구분자인 ? 가 필요없다는 것이다!!!!.
					  // GET 방식에서 ? 의 기능은 
					  // WAS(톰캣서버)가 어디까지가 응용프로그램 주소이고 어디부터가 데이터인지 구분하기 위한 구분자로 사용되는 것이다. 	
					  // 즉, 키1=값1&키2=값2&키3=값3 으로 반복된다.	
					 dataType: "json", 
					 success: function(data) {  // 데이터 전송이 성공적으로 이루어진 후 처리해줄 callback 함수
							        // data => ajax 요청에 의해 서버로 부터 리턴받은 데이터.
							        
					 //////////  ===== #152. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 8) ======= /////////////
					 //     alert("확인용 : 성공");
							$("#displayRankN").empty(); // <div id="displayRankN"> 엘리먼트를 모두 비워서 새 데이터를 채울 준비를 한다.
							
							// $.each() 함수는 $(selector).each()와는 다르다.
							// $.each(순회해야할 collection 또는 배열, callback(indexInArray, valueOfElement) );
							// 배열을 다루는 경우에는, 콜백 함수는 인덱스와 값을 인자로 갖는다.
							// 만약 map 형태의 집합을 다루게 되면 key와 value의 쌍으로 동작한다.
							
							var resultHtml = "<table id='table2'>";
							    resultHtml += "<tr>";
							    resultHtml += "<th>글번호</th>";
							    resultHtml += "<th>제목</th>";
							    resultHtml += "<th>USERID</th>";
							    resultHtml += "<th>날짜</th>";
							    resultHtml += "<th>조회수</th>";
							    resultHtml += "</tr>";
								
							$.each(data, function(entryIndex, entry){  
											resultHtml += "<tr>";
											resultHtml += "<td>" + entry.seq +"</td>";        // entry.키값
											resultHtml += "<td>" + entry.subject +"</td>";    // entry.키값
											resultHtml += "<td>" + entry.userid +"</td>";       // entry.키값
											resultHtml += "<td>" + entry.regDate +"</td>";    // entry.키값
											resultHtml += "<td>" + entry.readCount +"</td>";  // entry.키값
											resultHtml += "</tr>";
							});
							
							resultHtml += "</table>";
							
							$("#displayRankN").html(resultHtml);
						}
			 });
		 
		}// end of if ----------------------------------------
	 
	 }// end of function rankN() ------------------------------
  
	
</script>


<div class="clear_d">
<h2>묻고 답하기</h2>

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
				
				<!-- #107. 답변글인 경우 제목 앞에 공백(여백)과 함께 RE 라는 글자를 붙이도록 한다. -->
				<c:if test="${vo.depthno > 0}">
					<!-- #22. 글제목에 클릭을 하면 해당글을 보여주게끔 링크를 건다. -->
					<td>
						<span style="color: red; padding-left: ${vo.depthno * 20}px;">
						re:
						</span>
						<a href="/triplan/boardView.tp?seq=${vo.seq}">${vo.subject}</a>
					</td>	
				</c:if>
				
				<c:if test="${vo.depthno == 0}">
					<!-- #22. 글제목에 클릭을 하면 해당글을 보여주게끔 링크를 건다. -->
					<td><a href="/triplan/boardView.tp?seq=${vo.seq}">${vo.subject}</a></td>	
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
					<a href="<%=contxtPath %>/boardDownload.tp?seq=${vo.seq}">
						<img src="<%=contxtPath %>/resources/images/disk.gif" border="0">
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
	<br/>
	
	<!-- #87. 페이지바 보여주기 -->
	<div align="center" style="width: 400px; margin-left: 100px; margin-right: auto;">
		${pagebar}
	</div>
	<br/>
	
	
	<!-- #53. 검색 폼 추가 : 제목, 내용, 이름을 검색하도록 한다. -->
	<!-- select 태그로 만드는데 option 의 value 값은 
	     tblBoard 테이블에 있는 컬럼명(subject, content, name)
	         으로 해야 한다. -->
	<form name="searchFrm" action="/triplan/boardList.tp" method="get" style="display:inline;">
		<select name="column" id="column">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="userid">USERID</option>
		</select>
		<input type="text" name="search" id="search" size="40px"/>
		<input type="button" value="검색" onClick="goSearch();" />
	</form>
	
	<!-- ======= #145. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 1) ======= -->
	&nbsp;&nbsp;
	<!-- rankFrm 막기 -->
	<!--<form name="rankFrm" id="rankFrm" method="get" style="display:inline;">
		<select name="rankSelect" id="rankSelect">
			<option value="0">조회등수</option>
			<option value="5">상위5개</option>
			<option value="10">상위10개</option>
		</select>
		<input type="button" value=" 조회 " onClick="rankN();" />
	</form> -->
		
	<!-- #132. Ajax(검색어 입력시 검색단어 자동완성하기) 관련 추가하기 1 -->
	<div id="display" style="position:relative; left:0px; top:0px; " > 
		<div id="displayList" style="width:310px; margin-left: 80px; border-top: 0px; border-left: solid gray 1px; border-right: solid gray 1px; border-bottom: solid gray 1px;">
		</div>	
	</div>
	         
	<br/>
	
	<!-- #58. 글전체목록을 보여주는 페이지로 돌아가기 버튼과 글쓰기 버튼 생성 -->
	<button type="button" onClick="javascript:location.href='/triplan/boardList.tp';">글목록</button> 
	<button type="button" onClick="javascript:location.href='/triplan/boardAdd.tp';">글쓰기</button> 
	
	
	<!-- ======= #146. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 2) ======= -->

	<div id="displayRankN" style="width:700px; position:relative; left:100px; top:20px;"></div>
	</div>
	 
<jsp:include page="../foot.jsp" />



