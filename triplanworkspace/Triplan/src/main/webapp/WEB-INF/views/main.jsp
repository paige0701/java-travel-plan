<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.model.*" %>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>

<!-- 검색 자동완성 스크립트 & 스타일 -->
<script type="text/javascript">

var de_area_nameArr;
var tempcount = 0;
$(document).ready(function(){


	
	$("#de_area_name").keyup(function(){
		
		var form_data = {
							de_area_name : $("#de_area_name").val(),  // 키값 : 밸류값 
							is_ajax : 1004                        // 키값 : 밸류값
		                };
		
		$.ajax({
				url: "/triplan/autoSearch.tp",
				type: "POST",
				data: form_data, // "/triplan/autoSearch.tp" 으로 보내야할 요청 데이터값 
				dataType: "html",
				success: function(data){
					var resultText = data;
					
					var resultArr = resultText.split('|'); // 리턴타입이 문자열을 가지는 배열로 리턴한다.
					var count = parseInt(resultArr[0]); // 4
					
					if(count > 0) {
						de_area_nameArr = resultArr[1].split(','); // 자바 프로그래밍,자바공부,자바프로그래머 김태균,자바
						
						var resultHtml = "";

						resultHtml += "검색어 자동완성 <br/>";
						for(var i=0; i<de_area_nameArr.length; i++) {
							resultHtml += "<a href='javascript:mychoose(\"" + de_area_nameArr[i] +"\")'>" + de_area_nameArr[i] + "</a><br/>";
						}// end of for-------------
						
						$("#displayList").html(resultHtml);
						$("#display").show();
					}
					else{ // 검색어로 시작하는 데이터가 없다라면
						$("#display").hide();
					}
					
				}// end of success-----------------
		});// end of $.ajax()----------------------
		
	});// end of $("#de_area_name").keyup()-----------
	
});

function mychoose(title) {
	$("#de_area_name").val(title);
	$("#display").hide();
}




</script>

<!-- 실시간 검색어 스크립트 & 스타일 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		appendAjax();
		$('#display').hide();
		
		$(".search").focus(function(){
			
			$(this).keydown(function(event){
				if(event.keyCode == 13)
				{
					goSearch();
					event.preventDefault();
				}
			})
			
		})
		
	});
	
	function goSearch()
	{
		// 유효성 검사!
		var de_area_name = document.getElementById("de_area_name").value;
		
		if(de_area_name == "")
		{
			alert("검색어를 입력하세요!");
			return;
		}
		
		else if(de_area_name == "경기" || de_area_name == "경기도"
				|| de_area_name == "강원" || de_area_name == "강원도"
				|| de_area_name == "전라" || de_area_name == "전라도"
				|| de_area_name == "경상" || de_area_name == "경상도"
				|| de_area_name == "충청" || de_area_name == "충청도")
		{
			alert("지역명이 정확하지 않습니다.");	
			location.href="/triplan/main.tp";
		}
		
		else if(de_area_name.length < 2)
		{
			alert("지역명이 정확하지 않습니다.");	
			location.href="/triplan/main.tp";
		}
		
		else
		{
			document.searchFrm.submit();
		}
	
	}
	
	//////////////////////////////// 0702(동규) ////////////////////////////////////////
	///////////// 페이징 처리 ///////////////////
	var pageNo = 0;
	
	// 무한 스크롤 부분 --> 스크롤이 윈도우창 맨밑에 닿았을때마다 리스트를 추가
  	$(window).scroll(function(){
  		if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
  			addList();
  		}
  	});
  	 
  	function addList() {  		
		//1초 쉬었다가 결과물 가져오는 함수를 호출
		if(tempcount == 0)
		{
			tempcount = 1;
			setTimeout(function(){
				appendAjax(); // div에 append할 데이터를 가져올 함수
				tempcount = 0;
			}, 1000);
		}
	}
  	

function appendAjax() {
  		
  		var form_data = { 
                pageNo : pageNo
        	};

		 // 위의 form_data를 get방식으로 dataSelldog.jsp(내용물페이지)에 보냅니다
		$.ajax({
			type : "GET",
			url : "/triplan/kyu_getMainSchedule.tp", 
			data : form_data,
			dataType: "html",      //받는 데이터방식은 html
			error : function(){
				alert("error");
			},
			// 성공시 id가 div_dataSelldog인 <div>태그에  dataSelldog.jsp에서 가져온 html데이터를 추가해줍니다
			  
			success : function(data) {	
				$("#mainSchedule").append(data);
				pageNo++;			//페이지번호 증가
				
			}
		});
	}
	
	//////////////////////////////// 0702(동규) ////////////////////////////////////////
	
	
/* 	function getMainSchedule()
	{
		$.ajax({
			url: "/triplan/jh_getMainSchedule.tp",
			type : "post",
			dataType: "html",
			success: function(data){
				$("#mainSchedule").html(data);
			}
		})	
	} */
	
////////////////////////////////0702 동규 //////////////////////////////////
	function viewSchedule(sc_idx)
	{
		var event = window.event;
		var id = event.target.id;
	 	if(id == "likebtn")
		{
	 		addlike(sc_idx);		// liked List에 추가, cnt + 1 와 그 반대
		}
		else
		{
			location.href="view_schedule.tp?sc_idx="+sc_idx;	// 방문하며 viewcnt 증가
		} 
	}
	
	function addlike(idx)	// liked List에 추가, cnt + 1
	{	
		var info= { idxdata : idx };
		
		$.ajax({
			url: "/triplan/kyu_addlike.tp",			
			data : info,
			type : "GET",
			dataType: "html",
			success: function(data){
				$("#mainSchedule").html(data);
			}
		}) // end of ajax
	}
	
////////////////////////////////0702 동규 //////////////////////////////////	
</script>
<style>			/* 실검 스타일 */
	#aid {text-decoration: none;}
 	#searchFrm {display: inline;}
 	/* #word {display: inline;} */
 	/* #word {
 		height: auto;
 	} */
 	#searchList {;width: 150px; height: 255px; background-color: white; position: absolute;
 					border: 1px solid green;			 
 	}
 	
</style>

<div id="screen">
<jsp:include page="top.jsp" />

	<section id="main">
		<div class="search-form">
			<div class="container" align="center">
				<h1>TRIPLAN</h1>
				<form name="searchFrm" action="/triplan/searchArea.tp" method="get">
				<div class="search-box" align="center">
					<input type="text" class="search" id="de_area_name" name="de_area_name" size="30">
					<button type="button" class="btn btn-default btn-lg btn-search" onClick="goSearch();"><span class="glyphicon glyphicon-search"></span> <span class="span-search"></span>검색</button>
					<div id="display" class="search2" style="display:none; text-align:left"> <!-- style="width:70%; border: 0px solid gray; position: relative; left:0px; top:5px; " -->
						<div id="displayList"></div>
					</div>
				</div>
				
				</form>
				 <!-- ///////////// 실검 ///////////// -->
            <div id="word" style="margin-left:980px; margin-top:25px; font-weight: bold; font-size: 15pt; color:#ccccff">
               <div id="realtime" style="width:150%;"><jsp:include page='main/realtime_k.jsp' /></div>
               <div id="searchList" style="display: none;"></div>
            </div>
            <!-- ///////////// 실검 ///////////// -->
			</div>
		</div>

	 	<div class="container-fluid bg-3 text-center">    
			<h3 class="margin">대한민국 곳곳을 누벼 보세요</h3><br>
			<div class="schedule-list">
			
				<div id="mainSchedule" style="padding: 3px;"></div>
			</div>
		</div>
	</section>
	
	<article>
	</article>
	
<jsp:include page="foot.jsp" />
</div>