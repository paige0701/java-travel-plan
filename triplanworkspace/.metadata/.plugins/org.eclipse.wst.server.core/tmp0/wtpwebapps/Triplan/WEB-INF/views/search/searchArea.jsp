<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.model.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.0.0.js" ></script>

<style>

	#totalscreen{
		padding-top: 52px;
		position: relative;
		min-height: 100%;
		height: auto;
		clear: both;
	}

	#leftscreen {
		width:35%;
		float:left;
		margin-left: 5%;
		padding-left:10px;
		padding-top: 1.5%;
		border:0px solid orange;
 	}
  
	#rightscreen {
		width:55%;
		float:left;
		margin-right: 5%;
		padding-right:10px;
		padding-top:2%;
		
	}
	
	#gh_searchArea-form {
		width: 40%;
		top: 52px;	
		position:absolute;
		margin-bottom: -5%;
		z-index: 1000;
	}
	
	#googleMap {
		 width:100%;
		 height: 80%;
		 /* margin-bottom: 4.5%; */
		 margin-left:2%;
	
		 border:0px solid orange;
		 border-radius: 1% !important;
		 
	}
	
	#timeTable {
		 width:100%;
		 float:left;
		 padding-left:10px;
	}
	
	#list {
		 margin-top: 47px;
		 width:100%;
		 height: 70%;
		 overflow:hidden;
		 padding-right:10px;
	}
	
</style>

<script>

var mycenterX = "${advo.x}";
var mycenterY = "${advo.y}";

var mycenter=new google.maps.LatLng(mycenterX, mycenterY);

var mycenter_name = "${advo.de_area_name}";

function initialize()
{
	var mapProp = {
	  center:mycenter,
	  zoom:10,
	  mapTypeId:google.maps.MapTypeId.ROADMAP
	  };
	
	var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	
	<%
		int count = 1;
		List<TourInfoVO> tlist = (List<TourInfoVO>)request.getAttribute("tourinfoList");
		for(TourInfoVO tvo : tlist)
		{
	%>
	
			var mypositionX = <%= tvo.getTx() %>;
			var mypositionY = <%= tvo.getTy() %>;
		
			var myposition = new google.maps.LatLng(mypositionX, mypositionY);
			
			var myposition_name = "<%= tvo.getT_name() %>";
			var iconImage = "";
			var category = 0;
			
			if(<%= tvo.getT_type() %> == "1")
			{
				iconImage = "/triplan/resources/image/tours.png";
			}
			
			else if(<%= tvo.getT_type() %> == "2")
			{
				iconImage = "/triplan/resources/image/restaurants.png";
			}
			
			else if(<%= tvo.getT_type() %> == "3")
			{
				iconImage = "/triplan/resources/image/lounges.png";
			}
			
			else if(<%= tvo.getT_type() %> == "4")
			{
				iconImage = "/triplan/resources/image/nightlife.png";
			}
			
			var marker<%=count%>=new google.maps.Marker({
			  position:myposition,
			  icon:iconImage
			  });
			
			marker<%=count%>.setMap(map);
			
			$("#menutop").click(function(){
				
				marker<%=count%>.setMap(map);
			});
			
			$(".tour").click(function(){
				
				marker<%=count%>.setMap(null);
				
				if(<%= tvo.getT_type() %> == "1")
				{
					marker<%=count%>.setMap(map);
				}
			});
			

			$(".food").click(function(){
				
				marker<%=count%>.setMap(null);
				
				if(<%= tvo.getT_type() %> == "2")
				{
					marker<%=count%>.setMap(map);
				}
			});
			
			$(".hotel").click(function(){
				
				marker<%=count%>.setMap(null);
				
				if(<%= tvo.getT_type() %> == "3")
				{
					marker<%=count%>.setMap(map);
				}
			});
			

			$(".show").click(function(){
				
				marker<%=count%>.setMap(null);
				
				if(<%= tvo.getT_type() %> == "4")
				{
					marker<%=count%>.setMap(map);
				}
			});
			
 				<%
 				List<String> t_detail_list = new ArrayList<String>();
					if(tvo.getT_detail() != null)
					{
 					String t_detail = tvo.getT_detail();
 					if(tvo.getT_detail().length() > 30)
 					{
 						t_detail = tvo.getT_detail().substring(0, 30) + "...";
 					}
 					
 					Scanner sc = new Scanner(t_detail);
 					
 					while(sc.hasNextLine())
 					{
 						t_detail_list.add(sc.nextLine());
 					}	 				
 					sc.close();
					}
 				%> 
			
 				var rating_str = "<%= tvo.getT_rating() %>";
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
		   		html += "<img style='width:100%; height:120px;' src='/triplan/TourInfo/images/<%= tvo.getT_idx() %>/title.jpg' /><br/>";
		   		html += "<p>";
			   	<% 
					if(tvo.getT_detail() != null)
					{
			   		for(int i=0; i < t_detail_list.size() ; i++)
			   		{ 
			   			
			   		%>
			   			html += "<%= t_detail_list.get(i) %>" 	
			   		<%
			   		} 
		   		}
		   		%>
		   		html += "</p>";
			    html += "<a onClick='goDetail(<%= tvo.getT_idx() %>);' style='cursor: pointer;'>상세정보보기</a>";
			
			var infowindow<%= count %> = new google.maps.InfoWindow({
						content:html,
						maxWidth: 200
				  });
			
			google.maps.event.addListener(marker<%=count%>, 'click', function() {
				  		infowindow<%=count%>.open(map,marker<%=count%>);
				  });
			
			$("#myplan>table>tbody>tr").find("."+<%=count%>).click(function(){
				infowindow<%=count%>.open(map,marker<%=count%>);
			})

			<%
			count++;
		} %>
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
</script>


<script type="text/javascript">

var de_area_nameArr;

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
							resultHtml += "<a href='javascript:mychoose(\""+de_area_nameArr[i]+"\")'>"+de_area_nameArr[i] +"</a><br/>";
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


<script type="text/javascript">

	$(document).ready(function(){

		$(".search").focus(function(){
			
			$(this).keydown(function(event){
				if(event.keyCode == 13)
				{
					goSearch();
					event.preventDefault();
				}
			})
			
		})
		
	$("footer").css("margin-top","-55px");
		
		$("#de_area_name").focus(
			    function(){
			        $(this).val('');
			    });
	
		$(".table").mouseover(function(){
			$("#list").css("overflow", "auto");
		});
		
		
		$(".table").mouseout(function(){
			
			$("#list").css("overflow", "hidden");
		});
	})
	
	function goSearch()
	{	
		
		// 유효성 검사!
		var de_area_name = document.getElementById("de_area_name").value;
		
		if(de_area_name == "")
		{
			alert("검색어를 입력하세요!");
			location.href="/triplan/searchArea.tp?de_area_name=" + mycenter_name;
		}
		
		else if(de_area_name == "경기" || de_area_name == "경기도"
			 || de_area_name == "강원" || de_area_name == "강원도"
			 || de_area_name == "전라" || de_area_name == "전라도"
			 || de_area_name == "경상" || de_area_name == "경상도"
			 || de_area_name == "충청" || de_area_name == "충청도")
		{
			alert("지역명이 정확하지 않습니다.");	
			location.href="/triplan/searchArea.tp?de_area_name=" + mycenter_name;
		}
		
		else if(de_area_name.length < 2)
		{
			alert("지역명이 정확하지 않습니다.");	
			location.href="/triplan/searchArea.tp?de_area_name=" + mycenter_name;
		}
		
		else
		{
			document.searchFrm.submit();
		}
	
	}
	
	function searchKeep()
	{
		<c:if test="${not empty de_area_name}">
		// 자바스크립트 내에서 "&{colName != null}" 이렇게 하면 오류가 난다.
		// 자바스크립트 내에서는  empty 를 사용해야 한다.
			document.getElementById("de_area_name").value = "${advo.de_area_name}";
		</c:if>
	}
	
	window.onload = function()
	{
		searchKeep();
	}

	function goDetail(t_idx)
	{
		var url = "detailTourInfo.tp?t_idx="+t_idx;
		window.open(url, "detailTourInfo",
				"width=665px, height=750px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no"
		);
	}
	
	
	function getTourinfo(t_type){
		
	var form_data={ area : "${advo.de_area_name}"
			 		,t_type :t_type}		
		
		$.ajax({url: "/triplan/getTourinfo.tp",
		      type: "GET",
		      data: form_data, // 서버로 보내는 ajax 요청 데이터
		      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
		      success: function(data){
		    	  var result = data;
		    	  $("#myplan").empty();
		    	  $("#here1").html(result);  				
					  					
	           
		      },error:function(data){
		    	  
		    	  alert("error");
		      }
		  });// end of $.ajax();
		
	}
	
<%-- 검색어가 남아 있게 하기 ! --%> 
window.onload=function(){
	searchKeep();
}
function searchKeep(){
	
	document.getElementById("de_area_name").value="${advo.de_area_name}";	

}

	
</script>
<div id="screen">

	<jsp:include page="../top.jsp" />

	<section id="totalscreen">
	    <div id="leftscreen">
			<form id="gh_searchArea-form" name="searchFrm" action="/triplan/searchArea.tp" method="get">
			<div class="gh_search-box" align="center" style="z-index:100;">
				<input type="text" class="search search3" id="de_area_name" name="de_area_name" size="30">
				<button type="button" class="btn btn-default btn-lg btn-search" onClick="goSearch();"><span class="glyphicon glyphicon-search"></span> <span class="span-search"></span>검색</button>
				<div id="display" class="search2" style="display:none; text-align:left;">
					<div id="displayList"></div>
				</div>
			</div>
			</form>
	      	<div id="list" style="z-index:-11;">
	      		      	
	      	<ul class="nav nav-tabs" id="tabs" style="width:100%">
			  	<li style="width:15%"  class="all" class="active" id="menutop" ><a  style="font-size:10pt; " data-toggle="tab" href="#myplan" onclick="getTourinfo('0');">전체</a></li>
			  	<li style="width:20%" id="cd_topmenu" class="tour" ><a  style="text-decoration:none ; font-size:10pt; font-weight:bold; color:#3399ff;" data-toggle="tab" href="#mytour" onclick="getTourinfo('1');">관광</a></li>
			  	<li style="width:20%" id="cd_topmenu" class="food" ><a  style="text-decoration:none ; font-size:10pt;font-weight:bold;  color:#e6005c; " data-toggle="tab" href="#myfood" onclick="getTourinfo('2');">음식</a></li>
			  	<li style="width:20%" id="cd_topmenu" class="hotel" ><a style="text-decoration:none ; font-size:10pt;font-weight:bold; color:#0033cc;" data-toggle="tab" href="#myhotel" onclick="getTourinfo('3');">숙박</a></li>
			  	<li style="width:25%" id="cd_topmenu" class="show" ><a style="text-decoration:none ; font-size:10pt;font-weight:bold; color:#ff5c33;" data-toggle="tab" href="#myshow" onclick="getTourinfo('4');">기타</a></li>
		  	</ul>
		  	
		  	<div class="tab-content">
  
		    <div id="myplan" class="tab-pane fade in active" onclick="getTourinfo('0');">
			<table class="table table-condensed" style="width: 100%" >
			
				<thead>
					<tr class="success">
			         	<td style="width: 10%">번호</td>
			         	<td style="width: 30%">상호명</td>
			         	<td style="width: 50%">주소</td>
			         	<td style="width: 10%">분류</td>
			      	</tr>
			    </thead>
			     <tbody>
			      <c:if test="${tourinfoList == null || empty tourinfoList}">
					 <tr><td colspan="4">존재하지 않습니다.</td></tr>
				  </c:if>
				  <c:if test="${tourinfoList != null || not empty tourinfoList}">
				 	 <c:set var="count" value="0"/>
				 	 <c:forEach var="vo" items="${tourinfoList}" varStatus="status">
						  <tr>
						  	<td>${status.index + 1}</td>
						  	<td>${vo.t_name}</td>
						  	<td>${vo.t_addr}</td>
						  	<c:if test="${vo.t_type == '1'}">
								 <td>관광</td>
							</c:if>
							<c:if test="${vo.t_type == '2'}">
								 <td>음식</td>
							</c:if>
							<c:if test="${vo.t_type == '3'}">
								 <td>숙박</td>
							</c:if>
							<c:if test="${vo.t_type == '4'}">
								 <td>기타</td>
							</c:if>
						  </tr>
				  	 </c:forEach>
			  	 </c:if>
		    	</tbody> 
		    	
  		 	</table>
  		 	
  		 	
     	 	</div> 
     	 	
     	 <div id="mytour" class="tab-pane fade" onclick="getTourinfo('1');" ></div>	  	 
     	 <div id="myfood" class="tab-pane fade" onclick="getTourinfo('2');"> </div>	   	 
     	 <div id="myhotel" class="tab-pane fade" onclick="getTourinfo('3');"></div>			 
     	 <div id="myshow" class="tab-pane fade" onclick="getTourinfo('4');"> </div>		
     	 <div id="here1"></div>
     	 	
     	 	</div>
	    </div>
	
	</div>
     	  		 
	    <div id="rightscreen">
		    <div id="googleMap">
		    </div>
		</div>
	</section>
	<jsp:include page="../foot.jsp" />
</div>