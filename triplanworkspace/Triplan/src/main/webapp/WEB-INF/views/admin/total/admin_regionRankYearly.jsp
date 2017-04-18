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
<script src="https://code.highcharts.com/modules/funnel.js"></script>
<style>
	
</style>

<script type="text/javascript">


$(document).ready(function(){
	
	// 날짜 바꾸는거 !!
	var today = new Date();
	$("#theDate").val(getFormattedDate(today));



	// 바꾼 날짜에 대해서 테이블 가지고 오기(하루하루)
	$("#year").change(function(){		
		
		var month = $("#year").val();
		 alert(month);
		 var form_data = { 
				 year : year
	       };
		
		 $.ajax({
			 url: "/triplan/admin_getRegionRank.tp",
			 type: "GET",
			 data: form_data,  
			 dataType: "json", 
			 success: function(data) {  
				 
					$("#dd").empty(); 
					
					var resultHtml = "<table id='table2'>";
					    resultHtml += "<tr>";
					    resultHtml += "<th>갱크</th>";
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
					
					$("#dd").html(resultHtml);
				}// end of success
	 	});// end of ajax
	});// end of function

});// end of $(document).ready()




// 날짜를 보여주는 함수
function getFormattedDate (date) {
    return date.getFullYear()
        + "-"
        + ("0" + (date.getMonth() + 1)).slice(-2)
      
}


function statistics(){
	
	location.href="<%=request.getContextPath()%>/admin_statisticsMain.tp";
	
}

/* $(function () {
var now = new Date();
	
	var date = now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "	
	
    $('#graph1').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '가장 많이 검색되는 지역'
        },subtitle:{
        	text: date
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: '지역',
            colorByPoint: true,
            data: [{
                name: '제주특별자치도',
                y: 30.0,
                sliced: true,
                selected: true
            }, {
                name: '부산',
                y: 20.0,
               
            }, {
                name: '경기도',
                y: 10.0
            }, {
                name: '서울',
                y: 10.0
            }, {
                name: '인천',
                y: 10.0
            }, {
                name: '강원도',
                y: 10.0
            }, {
                name: '충청도',
                y: 5.0
            }, {
                name: '경상도',
                y: 3.0
            }, {
                name: '전라도',
                y: 2.0
            }]
        }]
    });
}); */
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
	<h4 style="margin-bottom: 3%; font-style: italic;">연간 가장 검색된 지역 순위 제공</h4>
	
	<select id="year">
		  <option value="2016">2016</option>
		  <option value="2015">2015</option>
		 
	</select>
	
	<br/>
	<div style="float:right;">
	<a style=" font-weight: bold; border:1px solid; font-size:1.2em ; padding:10px; " href="<%= request.getContextPath() %>/admin_regionRankDaily.tp">일</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1.2em ; padding:10px; " href="<%= request.getContextPath() %>/admin_regionRankMonthly.tp">월</a>  
	<a style=" font-weight: bold; border:1px solid; font-size:1.2em ; padding:10px; " href="<%= request.getContextPath() %>/admin_regionRankYearly.tp">년</a>  

	</div>
	
	<!-- <div id="graph1" style="min-width: 410px; max-width: 600px; height: 400px; margin: 0 auto"></div> -->
	<div id="graph1" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
	
	<div id="chart1" align="center"></div>
	
	<br/>
	
	<div id="chart2" align="center"></div>
	
	</div>
	

</body>
</html>