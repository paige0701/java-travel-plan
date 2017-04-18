<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.model.*" %>
<%@ page import="com.spring.triplan.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세정보보기</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function goWrite()
	{
		var userid = "${userid}";
		
		if(userid == "-9")
		{
			alert("로그인 후 댓글 남기기가 가능합니다.");
			addTCommentFrm.action="javascript:history.back();";
			addTCommentFrm.submit();
		}
		
		else
		{
			var addTCommentFrm = document.addTCommentFrm;
			addTCommentFrm.action="/triplan/addTComment.tp"
			addTCommentFrm.submit();
		}
		
	}
	
	function goRating()
	{
		var userid = "${userid}";
		
		if(userid == "-9")
		{
			alert("로그인 후 별점 남기기가 가능합니다.");
			addTCommentFrm.action="javascript:history.back();";
			addTCommentFrm.submit();
		}
		
		else
		{
			var addTCommentFrm = document.addTCommentFrm;
			addTCommentFrm.action="/triplan/addTRating.tp"
			addTCommentFrm.submit();
		}
		
	}
	
	function addwishlist(t_idx,no)
	{
		var form_data ={t_idx : t_idx, no :no }
		
		$.ajax({url: "/triplan/cd_addwishlistend.tp",
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
		   	  	
				$("#here").html(result);  			
				           
		      }// end of success----------------------
		      ,
		      error: function(data){
			    	
			    	 alert("위시리스트에 벌써 추가되어있음");
			      }
		  });// end of $.ajax();----------------------	
		
		
	}
</script>
<style type="text/css">

.detailTable {border:0px solid blue; 
			  width:100%; 
			  height:100%; 
			  display: relative; 
			  margin-top: 1%;
			 
			   }
			   
#tourcommenttbl{border:0px solid grey; 
			  width:90%; 
			  height:100%; 
			  display: relative; 
			  margin-top: 1%;
			 margin-left:5%;
			   }
			 			   
			   
.detailTable tr {border:0px solid blue;  padding:2% }
.detailTable td {border:0px solid blue;  padding:2% }

#detailtbl{border:0px solid red; 
		   width:90%; 
		   height: 70%; 
		   display: relative; 
		   margin-left:5%; 
		   margin-top: 1%"}

</style>

</head>
<body>
<div id="cd_content" style="width:100%; border:0px solid orange; ">
	<div align="center" style= "border:0px solid green; width:90%; height: 20%; display: relative; margin-left:5%; margin-top:5%"  >
		<img src="/triplan/TourInfo/images/${tvo.t_idx}/title.jpg" width="100%">
	</div>
	
	<div id="detailtbl" align="center" >
		<table class="detailTable">
		    <thead>
		      <tr>
		        <td colspan="4" align="center" >
			        <span style="font-size:25pt; font-weight: bold; display:inline-table;" >
			        ${tvo.t_name}
			        </span>
		        </td>
		      </tr>
		      
		      <tr>
		      	<td colspan="4" align="center" >
		      		<span style="font-size:12pt; font-weight: bold;">별점 : 
		      		<c:if test="${tvo.t_rating == 0}">☆☆☆☆☆</c:if>
		      		<c:if test="${tvo.t_rating == 1}">★☆☆☆☆</c:if>
		      		<c:if test="${tvo.t_rating == 2}">★★☆☆☆</c:if>
		      		<c:if test="${tvo.t_rating == 3}">★★★☆☆</c:if>
		      		<c:if test="${tvo.t_rating == 4}">★★★★☆</c:if>
		      		<c:if test="${tvo.t_rating == 5}">★★★★★</c:if></span>
		        <td>
		      </tr>
		      <tr>
		      	<td colspan="4" align="center" id="here">
		      	<c:if test="${wl == 0}">
		      		<input type="button" onClick="addwishlist('${tvo.t_idx}','0')" value="위시리스트 추가">
		      	</c:if>
		      	
		      	<c:if test="${wl == 1}">
		      		<input type="button" onClick="addwishlist('${tvo.t_idx}','1')" value="위시리스트 해제">
		      	</c:if> 
		      	
		      	<c:if test="${wl == -1}">
		      		<p>로그인 후 이용가능합니다</p>
		      	</c:if> 
		      	
		      	</td>
		      </tr>
		      
		    </thead>
		    <tbody>
		      <tr>
		        <td colspan="1" align="center" width="20%" style="font-size:13pt; font-weight: bold;">주소</td>
		        <td colspan="3">${tvo.t_addr}</td>
		      </tr>
		      <tr>
		        <td colspan="1" align="center" style="font-size:11pt; font-weight: bold;" >설명</td>
		        <td colspan="3">${tvo.t_detail}</td>
		      </tr>
		    </tbody>
		</table>
	</div>
	
	<div id="tourcommenttbl">
	<!-- 댓글쓰기 폼 추가 -->
		  <div style=" width:90%; 
			  height:100%; 
			  display: relative; 
			  margin-top: 3%">
		  <form name="addTCommentFrm" method="post">
		  		내용 : <input type="text" name="content" class="long" /> &nbsp;&nbsp; <input type="button" value="쓰기" onClick="goWrite();" />
		  		<c:if test="${rw != 1}">
		  		별점 : <select name="rating" id="rating">
						  <option value="0">☆☆☆☆☆</option>
						  <option value="1">★☆☆☆☆</option>
						  <option value="2">★★☆☆☆</option>
						  <option value="3">★★★☆☆</option>
						  <option value="4">★★★★☆</option>
						  <option value="5">★★★★★</option>
					  </select>
				<input type="button" value="확인" onClick="goRating();" />
				</c:if>
		  		<!-- 댓글에 달리는 원게시물 글번호 (즉, 댓글의 부모 번호) -->
		  		<input type="hidden" name="t_idx" value="${tvo.t_idx}" />
		  		<input type="hidden" name="userid" value="${userid}" />
		  </form>
		  </div>
		  <br/>
		  
		  <!-- 댓글 목록 띄워주기 -->
		  <table class="table">
		  		<thead>
				<tr>
					<th style="width: 20%">번호</th>
					<th style="width: 20%">작성자</th>
		            <th style="width: 40%">내용</th>
		            <th style="width: 20%">작성시간</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${ticlist == null || empty ticlist}">
					<tr><td colspan="4">후기가 존재하지 않습니다. 후기를 남겨 보세요!</td></tr>
				</c:if>
				<c:if test="${ticlist != null || not empty ticlist}">
				<c:set var="count" value="0"/>
				<c:forEach var="tourinfocommVO" items="${ticlist}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${tourinfocommVO.userid}</td>
						<td>${tourinfocommVO.content}</td>
						<td>${tourinfocommVO.regDate}</td>
					</tr>
					<c:set var="count" value="${status.count}"/>
				</c:forEach>
				<tr>
					<td class="total" >전체 후	기수</td>
					<td class="total" >${count}개</td>
					<td colspan="2" >${ pagebar}</td> 
				</tr>
				</c:if>
				</tbody>
			</table>
	</div>
</div>
</body>
</html>