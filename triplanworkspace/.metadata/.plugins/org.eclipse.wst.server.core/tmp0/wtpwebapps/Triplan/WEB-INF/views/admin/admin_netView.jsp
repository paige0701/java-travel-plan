<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>순방문자 수</title>
  
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


$(function () {
 var now = new Date();
	
	var date = now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "+now.getDate()+"일"
	
    $('#graph1').highcharts({
    	chart: {
            type: 'line'
        },
        title: {
            text: '순방문자수(명)'
        },
        subtitle: {

        	text: date
        	
        },
        xAxis: {
            categories: ['17일','18일','19일','20일','21일','22일']
        },
        yAxis: {
            title: {
                text: '방문자(명)'
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: '일',
            data: [40,50,20,60,100,60]
        }]
    });
});


</script>

</head>
<body>



	 <h1 align="center"><a href="/triplan/adminlogin.tp" style="text-decoration: none;	">Administrator</a></h1>
	 <button style="margin-left:48%" type="button" class="btn btn-default btn-sm"  onclick="statistics()">
          <span class="glyphicon glyphicon-stats" ></span> Stats
     </button>
	
	 <ul class="breadcrumb" style="text-align: center; width:70%;margin-left:15%;margin-top:1%;
      border-width:10px; color: grey; border-style: inset;   ">
	    <li value="1"><a  href="/triplan/admin_view.tp">조회수</a></li>
	   	<li value="2"><a  href="/triplan/admin_netView.tp">순방문자수</a></li>
	    <li value="3"><a  href="/triplan/admin_viewRank.tp">조회수 순위</a></li>
	    <li value="4"><a  href="/triplan/admin_likeRank.tp">좋아요 순위</a></li>        
	    <li value="5"><a  href="/triplan/admin_commentRank.tp">댓글수 순위</a></li>
	    <li value="6"><a  href="/triplan/admin_ratingRank.tp">별점 순위</a></li>    
	    <li value="7"><a  href="/triplan/admin_regionRankDaily.tp">지역검색순위</a></li>        
	    <li value="8"><a  href="/triplan/admin_ageStat.tp">성별, 연령별 분포</a></li>        
	               
 	  </ul>
	<div id="admin_contents" style="width: 70%; text-align: center; margin-left:auto; margin-bottom:1000px;  margin-right: auto; margin-top:3%"  >
	
	<h2 style="font-weight: bold;">순방문자 수</h2>
	<h4 style="margin-bottom: 3%; font-style: italic;">해당 기간 동안 내 웹사이트에 1회 이상 방문한, 중복되지 않은 방문자수</h4>
	
	
	
	<div id="graph1"></div>
	<div id="chart1" align="center">
		<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
			<tr>	
				<td >날짜
				</td>
				<td>명
				</td>
			</tr>
			
			<tr>	
				<td >6월 21일
				</td>
				<td>15명
				</td>
			</tr>
			
			<tr>	
				<td >6월 20일
				</td>
				<td>44명
				</td>
			</tr>
			
			<tr>	
				<td >6월 19일
				</td>
				<td>59명
				</td>
			</tr>
		</table>
	</div>
	<br/>
	
	<div id="chart2" align="center"></div>
	
	</div>
	

</body>
</html>