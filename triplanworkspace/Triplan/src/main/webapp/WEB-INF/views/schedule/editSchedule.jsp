<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% MemberVO member = (MemberVO)session.getAttribute("member"); %>
<meta charset="utf-8">
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAfN2Bk4lSWLI3icy1x15wZXvLY0XpAims"></script>

<style type="text/css">
	#screen{
		height:auto;
	}
	
	#totalscreen {
		height:auto;
		padding: 0 9% 0 15%;
	}

  #leftscreen {
  	  width:35%;
  	  height:auto;
  	  float:left;
  	  padding-left:10px;
  	  padding-top:5%;
  }
  
  #rightscreen {
  	  width:60%;
  	  height:auto;
  	  float:left;
  	  padding-left: 1%;
  	  padding-right:10px;
  	  padding-top:5%;
  }
  
  #chatscreen {
  	margin: 52px 0 0 0;
  	left: 97.5%;
  	width: 2.5%;
  	height: 89%;
  	float: right;
  	position: fixed;
  	border: 1px solid #ddd;
  	background-color :  #f2f2f2;
  }
  
  #chatroom {
  	display: none;
  	height: 100%;
  }

  #googleMap {
      height:40%;
      width:100%;
      float:right;
  	  padding-right:10px;
  }

  #edsc_search {
  	padding-left: 0%;
  	float: left;
  }

  #timeTable {
      height:auto;
      width:100%;
      float:left;
  	  padding-left:10px;
  }

  #list {
      height:50%;
      width:100%;
      float:right;
  	  padding-right:10px;
  	  padding-top:10px;
  }
  
  #list>ul>li>a {
  	padding : 7px 13px;
  }
  
  #display_tlist {
  	min-height: 110%;
  	max-height: 110%;
  	overflow-y: auto;
  }
  
  #jh_table {  
  	text-align: center;
  	font-size: 92%;
  }
 
  .jh_sctime {
  	width: 10% !important;	
  	display: table-cell !important;
  	table-layout: fixed;
  }
 
 #jh_table>thead>tr>td {
 	padding : 8px;
 	width: 30% ;
 	display : none;
 }
 
 #jh_table>tbody>tr>td {
 	padding : 8px;
 	width: 30% ;
 	display : none;
 }

  
  .view {
  	display: table-cell !important;
  }
 
 .jh_btn_left, .jh_btn_right {
	margin: 0;
	color: blue;
	cursor: pointer;
 }
  
 .ti_on_sc1{
 	border: 1px solid #3399ff;
 	background-color: #cce6ff;
 	padding : 0;
 	font-size: 10pt !important;
 }
 .ti_on_sc1 img{
 	margin-top: 2px;
 	margin-bottom: 2px;
 	height: 24px !important;
 	width: 24px !important;
 }
 
 .ti_on_sc2{
 	border: 1px solid #e6005c;
 	background-color: #ffcce0;
 	padding : 0;
 	font-size: 10pt !important;
 }
 
 .ti_on_sc2 img{
 	margin-top: 2px;
 	margin-bottom: 2px;
 	height: 24px !important;
 	width: 24px !important;
 }
 .ti_on_sc3{
 	border: 1px solid #0033cc;
 	background-color: #ccd9ff;
 	padding : 0;
 	font-size: 10pt !important;
 }
 
 .ti_on_sc3 img{
 	margin-top: 2px;
 	margin-bottom: 2px;
 	height: 24px !important;
 	width: 24px !important;
 }
 .ti_on_sc4{
 	border: 1px solid #ff5c33;
 	background-color: #ffd6cc;
 	padding : 0;
 	font-size: 10pt !important;
 }
  
 .ti_on_sc4 img{
 	margin-top: 2px;
 	margin-bottom: 2px;
 	height: 24px !important;
 	width: 24px !important;
 }
  
 .copy {
 	border: 1px solid #ddd;
 	border-top: none;
 	font-size: 12pt;
 }
 
 .gmselect {
     margin: 10px;
    z-index: 0;
    position: absolute;
    cursor: pointer;
    left: 0px;
    top: 0px;
 }
  
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script type="text/javascript">


	var sc_idx = <%=request.getAttribute("sc_idx")%>;

	var webSocket = new WebSocket("ws://192.168.30.14:9090/triplan/websocket"); // 서버 주소

	//웹 소켓이 연결되었을 때 호출되는 이벤트
	webSocket.onopen = function(message){
		alert("연결성공");
	    webSocket.send("<%=member.getUserid()%>");
	};
	//웹 소켓이 닫혔을 때 호출되는 이벤트
	webSocket.onclose = function(message){
		webSocket = new WebSocket("ws://192.168.30.14:9090/triplan/websocket");
		alert("연결이 끊겼습니다.");
	};
	//웹 소켓이 에러가 났을 때 호출되는 이벤트
	webSocket.onerror = function(message){
		 alert(message); 
	};
	//웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트
	webSocket.onmessage = function(message){
		jh_read(sc_idx);
	};
	//Send 버튼을 누르면 실행되는 함수
	function save_sc(){
	    webSocket.send(sc_idx+"");
	}
	//웹소켓 종료
	function disconnect(){
		alert("연결종료");
	}
	
	$(document).ready(function(){
	
		$("#totalscreen").css("min-height",($(window).height()-55)+"px");
		jh_read(sc_idx);
		
		$("#sc_searchWord").focus(function(){
			$(this).val("");
		})
		
		var j = 0;
		
		$(".search").focus(function(){
			
			$(this).keydown(function(event){
				if(event.keyCode == 13)
				{
					jh_getTourinfo('0');
				}
			})
			
		})
		

		$("#openIcon").click(function(){
	         
	         if(j == 0) {
	            $("#chatscreen").css("border-width",1);
	            chatopen($("#leftscreen"),0,$("#chatscreen"),2.5,97.5);
	            j = 999;
	            setTimeout(function(){
	               $("#chatroom").show();
	               j = 1;
	                },350);
	         } 
	         $("#openIcon").hide();
	         $("#closeIcon").show();
	      })
		
	      $("#closeIcon").click(function(){
	         
	    	  if(j == 1){
		            $("#chatroom").hide();
		            chatclose($("#leftscreen"),-12,$("#chatscreen"),21.1,78.9);
		            j = 999;
		               setTimeout(function(){
		                   $("#chatscreen").css("border-width",0);
		                  j = 0;
		                },350);
		         }
		         $("#closeIcon").hide();
		         $("#openIcon").show();
	      })
		
	})

	var tdcount;
	var viewnum = 1;
	var sc_tourcount = 0;
	var sc_size = 0
    var touridxarr = new Array();
	var infowindows = new Array();
	var infowindowcount = 0;
	var openinfowindow = 0;
	
	var map;
/////////////////////////

	function initialize(inscarr)
   {
	   var mycenterX = $(inscarr).find(".tx").val();
	   var mycenterY = $(inscarr).find(".ty").val();
	   
	   var mycenter = new google.maps.LatLng(mycenterX, mycenterY);
	   
	   var mapProp = {
	     center:mycenter,
	     zoom: 8,
	     mapTypeId:google.maps.MapTypeId.ROADMAP
	     };
	    
	   map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	   
	   var t_idx = $(inscarr).find(".t_idx").val();
	   var t_name = $(inscarr).find(".t_name").text();
	   var t_type = $(inscarr).find(".t_type").val();
	   var t_rating = $(inscarr).find(".t_rating").val();
	   var tx = $(inscarr).find(".tx").val();
	   var ty = $(inscarr).find(".ty").val();
	   
	   add_map(inscarr,t_idx,t_name,t_type,t_rating,tx,ty);
   }
	   /////////////////////////////////
	
	
	function jh_write(sc_idx) {
		
		$(".jh_btn_left").remove();
		$(".jh_btn_right").remove();
		   
		var table = document.getElementById("timeTable");
		var td = table.getElementsByTagName("td");
		var tdarr = new Array();
		
		for(var i=0; i<td.length; i++)
		{
			tdarr[i] = $(td[i]).html();	
		}
		
		lr_btn_loca();
		
 		$.ajax({
 			  url: "/triplan/schedule_Save.tp",
		      type: "POST",
		      dataType : "json",
		      data: {
		    	  sc_idx : sc_idx,
		    	  td : JSON.stringify(tdarr),
		    	  sc_days : tdcount
		      },
		      complete: function(data){
				save_sc();
		      },
		      error : function(xhr, status, error) {
	            
	           }
		  }); 
		
	}
	
	function jh_read(sc_idx) {
		
 		$.ajax({
 			  url: "/triplan/schedule_Load.tp",
		      type: "POST",
		      data: {sc_idx : sc_idx, edit : "y"},
		      dataType : "html",
		      success: function(data){
  					$("#jh_table").html(data);
					 tdcount = parseInt($("#collen").val());
					 lr_btn_loca()
					 if(tdcount < 5) $(".jh_btn_right").text("+");
					 sc_init();
		      }
		      
		  }); 
		
	}
	
	function jh_appendTd() {
		var end_date = $("#jh_table thead .jh_sc_"+(tdcount-1)).html();
		end_date = end_date.substr(0,10).trim();

		$.ajax({
			 url: "/triplan/appendDate.tp",
		      type: "POST",
		      data: {end_date : end_date},
		      success: function(data){
		    	  var date = data.trim();
		  	 	  $("#jh_table tr").append("<td class='jh_sc_"+tdcount+"' ondrop='drop(event)' ondragover='allowDrop(event)' ondragleave='dragleave(event)' ></td>");
				  $("#jh_table thead .jh_sc_"+tdcount).html(date);
				  tdcount = tdcount + 1;
		    	  jh_right();
		    	  jh_write("${sc_idx}");
		      }
		})
		

		
	}
	
	function jh_left() {
		
		if(viewnum > 1){
			$(".jh_sc_"+(viewnum-1)).addClass("view");
			$(".jh_sc_"+(viewnum+2)).removeClass("view");
			viewnum = viewnum - 1;
			lr_btn_loca()
			if(viewnum < tdcount-3)
			{
				$(".jh_btn_right").html("&nbsp;>&nbsp;&nbsp;");
			}
		}
		
	}
	
	function jh_right() {
		
		if(viewnum < tdcount-3)
		{
			$(".jh_sc_"+(viewnum+3)).addClass("view");
			$(".jh_sc_"+(viewnum)).removeClass("view");
			viewnum = viewnum + 1;
			lr_btn_loca()
			if(viewnum == tdcount-3)
			{
				$(".jh_btn_right").html("&nbsp;+&nbsp;&nbsp;");
			}
		}
		
		else 
		{
			var yn = confirm("날짜를 추가하시겠습니까?");
			if(yn == true) 
			{
				jh_appendTd();
			}
		}
		
	}
	
	function lr_btn_loca()
	{
		$("#jh_table>thead>tr>td").css("text-align","center");
		$(".jh_btn_left").remove();
		$(".jh_btn_right").remove();
		var theadleft = $("#jh_table").find("thead").find(".jh_sc_"+viewnum);
		var theadright = $("#jh_table").find("thead").find(".jh_sc_"+(viewnum+2));
		$(theadleft).css("text-align","left");
		$(theadright).css("text-align","right");
		$(theadleft).html("<span class='jh_btn_left' onclick='jh_left()' style=' margin-right:12%;'>&nbsp;&nbsp;<&nbsp;</span>"+$(theadleft).html());
		$(theadright).html($(theadright).html()+"<span class='jh_btn_right' onclick='jh_right()' style='margin-left:12%;'>&nbsp;>&nbsp;&nbsp;</span");
	}
	
	function chatclose(ls,lsl,div,width,left)
	{
		if(width > 2.5)
		{
			$(div).css("left",(left+0.422)+"%");
			$(div).css("width",(width-0.422)+"%");
			$(ls).css("margin-left",(lsl+0.24)+"%");
			
			setTimeout(function(){
				chatclose(ls,(lsl+0.24),div,(width-0.422),(left+0.422));  	
	        },1);
		}
	}
	
	function chatopen(ls,lsl,div,width,left)
	{
		if(width < 21.1)
		{
			$(div).css("left",(left-0.422)+"%");
			$(div).css("width",(width+0.422)+"%");
			$(ls).css("margin-left",(lsl-0.24)+"%");
			setTimeout(function(){
				chatopen(ls,(lsl-0.24),div,(width+0.422),(left-0.422));  	
	        },1);
		}
	}
	
	function jh_getTourinfo(t_type){
		
		var searchWord = $("#sc_searchWord").val().trim();
		
		if(searchWord != null && searchWord != "")
		{
			
			if(searchWord == "")
			{
				alert("검색어를 입력하세요!");
				location.href="/triplan/searchArea.tp?de_area_name=" + mycenter_name;
			}
			
			else if(searchWord == "경기" || searchWord == "경기도"
				 || searchWord == "강원" || searchWord == "강원도"
				 || searchWord == "전라" || searchWord == "전라도"
				 || searchWord == "경상" || searchWord == "경상도"
				 || searchWord == "충청" || searchWord == "충청도")
			{
				alert("지역명이 정확하지 않습니다.");	
				location.href="/triplan/searchArea.tp?de_area_name=" + mycenter_name;
			}
			
			else if(searchWord.length < 2)
			{
				alert("지역명이 정확하지 않습니다.");	
				location.href="/triplan/searchArea.tp?de_area_name=" + mycenter_name;
			}
			else
			{
		
			var form_data={ area : searchWord
					 		,t_type :t_type}		
				
				$.ajax({url: "/triplan/sc_getTourinfo.tp",
				      type: "GET",
				      data: form_data, // 서버로 보내는 ajax 요청 데이터
				      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
				      success: function(data){
				    	  
				    	  $(".active").removeClass("active");
				    	  $("#jh_all").addClass("active");
				    	  $("#display_tlist").html(data);  				
				    	  
				      },error:function(data){
				    	  
				    	  alert("지역명이 정확하지 않습니다.");	
				      }
				  });// end of $.ajax();
			}
		}
		else
		{
			$("#display_tlist").html("");
		}
	}
	
	
	
	function jh_getWish(){
	 
	 	 $.ajax({url: "/triplan/cd_getWishRegion.tp",
	    	 
	 	  type: "GET",
	      dataType: "html", 
	      data: { areano : 100 },
	      success: function(data){
	   	   
			$("#display_tlist").html(data);  			
			           
	      }// end of success----------------------
	  });// end of $.ajax();----------------------	
		
	}
	
	function allowDrop(ev) {
		var html =  $(ev.target).html();
		if(html == "")
		{
			$(ev.target).css("background-color","#f2f2f2");
		}
	    ev.preventDefault();
	}
	
	function dragleave(ev) {
		var html =  $(ev.target).html();
		if(html == "")
		{
			$(ev.target).css("background-color","white");
		}
	    ev.preventDefault();
	}

	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
	    ev.preventDefault();
	    var data = ev.dataTransfer.getData("text");
	    var tn = document.getElementById(data);
	    
	    var target = event.target;
	    
	    var html = $(target).html();
	    
 		if($(tn).hasClass("copy"))
		{
 			if(html == "")
 			{
 				$(target).css("background-color","white");
 			    $(target).css("padding","2px");
 			    
	 			var copy_tn = ev.target.appendChild(tn.cloneNode(true));
	 			$(copy_tn).removeClass("copy");
	 			$(copy_tn).addClass("insc");
	 			$(copy_tn).append("<div style='display: inline-block; position: relative; left:87px; margin-top: -23px; color:blue; font-weight: bold;' onclick='romvetn(this);' >X</div>");
	 			var t_idx = $(copy_tn).find(".t_idx").val();
	 			var t_name = $(copy_tn).find(".t_name").text();
	 			var t_type = $(copy_tn).find(".t_type").val();
	 			var tx = $(copy_tn).find(".tx").val();
	 			var ty = $(copy_tn).find(".ty").val();
	 			var t_rating = $(copy_tn).find(".t_rating").val();
	
	 			$(copy_tn).find(".view_t_type").remove();
	 			
	 			if(t_type == "1")
	 			{
	 				$(copy_tn).addClass("ti_on_sc1"); 				
	 			}
	 			else if(t_type == "2")
	 			{
	 				$(copy_tn).addClass("ti_on_sc2");
	 			}
	 			else if(t_type == "3")
	 			{
	 				$(copy_tn).addClass("ti_on_sc3");
	 			}
	 			else
	 			{
	 				$(copy_tn).addClass("ti_on_sc4");
	 			}
	 		    $(copy_tn).attr("id","sc_tour"+sc_tourcount);
	 		    sc_tourcount++;
	 		   	refresh_map(copy_tn,t_idx,t_name,t_type,t_rating,tx,ty);
	 		    jh_write("${sc_idx}");	 		 
 			}
 			else
 			{
 				alert("다른 일정이 존재합니다.")
 			}
		}
		else
		{
			if(html == "")
 			{
				$(target).css("background-color","white");
 			    $(target).css("padding","2px");
				ev.target.appendChild(tn);
				jh_write("${sc_idx}");
 			}
			else
			{
				alert("다른 일정이 존재합니다.")				
			}

		} 
	}
	
	function refresh_map(insc,t_idx,t_name,t_type,t_rating,tx,ty)
	{
		 var mycenterX = tx;
		 var mycenterY = ty;
		 var mycenter = new google.maps.LatLng(mycenterX, mycenterY);
		 map.setOptions({ 'center' : mycenter, 'zoom' : 16});
		 google.maps.event.addDomListener(window, 'load', add_map(insc,t_idx,t_name,t_type,t_rating,tx,ty));
		 
	}
	
	function add_map(insc,t_idx,t_name,t_type,t_rating,tx,ty)
	{
		var mypositionX = tx;
		var mypositionY = ty;
		
		var myposition = new google.maps.LatLng(mypositionX, mypositionY);
		var myposition_name = t_name+"";
		  
		var iconImage = "";
		var category = 0;
		
		if(t_type == "1")
		{
			iconImage = "/triplan/resources/image/tours.png";
		}
		
		else if(t_type == "2")
		{
			iconImage = "/triplan/resources/image/restaurants.png";
		}
		
		else if(t_type == "3")
		{
			iconImage = "/triplan/resources/image/lounges.png";
		}
		
		else if(t_type == "4")
		{
			iconImage = "/triplan/resources/image/nightlife.png";
		}
		
		  var marker=new google.maps.Marker({
		  position:myposition,
		  icon:iconImage
		 });
			marker.setMap(map);
		
		var rating_str = t_rating;
		var rating_star = "☆☆☆☆☆";
		
		var rating_num = parseFloat(rating_str);
		rating_num = Math.round(rating_num);
		
		if(rating_num == 1)
		{
			rating_star = "★☆☆☆☆";
		}
		
		else if(rating_num == 2)
		{
			rating_star = "★★☆☆☆";
		}
		
		else if(rating_num == 3)
		{
			rating_star = "★★★☆☆";
		}
		
		else if(rating_num == 4)
		{
			rating_star = "★★★★☆";
		}
		
		else if(rating_num == 5)
		{
			rating_star = "★★★★★";
		}
			
		var html = myposition_name + " (" + rating_star + ") <br/>";
   		html += "<img style='width:100%; height:120px;' src='/triplan/TourInfo/images/"+t_idx+"/title.jpg' /><br/>";
   		html += "<p></p>";
	    html += "<a onClick='goDetail("+t_idx+");' style='cursor: pointer;'>상세정보보기</a>";
			
		var infowindow = new google.maps.InfoWindow({
			content:html,
			maxWidth: 200
		});
		
		infowindows.push(infowindow);
		var temp = infowindowcount;
		
		google.maps.event.addListener(marker, 'click', function() {
			infowindows[openinfowindow].close();
			infowindow.open(map,marker);
			openinfowindow = temp; 
		});
		
		$(insc).click(function(){
			  var test = infowindowcount;
			  infowindows[openinfowindow].close();
	    	  infowindow.open(map,marker);
	    	  openinfowindow = temp;
	      })
	      
		sc_size++;
		infowindowcount++;
	}
	
	function sc_init()
	{
		var inscarr = document.getElementsByClassName("insc");
		
		if(inscarr[0] != null)
		{
			$(inscarr[0]).attr("id","sc_tour"+(sc_tourcount++));
			$(inscarr[0]).parent().css("padding","2px");
			touridxarr[0] = $(inscarr[0]).find(".t_idx").val();
			google.maps.event.addDomListener(window, 'load', initialize(inscarr[0]));
			 
		 	for(var i = 1; i < inscarr.length; i++)
			{
		 		$(inscarr[i]).attr("id","sc_tour"+(sc_tourcount++));
				$(inscarr[i]).parent().css("padding","2px");
				touridxarr[i] = $(inscarr[i]).find(".t_idx").val();
				
				var t_idx = $(inscarr[i]).find(".t_idx").val();
				var t_name = $(inscarr[i]).find(".t_name").text();
				var t_type = $(inscarr[i]).find(".t_type").val();
				var t_rating = $(inscarr[i]).find(".t_rating").val();
				var tx = $(inscarr[i]).find(".tx").val();
				var ty = $(inscarr[i]).find(".ty").val();
				
				google.maps.event.addDomListener(window, 'load', add_map(inscarr[i],t_idx,t_name,t_type,t_rating,tx,ty));
			}
		 	 
		}
		else
		{
			google.maps.event.addDomListener(window, 'load', noinsc_map());
		}
	}
	
	   function noinsc_map()
	   {
		   var mycenterX = 36.568993;
		   var mycenterY = 128.032776;
		   
		   var mycenter = new google.maps.LatLng(mycenterX, mycenterY);
		   
		   var mapProp = {
		     center:mycenter,
		     zoom: 7,
		     mapTypeId:google.maps.MapTypeId.ROADMAP
		     };
		    
		   map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		}
	   
		function goDetail(t_idx)
		{
			var url = "detailTourInfo.tp?t_idx="+t_idx;
			window.open(url, "detailTourInfo",
					"width=665px, height=750px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no"
			);
		}
	
		function romvetn(tn)
		{
			var yn = confirm($(tn).parent().find(".t_name").text()+"를 지우시겠습니까?");
			if(yn == true)
			{
				$(tn).parent().remove();
				jh_write("${sc_idx}");
			}
			
		}
		
		
		
		function invite(){
		
			var url = "inviteSchedule.tp?sc_idx="+${sc_idx};
			window.open(url, "Invite",
					"width=665px, height=700px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no"
			);
	
		}
		

		function map_select()
		{
				$("#googleMap").find(".gm-style").append("<div class='gmnoprint gmselect' style='border: 1px solid red; width: 150px; height: 150px'><div>");
		}
		
</script>
<div id="screen">
	<jsp:include page="../top.jsp" />
	<div id="totalscreen">
	    <div id="leftscreen">
      		<div id="googleMap"></div>
      		<div id="edsc_search" style="width: 100%; padding-left: 4%;" >
      			<button type="button" class="btn btn-default" onclick="invite()" style="float: left; margin-top: 10px; height: 30px !important; margin-right: 3%; padding: 1px 3px 1px 3px !important;" >일정초대</button>
      			<input type="text" class="search" id="sc_searchWord" style="height: 30px !important; width: 56% !important">
					<button style="height: 30px !important; padding: 0px 9px !important; " type="button" class="btn btn-default btn-lg btn-search" onClick="jh_getTourinfo('0');"><span class="glyphicon glyphicon-search" style="top: 1px !important;"></span> <span class="span-search"></span>검색</button>
      		</div>
	      	<div id="list">
	      		<ul class="nav nav-tabs">
			  		<li id="jh_all" class="active"><a data-toggle="tab" onclick="jh_getTourinfo('0');">전체</a></li>
				  	<li><a data-toggle="tab" onclick="jh_getWish();">위시리스트</a></li>
				  	<li><a data-toggle="tab" onclick="jh_getTourinfo('1');">관광</a></li>
				  	<li><a data-toggle="tab" onclick="jh_getTourinfo('2');">음식</a></li>
				  	<li><a data-toggle="tab" onclick="jh_getTourinfo('3');">숙박</a></li>
				  	<li><a data-toggle="tab" onclick="jh_getTourinfo('4');">기타</a></li>
			  	</ul>
				<div id="display_tlist">
					<c:if test="${tourinfoList == null || empty tourinfoList }"><div>지역정보가 없습니다.</div></c:if>
					<c:if test="${tourinfoList != null && not empty tourinfoList}">
					<c:forEach var="vo" items="${tourinfoList}" varStatus="sts" >
					<div id="ti${sts.index}"  draggable="true" ondragstart="drag(event)" class="copy">
					<div style="width: 100%;">
						<img src="/triplan/TourInfo/images/${vo.t_idx}/title.jpg" style="height: 10%; width: 10%;">
						<span class="t_name">${vo.t_name}</span>
						<c:if test="${vo.t_type == '1'}">
							 <span style="color: #3399ff" class="view_t_type">관광</span>
						</c:if>
						<c:if test="${vo.t_type == '2'}">
							 <span style="color: #e6005c" class="view_t_type">음식</span>
						</c:if>
						<c:if test="${vo.t_type == '3'}">
							 <span style="color: #0033cc" class="view_t_type">숙박</span>
						</c:if>
						<c:if test="${vo.t_type == '4'}">
							 <span style="color: #ff5c33" class="view_t_type">기타</span>
						</c:if>
						<input type="hidden" value="${vo.t_idx}" class="t_idx"/>
						<input type="hidden" value="${vo.t_type}" class="t_type"/>
						<input type="hidden" value="${vo.t_rating}" class="t_rating"/>
						<input type="hidden" value="${vo.tx}" class="tx"/>
						<input type="hidden" value="${vo.ty}" class="ty"/>
					</div>
					</div>
					</c:forEach>	
					</c:if>	
				</div>
     	 	</div>
	    </div>
	
	    <div id="rightscreen">
			<div id="timeTable">
			  <table id="jh_table" class="table table-bordered" style="color: #000000;">
			  </table>
			</div>
		</div>
		
		<div>
			<div id="chatscreen">
			<div id="openIcon" style="cursor: pointer; width:13%; height:15%; position:absolute; left:2px; top:0px; z-index:1;">
				<img src="/triplan/resources/image/chat.png" style="width:30px; height:30px;">
				<br/><span style="color:gray;">open</span>
			</div>
				<div id="chatroom">
					<div id="closeIcon" style="cursor: pointer; width:13%; height:13%; position:absolute; left:2px; top:0px; z-index:1;">
						<img src="/triplan/resources/image/chat.png" style="width:30px; height:30px;">
						<br/><span style="color:gray;">close</span>
					</div>
					<div style="width:100%; height:97.5%; position:relative;"><jsp:include page="chat.jsp" /></div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="../foot.jsp" />
</div>