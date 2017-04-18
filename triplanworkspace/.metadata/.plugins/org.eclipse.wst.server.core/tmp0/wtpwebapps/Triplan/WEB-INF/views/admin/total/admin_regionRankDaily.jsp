<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지역검색순위</title>
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="<%=request.getContextPath() %>/resources/js/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/exporting.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>

<style>
	#table2{text-align: center}
</style>

<script type="text/javascript">


$(document).ready(function(){
	
	chart();//일단 처음 차트를 띄운다
	
	// 날짜 바꾸는거 !!
	var today = new Date();
	$("#theDate").val(getFormattedDate(today));


	// 바꾼 날짜에 대해서 테이블 가지고 오기(하루하루)
	$("#theDate").change(function(){		
		$("#graph1").empty();
		
		
		var dateReq = $("#theDate").val();
		// alert(date);
		 var form_data = { 
				 dateReq : dateReq
	       };
		
		 $.ajax({
			 url: "/triplan/admin_getRegionRank.tp",
			 type: "GET",
			 data: form_data,  
			 dataType: "json", 
			 success: function(data) {  
				 
					$("#chart1").empty(); 
					
					var resultHtml = "<table id='datatable' class='table' style='margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;'>";
					    resultHtml += "<tr>";
					    resultHtml += "<th>랭크</th>";
					    resultHtml += "<th>지역</th>";
					    resultHtml += "<th>검색수</th>";
					    resultHtml += "</tr>";
						
					$.each(data, function(entryIndex, entry){  
									resultHtml += "<tr>";
									resultHtml += "<td>" + entry.rank +"</td>";        // entry.키값
									resultHtml += "<td>" + entry.searchedWord +"</td>";    // entry.키값
									resultHtml += "<td>" + entry.count +"</td>";       // entry.키값
									resultHtml += "</tr>";
					});
					
					resultHtml += "</table>";
					
					$("#chart1").html(resultHtml);
					
					chart();
				}// end of success
	 	});// end of ajax

	});// end of function

});// end of $(document).ready()


	function chart(){
		var now = new Date();	
		var date = now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "+now.getDate()+"일";
			
		$('#graph1').highcharts({
		    data: {
		        table: 'datatable',
		        startColumn:1,
		        endColumn:2 
		    },
		    chart: {
		        type: 'bar'
		    },
		    title: {
		        text: ''
		    },
		    yAxis: {
		        allowDecimals: false,
		        title: {
		            text: '번'
		        }
		    },
		    tooltip: {
		        formatter: function () {
		            return '<b>' + this.series.name + '</b><br/>' +
		                this.point.y + ' ' + this.point.name.toLowerCase();
		        }
		    }
		}); //end of $('#graph1').highcharts({
		
	} // end of function chart -----------------

// 날짜를 보여주는 함수
function getFormattedDate (date) {
    return date.getFullYear()
        + "-"
        + ("0" + (date.getMonth() + 1)).slice(-2)
        + "-"
        + ("0" + date.getDate()).slice(-2);
}


function statistics(){
	
	location.href="<%=request.getContextPath()%>/admin_statisticsMain.tp";
	
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
	
	<h2 style="font-weight: bold;">지역 검색 순위</h2>
	
	<div align="center"><input type="date" id="theDate"/></div>
	<br/>
	<div align="center">
	
	<a style=" font-weight: bold; border:1px solid; font-size:1.2em ; padding:10px; " href="<%= request.getContextPath() %>/admin_regionRankDaily.tp">일</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1.2em ; padding:10px; " href="<%= request.getContextPath() %>/admin_regionRankMonthly.tp">월</a>  
	<%-- <a style=" font-weight: bold; border:1px solid; font-size:1.2em ; padding:10px; " href="<%= request.getContextPath() %>/admin_regionRankYearly.tp">년</a> --%>  

	</div>
	
	<div id="graph1" style="width: 70%; height: 100%; margin: 0 auto ; margin-top:2%"></div>

	<div id="chart1" align="center">
	<table id="datatable" class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
		
			<tr>	
				<td >순위
				</td>
				<td>지역
				</td>
				<td>검색수
				</td>
			</tr>
			<c:if test="${empty list }"><tr><td colspan="3">존재하지 않습니다</td></tr>></c:if>
			<c:if test="${list != null }">
			<c:forEach var="list" items="${list }">
			<tr>	
				<td >${list.RANKING }
				</td>
				<td>${list.searchedWord }
				</td>
				<td>${list.COUNT }
				</td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
	<br/>
	</div>
	
	<div id="chart2" align="center"></div>
	
	</div>
	

</body>
</html>