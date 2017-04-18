<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>별점 순위</title>
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="<%=request.getContextPath() %>/resources/js/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/exporting.js"></script>

<style>
	
</style>

<script type="text/javascript">


function statistics(){
	
	location.href="<%=request.getContextPath()%>/admin_statisticsMain.tp";
	
}

function getRating(no){
	//alert("dd");
	//alert(no);
	
	var form_data = { 
	           
	           no : no
	       };
	 
	 	 $.ajax({url: "/triplan/admin_getRatingAjax.tp",
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#chart1").empty();
			$("#chart1").html(result);  			
			           
	      }// end of success----------------------
	  });// end of $.ajax();----------------------	
	
}


</script>

</head>
<body>



	 <h1 align="center"><a href="/triplan/adminmain.tp" style="text-decoration: none;	">Administrator</a></h1>
	 <button style="margin-left:48%" type="button" class="btn btn-default btn-sm"  onclick="statistics()">
          <span class="glyphicon glyphicon-stats" ></span> Stats
     </button>
	
	 <ul class="breadcrumb" style="text-align: center; width:70%;margin-left:15%;margin-top:1%;
      border-width:10px; color: grey; border-style: inset;   ">
	    <!-- <li value="1"><a  href="/triplan/admin_view.tp">조회수</a></li> -->
	   	<li value="2"><a  href="/triplan/admin_netView.tp">순방문자수</a></li>
	    <li value="3"><a  href="/triplan/admin_viewRank.tp">조회수 순위</a></li>
	    <li value="4"><a  href="/triplan/admin_likeRank.tp">좋아요 순위</a></li>        
	    <li value="5"><a  href="/triplan/admin_commentRank.tp">댓글수 순위</a></li>
	    <li value="6"><a  href="/triplan/admin_ratingRank.tp">별점 순위</a></li>    
	    <li value="7"><a  href="/triplan/admin_regionRankDaily.tp">지역검색순위</a></li>        
	    <li value="8"><a  href="/triplan/admin_ageStat.tp">성별, 연령별 분포</a></li>        
	               
 	  </ul>
	<div id="admin_contents" style="width: 70%; text-align: center; margin-left:auto; margin-bottom:3%;  margin-right: auto; margin-top:3%"  >
	
	<h2 style="font-weight: bold;">별점 순위</h2>
	
	<div align="center" style="margin-top:3%">
	
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="<%= request.getContextPath() %>/admin_ratingRank.tp">서울</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('2')">인천</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('3')">부산</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('4')">제주도</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('5')">경기도</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('6')">강원도</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('7')">충청도</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('8')">전라도</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1em ; padding:10px; " href="javascript:getRating('9')">경상도</a>  

	</div>	
	
	<div id="graph1"></div>
	<div id="chart1" align="center" style="height:100%">
		
		<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
			<tr><td colspan="3">서울 지역 관광지 별점 순위</td></tr>
			<tr>	
				<td>순위
				</td>
				<td>이름
				</td>
				<td>점수(별점)
				</td>
			</tr>
		<c:if test="${tourRating == null }">
		앙대
		</c:if>
		<c:if test="${tourRating != null }">
			<c:forEach var="tourRating" items="${tourRating }">
				<tr>
				<td >${tourRating.RANKING }
				</td>
				<td>${tourRating.NAME }
				</td>
				<td>${tourRating.RATING }
				</td>
				</tr>
			</c:forEach>
		</c:if>
			
		</table>
		
		<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
			<tr><td colspan="3">서울 지역 음식점 별점 순위</td></tr>
			<tr>	
				<td>순위
				</td>
				<td>이름
				</td>
				<td>점수(별점)
				</td>
			</tr>
		<c:if test="${foodRating == null }">
		앙대
		</c:if>
		<c:if test="${foodRating != null }">
			<c:forEach var="foodRating" items="${foodRating }">
				<tr>
				<td >${foodRating.RANKING }
				</td>
				<td>${foodRating.NAME }
				</td>
				<td>${foodRating.RATING }
				</td>
				</tr>
			</c:forEach>
		</c:if>
		
		</table>

		<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
			<tr><td colspan="3">서울 지역 숙박시설 별점 순위</td></tr>
			<tr>	
				<td>순위
				</td>
				<td>이름
				</td>
				<td>점수(별점)
				</td>
			</tr>
		<c:if test="${hotelRating == null }">
		앙대
		</c:if>
		<c:if test="${hotelRating != null }">
			<c:forEach var="hotelRating" items="${hotelRating }">
				<tr>
				<td >${hotelRating.RANKING }
				</td>
				<td>${hotelRating.NAME }
				</td>
				<td>${hotelRating.RATING }
				</td>
				</tr>
			</c:forEach>
		</c:if>	
		</table>
		
		
		
		<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
			<tr><td colspan="3">서울 지역 체험,전시 별점 순위</td></tr>
			<tr>	
				<td>순위
				</td>
				<td>이름
				</td>
				<td>점수(별점)
				</td>
			</tr>
		<c:if test="${otherRating == null }">
		앙대
		</c:if>
		<c:if test="${otherRating != null }">
			<c:forEach var="otherRating" items="${otherRating }">
				<tr>
				<td >${otherRating.RANKING }
				</td>
				<td>${otherRating.NAME }
				</td>
				<td>${otherRating.RATING }
				</td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
	
	</div>
	<br/>
	<div id="chart2" align="center">
		
	</div>
	</div>
	

</body>
</html>