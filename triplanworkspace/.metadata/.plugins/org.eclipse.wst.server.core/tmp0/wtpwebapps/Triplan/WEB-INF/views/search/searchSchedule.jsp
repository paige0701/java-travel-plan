<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">


.disable_a_href{
    pointer-events: none;
}

.col-md-4 {
	width:33.33333333%;
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
	float:left;
}


img{vertical-align:middle}


.img-responsive {
	display:block;max-width:100%;height:auto;
}
html{
	font-family:sans-serif; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%;
}

.portfolio-item {
    margin-bottom: 25px;
}


*{
 	-webkit-box-sizing:border-box;
 	-moz-box-sizing:border-box;
 	box-sizing:border-box
}
 
 hr{margin-top:20px;
 	margin-bottom:20px;
 	border:1;
 	border-top:1px solid #eee
}

/* 버튼 style */

.subscribe input[type="text"]:focus {
					outline: 0; background: #fff; border: 3px solid #89cc2d;
				    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
					}
					
.subscribe button.btn {
	height: 50px;
    margin: 0;
    padding: 0 20px;
    vertical-align: middle;
    background: #89cc2d;
    border: 0;
    font-family: 'Raleway', sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 50px;
    color: #fff;
    -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0;
    text-shadow: none;
    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}

.subscribe { position: relative; color: #fff; }

.subscribe input[type="text"] {
	width: 360px;
	height: 50px;
    margin: 0;
    padding: 0 20px;
    vertical-align: middle;
    background: #fff;
    border: 3px solid #fff;
    font-family: 'Raleway', sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 50px;
    color: #888;
    -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0;
    -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
    -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s; -ms-transition: all .3s; transition: all .3s;
}
	
	
	#sc{
	width: 100%;
	height:50%;
	
	}			



</style>
<!-- 7월4일 -->
<div id="screen">
<jsp:include page="../top.jsp" />

<img id="sc" src="/triplan/resources/image/bgt5.jpg">
	<section id="main">
		<div class="container" align="center" style="margin-top:-22%; margin-bottom:8%">
			<h1 style="font-size: 50pt; font-weight:bold; color:white">여행일정 찾기</h1>
			<div class="search-box" align="center">
				<input type="text" class="search"size="30" placeholder="떠나고 싶은 도시와 일정을 찾아보세요.">
				<button type="button" class="btn btn-default btn-lg btn-search" onClick="getSearchSchedule();"><span class="glyphicon glyphicon-search"></span> <span class="span-search"></span>검색</button>
			</div>
		</div>

	 	<div class="container-fluid bg-3 text-center">    
			<div class="schedule-list">
				<div id="searchSchedule"></div>
			</div>
		</div>
	</section>
	
	<article>
	</article>
	
<jsp:include page="../foot.jsp" />
</div>
<jsp:include page="../popup/popup.jsp" />



<script type="text/javascript">

	$(document).ready(function(){
		
		$("#main").css("min-height",($(window).height()-55)+"px");
		
		$(".search").val("${searchWord}");
		/* getSearchSchedule(); */
		
		$(".search").focus(
			    function(){
			        $(this).val('#');
			    });
		
		appendAjax2();
	})

	/* 
	function getSearchSchedule()
	{
		var searchWord = $(".search").val();
		
		if(searchWord.charAt(0) == '#')
		{
		
			$.ajax({
				url: "/triplan/jh_getSearchSchedule.tp",
				type : "post",
				data : { sc_searchWord : searchWord },
				dataType: "html",
				success: function(data){
					$("#searchSchedule").html(data);
				}
			})	
		}
		else
		{
			location.href = "searchArea.tp?de_area_name="+searchWord;	
		}
		
		
	}
	 */
	function viewSchedule(sc_idx)
	{
		location.href="view_schedule.tp?sc_idx="+sc_idx;
	}

	/////////////////////////// kyu //////////////////////////////////
	
	var pageNum = 0;
	
	// 무한 스크롤 부분 --> 스크롤이 윈도우창 맨밑에 닿았을때마다 리스트를 추가
  	$(window).scroll(function(){
  		if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
  			addList2();
  		}
  	});
  	 
  	function addList2() {  		
		//1초 쉬었다가 결과물 가져오는 함수를 호출
		setTimeout(function(){
			appendAjax2(); // div에 append할 데이터를 가져올 함수
		}, 1000);
	}
  	

	function appendAjax2() {
  		
		var searchWord = $(".search").val();
  		var form_data = { 
  				pageNum : pageNum,				
  				sc_searchWord : searchWord
        	};	
  		
  		if(searchWord.charAt(0) == '#')
		{
			$.ajax({
				type : "GET",
				url : "/triplan/kyu_getsearch_Schedule.tp", 
				data : form_data,
				dataType: "html",      
				error : function(){
					alert("error");
				},
				success : function(data) {	
					$("#searchSchedule").append(data);
					pageNum++;			//페이지번호 증가
					
				}
			});
		}
  		else{
  			location.href = "searchArea.tp?de_area_name="+searchWord;
  		}
	
	}
	//////////////////////////////////////////////////////////////////
	
</script>