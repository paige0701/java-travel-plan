<%@ page import="java.util.*"%>
<%-- <%@ page import="java.sql.Date"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조회순</title>
  
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

<%
	List<Integer> list =(List<Integer>)request.getAttribute("inCnt");
	
	Date now = new Date();							
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = sdf.format(now);
	
	String year = today.substring(0,4);
	String month = today.substring(5,7);
	String day = today.substring(8,10);
	String hour = today.substring(11,13);
	
	int iday = Integer.parseInt(day);
%>
 

$(function () {
 /* var now = new Date();
	
	var date = now.getFullYear()+"년 "+(now.getMonth()+1)+"월 "+(now.getDate())+"일"
	 */
    $('#graph1').highcharts({
    	chart: {
            type: 'line'
        },
        title: {
            text: 'Site 조회수(최근 6일)'
        },
        subtitle: {

        	text: <%= year%>+"년 " + <%=month%>+"월 "+<%=day%>+"일"
        	
        },
        xAxis: {
            categories: [<%=iday-5%>+"일",<%=iday-4%>+"일",<%=iday-3%>+"일",<%=iday-2%>+"일",<%=iday-1%>+"일","오늘"]
        },
        yAxis: {
            title: {
                text: '조회수(건)'
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
            data: [<%=list.get(5)%>,<%=list.get(4)%>,<%=list.get(3)%>,<%=list.get(2)%>,<%=list.get(1)%>,<%=list.get(0)%>]
        }]
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
	
	<h2 style="font-weight: bold;">순방문자 수</h2>
	<h4 style="margin-bottom: 3%; font-style: italic;">해당 기간 동안 내 웹사이트에 1회 이상 방문한, 중복되지 않은 방문자수</h4>
	
	
	
	<div id="graph1"></div>
	</div>
	

</body>
</html>