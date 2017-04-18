<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성별, 연령대 분포도</title>
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="<%=request.getContextPath() %>/resources/js/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/exporting.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>

<style>
	
</style>

<script type="text/javascript">


function statistics(){
	
	location.href="<%=request.getContextPath()%>/admin_statisticsMain.tp";
	
}

$(function () {
	
	 var now = new Date();
		
		var date = now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "+now.getDate()+"일";
		
    $('#graph').highcharts({
        data: {
            table: 'datatable'
        },
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },subtitle:{
        	text: date
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '명'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});
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
	
	<h2 style="font-weight: bold;">성별, 연령대 분포도</h2>

	
	<div id="graph" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<div id="chart1" align="center">
<table id="datatable" class="table" style="width:80%">
    <thead>
        <tr>
            <th>연령대</th>
            <th>전체인원</th>
            <th>남</th>
            <th>여<th>
        </tr>
    </thead>
   
    <tbody>
    <c:if test="${map == null }"><TR><td colspan="3">데이터가 없엉</td></TR></c:if>

    <c:if test="${map != null }"> 
        <c:forEach items="${map }" var="list">
        <tr>
            <td>${list.AGELINE }</td>
            <td>${list.COUNT }</td>
            <td>${list.MAN }</td>
            <td>${list.WOMAN }</td>
        </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>

</div>
<div id="chart2" align="center"></div>
</div>
</body>
</html>