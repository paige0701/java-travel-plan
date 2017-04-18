<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 안녕~</title>
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">



<style>
P	{	
		font-weight: bold;
		
	}
	

	
.ttdiv	{
		width:90%;
		height: 300px;
		padding-left: 6%;
		padding-bottom: 5%;
		padding-top: 5%;
		}
 		
hr		{	
		width: 70%;
		
		}
		
.addel	{
		padding-bottom: 5%;
		padding-top: 5%;
		height: 800px	
		}

.uidiv	{
				padding-left: 20%;
		padding-right: 20%;
		}		
	
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	tour(); 
	<%-- 
	<% if(request.getAttribute("tabnum") != null) { %>
	$("#mytab li:eq("+"<%= request.getAttribute("tabnum") %>"+") a").tab("show"); 
	<% } %> 
	
	<% if(request.getAttribute("cd_scrolltop") != null) { %>
	$(window).scrollTop(<%= request.getAttribute("cd_scrolltop") %>); 
	<% } %> 

	<% if(request.getAttribute("tabnum2") != null) { %>
	$("#mytab2 li:eq("+"<%= request.getAttribute("tabnum2") %>"+") a").tab("show"); 
	<% } %> 
	
	<% if(request.getAttribute("tabnum3") != null) { %>
	$("#mytab3 li:eq("+"<%= request.getAttribute("tabnum3") %>"+") a").tab("show"); 
	<% } %> 
	
	<% if(request.getAttribute("tabnum4") != null) { %>
	$("#mytab4 li:eq("+"<%= request.getAttribute("tabnum4") %>"+") a").tab("show"); 
	<% } %>
	--%>
});
//			관광지 ajax
function tour() {
	
	$.ajax({
		
		url: "admintour.tp",
		dataType: "html",
		success: function(data){
			
			/* $("#yj_member").html(data); */
			
			$("#yj_show").html(data);
		
		}
	});

}

//			통계 ajax
function total() {
	
	$.ajax({
		
		url: "admintotal.tp",
		dataType: "html",
		success: function(data){
			
			
			$("#yj_show").html(data);		
		
		}
	});
	
}



//			회원관리 ajax
function member() {
	
	$.ajax({
		
		url: "adminme.tp",
		dataType: "html",
		success: function(data){
			
			/* $("#yj_member").html(data); */
			
			$("#yj_show").html(data);
			
		}
	});
	
}


//			회원 검색
function goSearch() {
	
	var colName = $("#colName").val();
	var searchWord = $("#searchWord").val();
	
	$.ajax({
		
		url: "adminme.tp",
		data: {
			colName : colName,
			searchWord : searchWord
		},
		dataType: "html",
		success: function(data){
			
			$("#yj_show").html(data);
			
		}
		
	})
	
}


/* //			회원 상태 변경
function goOnOff(userid,active) {
	
	$.ajax({
		
		url: "updatemember.tp",
		data: { 
				userid : userid,
				active : active    
		},
		success: function(){
		
			member();
		}
		
	})
	alert("변경되었습니다!");
} */

//			관광지 추가
function goaddtr()  { 
	
	window.open("adminaddtr.tp", "a", "width=550, height=600, left=100, top=50"); 
	
}

//			관광지 삭제
function deltr(t_idx) {
	
$.ajax({
		
		url: "deltour.tp",
		data: { 
				t_idx : t_idx    
		},
		success: function(){
		
		}
		
	})
	alert("삭제되었습니다.");
	tour();
		
}

function statistics(){
	
	location.href="/triplan/admin_statisticsMain.tp";
	
}

function board() {
	
	$.ajax({
		
		url: "admin_list.tp",
		success: function(data){
		
			$("#yj_show").html(data);
		
		}
		
	})

}



</script>

</head>
<body>

<form>

	<p><h1 align="center"> Administrator</h1>
	 <button style="margin-left:48%" type="button" class="btn btn-default btn-sm" onclick="statistics()">
          <span class="glyphicon glyphicon-stats" ></span> Stats
     </button>
	
	<p>
		
		<div class="addel">
			<div class="uidiv" >
				<ul class="nav nav-tabs" id="mytab">
					<li class="active" class="yj_tour_tab" id="yj_tour_tab"><a data-toggle="tab" href="#myplan" onclick="tour();">관광지 관리</a></li>
					<li id="yj_member_tab" class="yj_member_tab"><a data-toggle="tab" href="#wishlist" onclick="member();" >회원 관리</a></li>
					<li id="yj_board_tab" class="yj_board_tab"><a data-toggle="tab" href="#friends" onclick="board()">게시판 관리</a></li> <!--월요일 -->
				</ul>
			</div>
			
		
		<!-- ==================================== --@#@ 매뉴 아래에서 부터 모든 내용 포함 ==================================== -->
			
 				<div id="yj_show" class="tab-pane fade in active">
 				</div>									
  		
  			</div>
  

</form>

</body>
</html>