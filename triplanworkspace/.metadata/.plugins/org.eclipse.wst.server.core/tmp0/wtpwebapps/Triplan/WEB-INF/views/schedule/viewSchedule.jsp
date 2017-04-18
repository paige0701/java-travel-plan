<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	left: 100%;
  	width: 0%;
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
  	padding-left: 10%;
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
  	min-height: 130%;
  	max-height: 130%;
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
  
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>
<script type="text/javascript">

	$(document).ready(function(){
	
		jh_read(<%=request.getAttribute("sc_idx")%>);
		
		var j = 0;
		
	})

	var touridxarr = new Array();
	var map;
	var tdcount;
	var viewnum = 1;
	var infowindows = new Array();
	var infowindowcount = 0;
	var openinfowindow = 0;

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
	   
	   addMap(inscarr)
   }
   
   function addMap(inscarr)
   {
	      var mypositionX = $(inscarr).find(".tx").val();
	      var mypositionY = $(inscarr).find(".ty").val();
	   
	      var myposition = new google.maps.LatLng(mypositionX, mypositionY);
	      
	      var myposition_name = $(inscarr).find(".t_name").text();
	      
			var iconImage = "";
			var category = 0;
			
			if($(inscarr).find(".t_type").val() == "1")
			{
				iconImage = "/triplan/resources/image/tours.png";
			}
			
			else if($(inscarr).find(".t_type").val() == "2")
			{
				iconImage = "/triplan/resources/image/restaurants.png";
			}
			
			else if($(inscarr).find(".t_type").val() == "3")
			{
				iconImage = "/triplan/resources/image/lounges.png";
			}
			
			else if($(inscarr).find(".t_type").val() == "4")
			{
				iconImage = "/triplan/resources/image/nightlife.png";
			}
	      
	        var marker=new google.maps.Marker({
	        position:myposition,
	        icon:iconImage
	        });
	      
	        marker.setMap(map);
			
			var rating_str = $(inscarr).find(".t_rating").val();
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
	   		html += "<img style='width:100%; height:120px;' src='/triplan/TourInfo/images/"+$(inscarr).find(".t_idx").val()+"/title.jpg' /><br/>";
	   		html += "<p></p>";
		    html += "<a onClick='goDetail("+$(inscarr).find(".t_idx").val()+");' style='cursor: pointer;'>상세정보보기</a>";
	        
	        
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
	      
	      $(inscarr).click(function(){
	    	  infowindows[openinfowindow].close();
				infowindow.open(map,marker);
				openinfowindow = temp; 
	      })
	      
	      infowindowcount++;
   }
	

	function jh_read(sc_idx) {
		
 		$.ajax({
 			  url: "/triplan/schedule_Load.tp",
		      type: "POST",
		      data: {sc_idx : sc_idx},
		      dataType : "html",
		      success: function(data){
  					$("#jh_table").html(data);
					 tdcount = parseInt($("#collen").val());
					 if(tdcount > 4)
				     {
					 	lr_btn_loca();
				     }
					 sc_init();
		      }
		      
		  }); 
		
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
		else {
			
			alert("처음 날짜입니다.");
			
		} 
	}
	
	function jh_right() {
		
		if(viewnum < tdcount-3)
		{
			$(".jh_sc_"+(viewnum+3)).addClass("view");
			$(".jh_sc_"+(viewnum)).removeClass("view");
			viewnum = viewnum + 1;
			lr_btn_loca()
		}
		
		else 
		{
			alert("마지막 날짜입니다.");
		}
		
	}
	
	function lr_btn_loca()
	{
		$(".jh_btn_left").remove();
		$(".jh_btn_right").remove();
		$("#jh_table>thead>tr>td").css("text-align","center");
		var theadleft = $("#jh_table").find("thead").find(".jh_sc_"+viewnum);
		var theadright = $("#jh_table").find("thead").find(".jh_sc_"+(viewnum+2));
		$(theadleft).css("text-align","left");
		$(theadright).css("text-align","right");
		$(theadleft).html("<span class='jh_btn_left' onclick='jh_left()' style=' margin-right:12%;'>&nbsp;&nbsp;<&nbsp;</span>"+$(theadleft).html());
		$(theadright).html($(theadright).html()+"<span class='jh_btn_right' onclick='jh_right()' style='margin-left:12%;'>&nbsp;>&nbsp;&nbsp;</span");
	}
	
	
	function edit_sc(sc_idx){
		location.href = "edit_schedule.tp?sc_idx="+sc_idx;
	}
	
	function sc_init()
	{
		var inscarr = document.getElementsByClassName("insc");
		
			if(inscarr[0] != null)
			{
				$(inscarr[0]).parent().css("padding","2px");
				touridxarr[0] = $(inscarr[0]).find(".t_idx").val();
				google.maps.event.addDomListener(window, 'load', initialize(inscarr[0]));
				for(var i = 1; i < inscarr.length; i++)
				{
					$(inscarr[i]).parent().css("padding","2px");
					touridxarr[i] = $(inscarr[i]).find(".t_idx").val();
					google.maps.event.addDomListener(window, 'load', addMap(inscarr[i]));
				}
				getTour("0");
				
				
			}
			else
			{
				google.maps.event.addDomListener(window, 'load', noinsc_map);
			}
	}
	
	function getTour(t_type)
	{
		$.ajax({
			  url: "/triplan/getReadScheduleTour.tp",
		      type: "POST",
		      data: {t_idx : JSON.stringify(touridxarr),
		    	     t_type : t_type
		    	     },
		      dataType : "html",
		      success: function(data){
					$("#display_tlist").html(data);
					$(".copy").click(function(){
						
						var t_idx = $(this).find(".t_idx").val();
						goDetail(t_idx); 
						
					})
		      }
		      
		  }); 
	}
	
	function goDetail(t_idx)
	{
		var url = "detailTourInfo.tp?t_idx="+t_idx;
		window.open(url, "detailTourInfo",
				"width=665px, height=750px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no"
		);
	}
	
</script>
<div id="screen">
	<jsp:include page="../top.jsp" />
	<div id="totalscreen">
	    <div id="leftscreen">
      		<div id="googleMap"></div>
	      	<div id="list">
		      	<c:if test="${ck_sc == 1}">
		      			<button onclick="edit_sc(${sc_idx})" class="btn btn-default"  style="width:100%;  margin-bottom:2%">수정하기</button>
		      	</c:if>
		      	<ul class="nav nav-tabs">
				  	<li class="active"><a data-toggle="tab" onclick="getTour('0');">전체</a></li>
				  	<li><a data-toggle="tab" onclick="getTour('1');">관광</a></li>
				  	<li><a data-toggle="tab" onclick="getTour('2');">음식</a></li>
				  	<li><a data-toggle="tab" onclick="getTour('3');">숙박</a></li>
				  	<li><a data-toggle="tab" onclick="getTour('4');">기타</a></li>
			  	</ul>
			  	<div id="display_tlist"></div>
   	 		</div>
	    </div>
	
	    <div id="rightscreen">
			<div id="timeTable">
			  <table id="jh_table" class="table table-bordered" style="color: #000000;">
			  </table>
			</div>
		</div>
	</div>
	<jsp:include page="../foot.jsp" />
</div>