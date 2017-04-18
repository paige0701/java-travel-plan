<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="com.spring.model.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/calendar.js" ></script>

<%
	MemberVO member = (MemberVO)session.getAttribute("member");
%> 


<script type="text/javascript">


var sc_makecount = 0;

$(document).ready(function(){

	/* 배경화면 바꾸는거 사진 고르고 확인 누르면 바로 submit 된다. */
	   $("#backImg").change(function(){
	         document.cd_backImgFrm.submit();
	      });
	      
	/* 프로필사진  바꾸는거 사진 고르고 확인 누르면 바로 submit 된다. */   
	    $("#profileImg").change(function(){
	        document.cd_profileImgFrm.submit();
	      }); 
	      
	    getMySchedule();
	      
	
		$("#like_search").focus(
			    function(){
			        $(this).val('');
			        $(this).keydown(function(event){
			        	if(event.keyCode == 13){
			        		searchSchedule();	
			        	}
			        })
			        
			    });
	    
		$("#t_name").focus(
		    function(){
		        $(this).val('');
		        $(this).keydown(function(event){
		        	
		        	if(event.keyCode == 13){
		        		getWishRegionSearch();
		        		event.preventDefault();
		        	}
		        })
		        
		    });
	  
	$("#searchSC").focus(
	    function(){
	        $(this).val('');
	        $(this).keydown(function(event){
	        	if(event.keyCode == 13){
	        		searchSchedule();	
	        	}
	        })
	        
	    });
	    
	<% if(request.getAttribute("tabnum") != null) { %>
	$("#mytab li:eq("+"<%= request.getAttribute("tabnum") %>"+") a").tab("show"); 
	<% } %> 
	
	<% if(request.getAttribute("cd_scrolltop") != null) { %>
	$(window).scrollTop(<%= request.getAttribute("cd_scrolltop") %>); 
	<% } %> 

	<%-- <% if(request.getAttribute("tabnum2") != null) { %>
	$("#mytab2 li:eq("+"<%= request.getAttribute("tabnum2") %>"+") a").tab("show"); 
	<% } %> 
	
	<% if(request.getAttribute("tabnum3") != null) { %>\
	$("#mytab3 li:eq("+"<%= request.getAttribute("tabnum3") %>"+") a").tab("show"); 
	<% } %> 
	
	<% if(request.getAttribute("tabnum4") != null) { %>
	$("#mytab4 li:eq("+"<%= request.getAttribute("tabnum4") %>"+") a").tab("show"); 
	<% } %> --%>

		
}); // end of document.ready


/*  $("#mytab4 li").click(function(){
alert($("#mytab4 li.active").val());   }) */



// 상태메시지 바꿀수 있게 한다 
function editmsg(){
	
	 document.getElementById("tick").style.visibility = "visible";
	 document.getElementById("statusmsg").contentEditable=true;

	 const limit = 18;
	 var rem = limit - $('#statusmsg').text().length;
	// $("#counter").append("You have <strong>" + rem + "</strong> chars left.");
	 $("#statusmsg").on('input', function () {
	     var char = $('#statusmsg').text().length;
	     rem = limit - char;
	    // $("#counter").html("You have <strong>" + rem + "</strong> chars left.");
	     
	     
	     if(char>18)
	     {
	        alert("20글자 이상 입력하실 수 없습니다.");
	     }

	 });
 
}

// 상태메시지 서브밋
function editmsgend(){
	 document.getElementById("statusmsg").contentEditable=false;
	 // var statusmsg = document.getElementById("statusmsg").value;
	 var statusmsg = $("#statusmsg").text();
	 //var stat = $("#statusmsg").val(statusmsg);
	 
	 
	 document.getElementById("tick").style.visibility = "hidden";
	
	 //alert(statusmsg);
	//  alert(document.getElementById("statusmsg").text());
   
	  var form_data = { 
	            statusmsg : statusmsg
	       };
	 
	 	 $.ajax({url: "/triplan/cd_setStatusMsg.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#statusmsg").empty;
			$("#statusmsg").html(result);  			
			           
	      }// end of success----------------------
	  });// end of $.ajax();----------------------	
	 
	
} 


<%-- 전체 선택/ 해제 하는 법!!! --%>
function allCheckBox() {
	var bool = document.getElementById("allCheckorNone").checked;
	var pnumArr = document.getElementsByName("chkboxpnum");
	for(var i = 0 ; i < pnumArr.length ; i++){
		pnumArr[i].checked = bool;
	}
}


<%--  위시리스트에서 삭제하기 
 function goDelOne(t_idx){
alert("이거되나");
    var n = confirm("위시리스트에서 삭제하시겠습니까?");
	if(n == true){
	
		$("#cd_deletewishlist").append("<input type='hidden' name='chkboxpnum' value='"+t_idx+"' />");
		
		var chkbox = document.getElementsByName("chkboxpnum");
		
		for(var i=0; i< chkbox.length; i++)
		{
			chkbox[i].checked = false;	
		}
		
		$("#cd_deletewishlist").append("<input type='hidden' name='cd_scrolltop' value='"+$(window).scrollTop()+"' />");
		
		cd_deletewishlist.submit();
	}	
} --%>

<%-- 위시리스트에서 몇개씩  지울때 .. --%>
function deleteWishList(){
	var n = confirm("위시리스트에서 삭제하시겠습니까?22222");
	
	if(n == true){
	
	  
	 var chkbox = document.getElementsByName("chkboxpnum");
	 var chkboxchecked = [];
	 for(var i = 0 ; i < chkbox.length ; i++){
		 
		 if(chkbox[i].checked){
			 chkboxchecked.push(chkbox[i].value);
			 // alert(chkbox[i].value);
		 }
	 }
	 
	 for(var i=0; i<chkboxchecked.length; i++){
		 //  alert(chkboxchecked[i]);
	 }

	    
		var form_data = { /* chkboxchecked : chkboxchecked */
	    		 chkboxchecked: chkboxchecked
		};
		 
		$.ajax({url: "/triplan/cd_deleteWishList.tp",
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
		   	  	$("#here").empty();
				$("#here").html(result);  			
				           
		      }// end of success----------------------
		      ,error: function(data){
		    	
		    	 alert("지워야 하는 위시리스트를 체크하세요");
		      }
		  });// end of $.ajax();----------------------		
			
	
		}	
}


 <%-- 위시리스트에서 그냥 하나씩 지울때 .. --%>
 function deleteWishlist1(t_idx){
    
	var n = confirm("위시리스트에서 삭제하시겠습니까?11111");
	if(n == true){
		
	var form_data = { 
           
           t_idx :t_idx
       };
 
 	 $.ajax({url: "/triplan/cd_deleteOneWishList1.tp",
 	  type: "GET",
      data: form_data, 
      dataType: "html", 
      success: function(data){
   	  var result = data;
   	   
   	  	$("#here").empty();
		$("#here").html(result);  			
		           
      }// end of success----------------------
  });// end of $.ajax();----------------------	
	}
}
 


<%-- 검색어가 남아 있게 하기 ! --%> 
window.onload=function(){
	searchKeep();
}
function searchKeep(){
	<c:if test="${not empty t_name && not empty t_name }">
		document.getElementById("t_name").value="${t_name}";	
	</c:if>
	
	<c:if test="${not empty search_id && not empty search_id }">
	document.getElementById("search_id").value="${search_id}";	
	</c:if>
}


<%-- 친구 검색하기--%> 
function cd_searchFriend(){
	cd_searchFrm2.submit();
}


/* function cd_searchWishList(){
	
	$("#cd_searchFrm").append("<input type='hidden' name='cd_scrolltop' value='"+$(window).scrollTop()+"' />");
	document.cd_searchFrm.submit();
}
 */
 
 
<%--  좋아요 부분 검색하기 7월4일 --%>   	
function searchlike(){
	
	var searched = $("#like_search").val();
	
	var form_data = { 
            searched : searched,   // 키값 : 밸류
            userid :  "${userid}"
       };
 
	
	$.ajax({url: "/triplan/getSearchedLiked.tp",
	      type: "GET",
	      data: form_data, // 서버로 보내는 ajax 요청 데이터
	      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
	      success: function(data){
	    	  var result = data;

	    	
				$("#likedList").empty;
			
				$("#likedList").html(result);  				
	  					
         
	      }// end of success----------------------
	  });// end of $.ajax();
	
	
}

<%-- 스케쥴 불러 오는 아작스 --%>
function getMyPlan(){
	
	$.ajax({url: "/triplan/cd_getNewMyPlan.tp",
	      type: "GET",
	      data: form_data, // 서버로 보내는 ajax 요청 데이터
	      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
	      success: function(data){
	    	  var result = data;

	    		alert(id);
				$("#here").empty;
			
				$("#here").html(result);  				
				$("#here").show();		  					
           
	      }// end of success----------------------
	  });// end of $.ajax();
	
}
	
	
function friendlist(){

	$.ajax({url: "/triplan/cd_getFriendListAjax.tp",
	      type: "GET",
	      data: form_data, // 서버로 보내는 ajax 요청 데이터
	      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
	      success: function(data){
	    	  var result = data;
	    	   
	  
			
				$("#here").html(result);  					  					
				
				/* $("#displayList").html(resultHtml);
				$("#displayList").show() */;
				
				
	    	             
	      }// end of success----------------------
	  });// end of $.ajax();----------------------
	
}

<%-- 위시리스트 아작스 ==>지역별로 위시리스트 가져오고, 검색기능 포함  --%>
function getWishRegionSearch(){

	
	<%-- t_name 은 검색어이고 그것을 받아온다 --%>
	var search = document.getElementById("t_name").value;
	var	area = $("#mytab4 li.active").val();
		
	var form_data = { 
            areano : area,   // 키값 : 밸류
            searchword : search
       };
 
 	 $.ajax({url: "/triplan/cd_getWishRegionSearch.tp",
    	 
 	  type: "GET",
      data: form_data, 
      dataType: "html", 
      success: function(data){
   	  var result = data;
   	   
		$("#here").html(result);  			
		           
      }// end of success----------------------
  });// end of $.ajax();----------------------	
	
	}


<%-- 위시리스트 아작스 ==>지역별로 위시리스트 가져오기  --%>
function getWishRegion(area){

	<%-- 파라미터로 받아온 Area 값은 지역 번호이다 --%>
	var form_data = { 
            areano : area   // 키값 : 밸류
       };
 
 	 $.ajax({url: "/triplan/cd_getWishRegion.tp",
    	 
 	  type: "GET",
      data: form_data, 
      dataType: "html", 
      success: function(data){
   	  var result = data;
   	   
		$("#here").html(result);  			
		           
      }// end of success----------------------
  });// end of $.ajax();----------------------	
	
}


function friendList()	// 친구 목록	
{
 	 $.ajax({
 		 url: "/triplan/kyu_friendlist.tp",
 		 type: "GET", 
      	 dataType: "html", 
      	 success: function(data){
      		$("#friendlist").html(data);	           
      	 }
  	 });
	
}	// end of friendList

function friendfind()	// 친구 추가/ 찾기
{
	$.ajax({			
		 url: "/triplan/kyu_friendmemadd.tp",
		 type: "GET", 
     	 dataType: "html", 
     	 success: function(data){
     		$("#friendlist").html(data);	           
     	 }
 	 });
	
}

function k_friendList()	// 친구 목록	
{	
 	 $.ajax({
 		 url: "/triplan/kyu_friendlist.tp",
 		 type: "GET", 
      	 dataType: "html", 
      	 success: function(data){
      		$("#friendlist").html(data);	           
      	 }
  	 });
	
}	// end of friendList

function findFriend()
{
	var id = $("#search_id_k").val().trim();
	var inform = { searchID : id };

	$.ajax({
		 url: "/triplan/kyu_findFriend.tp",
		 data:inform,
		 type: "GET", 
     	 dataType: "html", 
     	 success: function(data){
     		$("#friendlist").html(data);	           
     	 }
 	 });
}

function yesorno()
{
	$.ajax({			
		 url: "/triplan/kyu_yesorno.tp",
		 type: "GET", 
    	 dataType: "html", 
    	 success: function(data){
    		$("#friendlist").html(data);	           
    	 }
	 });
}




function getMySchedule()
{
	$.ajax({
		url: "/triplan/jh_getSchedule.tp",
		type : "post",
		dataType: "html",
		success: function(data){
			$("#mySchedule").html(data);
		}
	})	
}

////////////////////////0628<동규> /////////////////////
function viewSchedule(sc_idx)
{
	var event = window.event;
	var id = event.target.id;
 	if(id == "likebtn")
	{
		deletelike(sc_idx);
	}
	else
	{
		location.href="view_schedule.tp?sc_idx="+sc_idx;
	} 
}

function getLiked()
{
	$.ajax({
		url: "/triplan/kyu_getLiked.tp",
		type : "GET",
		dataType: "html",
		success: function(data){
			$("#likedList").html(data);
		}
	})
}

function deletelike(idx)
{	
	var info= { idxdata : idx };
	
	$.ajax({
		url: "/triplan/kyu_deletelike.tp",
		data : info,
		type : "GET",
		dataType: "html",
		success: function(data){
			$("#likedList").html(data);
		}
	})
}

function requestList()
{	
	$.ajax({			
		 	url: "/triplan/requestList.tp",
		 	type: "GET", 
    	 dataType: "html", 
    	 success: function(data){
    		$("#friendlist").html(data);	           
    	 }
	 });	
}

//오늘
//스케줄 검색하기
function searchSchedule(){
	
	<%-- 스케줄 검색어를 받아온다. --%>
	var search = document.getElementById("searchSC").value;
	
	
	var form_data = { 
         userid : "${userid}",
         search : search
    };

	 $.ajax({url: "/triplan/getMySearchedSchedule.tp",
 	 
	  type: "GET",
   data: form_data, 
   dataType: "html", 
   success: function(data){
	  var result = data;
	   
		$("#mySchedule").html(result);  			
		           
   }// end of success----------------------
});// end of $.ajax();----------------------	

}

//////////////////////////////////////////////

//--------------------------- 영주 수정한거  -------------------------------


	var gh_flag = 0;
	
   $(document).ready(function(){
   
	  $("#startDatepicker").datepicker({
           dateFormat: 'yy-mm-dd'
     });
	   
	  $("#endDatepicker").datepicker({
           dateFormat: 'yy-mm-dd'
     });

      $("#ns_startday").click(function(){

           $("#startDatepicker").change(function(){
           	
        	   var ck_date = $("#endDatepicker").val();
        	   
        	   if(ck_date.trim() != "" && ck_date != null)
               {
        		   validity( $("#startDatepicker"));
               }
        	   
           })
      });
      
      $("#ns_endday").click(function(){
           
           $("#endDatepicker").change(function(){
        	
        	   var ck_date = $("#startDatepicker").val();
        	   
        	   if(ck_date.trim() != "" && ck_date != null)
               {
        		   validity( $("#endDatepicker"));
               }
        	   
           })
           
           
      });
      
      function validity(date)// 날짜 유효성 검사
      {
	   	   var sc_start_date = document.getElementById("startDatepicker").value;
	   	   var sc_end_date = document.getElementById("endDatepicker").value;
	   	   
	   	   var arr1 = sc_start_date.split('-');
	   	   var arr2 = sc_end_date.split('-');
	   	   
	   	   var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	   	   var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	   	   
	   	   var diff = dat2 - dat1;
	   	   var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨
	   	   
	   	   var diffDate = parseInt(diff/currDay);
	   	   
	   	   if(diffDate < 0)
	   	   {
	   		   alert("출발날짜가 더 먼저에용");
	   		   $(date).val("");
	   		   return;
	   	   }
      }
      
      var area_count = 0;
      
      $(".plus1").hide();
      $(".plus2").hide();
/*       
      $("#getSchedule").click(function(){  // 팝업열기
         
         if($("#pop_ck").val() == 0)
         {
            scrolltop = $(".head").offset().top+$(".head").height()+50;
            scrollt = $(window).scrollTop();
            scrollb = $(window).scrollTop()+20;
            overlay(1.0);
            $("#newschedule").css("opacity",1.0);
            open_pop("newschedule",scrolltop-150);
            $("#pop_ck").val("999");
            setTimeout(function(){
               $("#pop_ck").val("1");
            },330);
         }
      })
       */
      
      $(".area_choice").click(function(){
         
         var bool = $(this).hasClass("plus");
         
         if(bool)
         {
            area_count++;
            
            $(this).removeClass("plus");
            
            if(area_count < 3)
            {
               $(".plus"+area_count).show();
            }
         }
        	 var isClass1 = $(this).hasClass("areaList");
        	 
       	 if(!isClass1)
       	 {
       		 $(this).html("<div class='div_areaList'></div><div class='div_deareaList'></div>");
           	 getAreaList($(this).find(".div_areaList"));
           	 $(this).addClass("areaList");
           	 $(this).css("padding-top",0);
          		 getDeAreaList($(this).find(".div_deareaList"), 0);
       	 }
       	 else
       	 {
       		 var div_deareaList = $(this).find(".div_deareaList");
       		 
       		 $(this).find(".div_areaList").find("select").change(function(){
       			 if(gh_flag == 0)
       			 {
       			 	gh_flag = 1;
       			 	getDeAreaList(div_deareaList, $(this).val());
       			 }
       		 })
       	 }
         
      });
   });
     
   function getSchedule()
   {	   
	   var sc_name = document.getElementById("sc_name").value;
	   
	   if(sc_name == null || sc_name.trim() == "")
	   {
			alert("제목을 입력해주세요");
			return;
	   }
	   
	   var startDatepicker = document.getElementById("startDatepicker").value;
	   var endDatepicker = document.getElementById("endDatepicker").value;
	   
	   if(startDatepicker == null || startDatepicker.trim() == "")
	   {
		   alert("출발날짜를 선택해주세요");
		   return;
	   }
	   
	   if(endDatepicker == null || endDatepicker.trim() == "")
	   {
		   alert("돌아오는날짜를 선택해주세요");
		   return;
	   }
	   
	   var de_area_code = document.getElementsByName("de_area_code");
	   
	   for(var i = 0; i < de_area_code.length; i++)
	   {
			if(de_area_code[i].value == "상세지역선택")
			{
				alert("상세지역을 선택해주세요.");
				return;
			}
	   }

	   if(sc_makecount == 0)
	   {
		   sc_makecount = 1;
		   // 서브밋
		   $("#getScheduleFrm").submit();
		   sc_makecount = 0;
	   }
   }
   
    function getAreaList(area)
	{
		$.ajax({
			 url: "/triplan/getAreaInfo.tp",
			 type: "POST",
			 data: {},  // 전송해야할 데이터
			 dataType: "json", 
			 success: function(data) {
				 
				var html1 = "<select class='ns_select'>";
		    		html1 += "<option value='지역선택'>지역선택</option>";
				
				$.each(data, function(entryIndex, entry){
					
			    	html1 += "<option value= '" + entry.area_code + "'>" + entry.area_name + "</option>";
			        
				}); // end of each() -------------
				
				html1 += "</select>";
				
				$(area).html(html1);
				
			 } 
		});
		
	}
    
    function getDeAreaList(area, p_area_code)
    {
    	$.ajax({
			 url: "/triplan/getDeAreaInfo.tp",
			 type: "POST",
			 data: { area_code : p_area_code },  // 전송해야할 데이터
			 dataType: "json", 
			 success: function(data) {
				 
				gh_flag = 0;
				 
				var html2 = "<select class='ns_select' name='de_area_code'>";
		    		html2 += "<option value='상세지역선택'>상세지역선택</option>";
				
				$.each(data, function(entryIndex, entry){
					
			    	html2 += "<option value= '" + entry.de_area_code + "'>" + entry.de_area_name + "</option>";
			        
				}); // end of each() -------------
				
				html2 += "</select>";
				
				$(area).html(html2);
			 },
			 error: function() {
				 alert("err");
			 }
		});
    }
  
    
    // ------------------- 회원정보 수정  ---------------------
    
    	$(document).ready(function(){
	
		var area_count = 0;
		
		
		$("#memberedit").click(function(){  // 팝업열기
			
			if($("#pop_ck").val() == 0)
			{
				scrolltop = $(".head").offset().top+$(".head").height()+50;
				scrollt = $(window).scrollTop();
				scrollb = $(window).scrollTop()+20;
				overlay(1.0);
				$("#edit").css("opacity",1.0);
				open_pop("edit",scrolltop-150);
				$("#pop_ck").val("999");
				setTimeout(function(){
					$("#pop_ck").val("5");
				},330);
			}
		})
	});
	
	 
	
	function editinfo()
	{
		var name = document.getElementById("name_k");
		var passwd = document.getElementById("passwd_k");
		var email = document.getElementById("email_k");
		var pnum = document.getElementById("pnum_k");
		
		if(name.value.trim()=="" || !name.value) {
			alert("이름을 입력하세요!");
			name.focus();
			return;
		}
		
		if(passwd.value.trim()=="" || !passwd.value) {
			alert("비밀번호를 입력하세요!");
			passwd.focus();
			return;
		}
		
		if(!validate_password( passwd.value.trim() ))
		{
			alert("암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.");
			passwd.focus();
			return;
		}
		
		if(email.value.trim()=="" || !email.value) {
			alert("이메일을 입력하세요!");
			email.focus();
			return;
		}
		
		if(!validate_email( email.value.trim() ))
		{
			alert("이메일을 제대로 입력하세요!");
			email.focus();
			return;
		}
			
		if(pnum.value.trim()=="" || !pnum.value) {
			alert("폰번호를 입력하세요!");
			pnum.focus();
			return;
		}
		
		if(!validate_onlyNumber( pnum.value.trim() ))
		{
			alert("(-)을 제외한 번호만 입력해주세요!");
			pnum.focus();
			return;
		}
		
		if( !(pnum.value.trim().length==11 || pnum.value.trim().length==10) )
		{
			alert("번호를 제대로 입력해주세요!");
		}
		
		infoform.submit();
	}	// end of editinfo()

	 function validate_onlyNumber(val)
	  {
		  var regExp = /^[0-9]+$/;
		  return regExp.test(val);
	  }
	  
	  
	  function validate_password(passwd) {
			var regexp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g; 
			// 암호는 8글자 이상 15글자 이하에서 영문자, 숫자, 특수기호가 혼합이 된것만 허락해주는 정규표현식 객체생성
		
			return regexp.test(passwd);
		}
		
		
		function validate_email(email) {
			var regexp = /^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/g; 
			// e메일 정규표현식 객체생성
		
			return regexp.test(email);
		}
	   
		
		// paige
		function requestedSchedule(){
			
			
			$.ajax({url: "/triplan/getRequestedInvite.tp",
			      type: "GET",
			      dataType: "html", // ajax 요청에 의해 서버로 부터 리턴받는 데이터 타입. xml, html, json, text 가 있음.
			      success: function(data){
			    	  var result = data;

			    		
						$("#mySchedule").empty;
					
						$("#mySchedule").html(result);  				
									
		           
			      }// end of success----------------------
			  });// end of $.ajax();

		
			
		}

</script>
<style type="text/css">

.disable_a_href{
    pointer-events: none;
}

.cd_schedule-list {
	width: 100%;
	margin-left: 2%;
}

.cd_schedule {
	width: 500px;
	height: 350px;
	margin: 2% 0% 3% 3%;
	float: left;
	box-shadow: 5px 3px 10px -1px;
	border-radius: 2px;
}

.cd_schedule-image {
	width: 100%;
	height: 70%;
}

.cd_schedule-comment {
	width: 90%;
	height: 22%;
	margin: 0 5% 5% 5%;
	letter-spacing: 1px; /* 글자간격 */
	font-size: 11pt;
	padding: 10px;
	
}

.cd_schedule-comment>.cd_title {
	font-size: 17pt;
	font-weight: bold;
	margin-top:5%;
}

.cd_title{
	margin-top:20%;

}

.cd_schedule-comment>span {
	text-align: left !important;
}



#dd:HOVER .overlay-layer .upload_btn {
visibility:visible;
	
}
 


.cd_upload_btn{
    position:absolute;
    width:150px;height:150px;
	border-radius:50%;
    z-index:10;
    opacity:0;
}


.cd_search-box {
	width: 50%;
	margin-left: 30.8%;
	margin-right: auto;
	display: compact;
}

.cd_search {
	padding: 6px 6px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    outline: none;
	margin-top: -5px;
	height: 40px !important;
	width: 70% !important;
	display : inline !important;
	border-radius: 4px 0px 0px 4px !important;
	float: left;
}

.cd_glyphicon-search {
	top: 3px !important;
	font-size: 16px;
	
}

.cd_btn-search {
	margin-top: -5px !important;
	margin-left: -1px !important;
	padding: 6px 12px !important; 
	height: 40px;
	border-radius: 0px 4px 4px 0px !important;
	float:left;
}

.cd_span-search {
	font-size: 15px;
}

.cd_schedule-comment>.cd_title {
	font-size: 14pt;
	font-weight: bold;
}


.profile:hover > .back{ visibility : visible} 
 
.back{background-color: black; color:white; font-size: 20pt; visibility:hidden}
			
.profile {
	width: 100% ;
	height: 60%;
	background-image: url("/triplan/User/${userid}/background.jpg");
	background-size: 100% 100% 100% 100%;
	/* padding-top: 100%;*/
	text-align: center;
	/* opacity:0.7; */
 }

#profilecontent {
	margin-top: 5%;
	height: 50%;
}

 .profilepic{
	margin-left:42%;
	margin-top: -2%;	
	width:15%;
	height:88%;
	border-radius:50%;
	font-size:10px;
	color:#fff;
	background:#000;
	border:4px solid white;
	background-image: url("/triplan/User/${userid}/profile.jpg"); 
	background-position: center center;
	background-size:135%;
	z-index: 1;
} 


.profileuserid{ 
	margin-left: 43%;
	width:12%;
	font-weight:bold; 
	color: white; 
	font-size: 10pt; 
	background-color: black;
	cursor:default;
}
#statusmsg{
	width:12%;
	color: white;
	font-size: 14pt;
	background-color: black;
}			
		
.memberedit{
	margin-left:43%;
	width:12%; 
	font-weight:bold; 
	color: white;
	font-size: 10pt; 
	background-color: black; 
	cursor:pointer;
}		
		
		
.cd_upload_btn2{
    position:absolute;
    width:200px;
    height:100px;
	border-radius:50%;
    z-index:10;
    opacity:0;
}

#tick{

visibility: hidden;
}


#aftersearch {
overflow: hidden;
}

#friendlist {
}

#screen{
background-color:
}


.container{
margin-top:-1.4%
}


/*  ---------- 영주 스타일 수정 -------------  */

#newschedule {
	width: 420px;
	height: 350px;
	top: -1000%;
	left: 37.5%;
	
	background-color: white;
	border: none
	
}


.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }

.cs_pubtrans_wrap .traff_slayer3 {
    overflow: hidden;
    position: absolute;
    padding: 6px 16px 6px 5px;
    border: 1px solid #ccc;
    background: #fff;
}

.div_areaList {
	width: 100%;
	height: 50%;
	border: 0 none;
	position: relative;
}

.div_deareaList {
	width: 100%;
	height: 50%;
	border: 0 none;
	position: relative;
}

#startDatepicker {
	width: 100%;
	height: 100%;
	border: 0 none;
	text-align: center;
}

#endDatepicker {
	width: 100%;
	height: 100%;
	border: 0 none;
	text-align: center;
}

.ns_select {

	width: 100%;
	height: 100%;
	border: 0 none;
	position: relative;

}	



</style>
<body>
<%

		String mobile = member.getMobile();
		String m1=null, m2=null, m3=null;
												
		if(mobile.length()==13)	// 폰번호가 11자 일때		010-0000- 0  0  0  0
		{
			m1 = mobile.substring(0,3);
			m2 = mobile.substring(4,8);
			m3 = mobile.substring(9);
		}													
		else if(mobile.length()==12){	// 폰번호가 10자 일때		010-000-00 0   0
			m1 = mobile.substring(0,3);
			m2 = mobile.substring(4,7);
			m3 = mobile.substring(8);												
		}
		
		mobile=m1+m2+m3;
		
%> 
<!-- ------------------------- 회원 정보 수정 Modals ------------------------ -->

<!-- 회원정보 수정 -->
<div class="modal fade" id="myEditModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" align="center" style=" height: 50%; ">
<!-- 정보시작 -->
		
<!-- 	<div id="edit" align="center" style="background-color:#e6ffff; height: 50%; "> -->

	<!-- <div align="center" style="background-color: green;"> -->
	<form name="infoform" action="/triplan/editinfo.tp" method="POST">
	<table border="0" style="width: 100%; height: 100%;">
		
		<tr height="25%">
			<td colspan="2" align="center"><span id="infocg" style="color:blue;"><%= member.getName() %>님 회원정보 </span></td>
		</tr>
		<tr height="10%">
			<td colspan="2" align="center" style="vertical-align: top;"><b>ID : <%= member.getUserid() %></b></td>
		</tr>
		<tr height="12%">
			<td width="31%" align="center">이름</td><td align="left" style="padding-left: 10px;"><input type="text" name="name" id="name_k" value="<%= member.getName()%>"></td>
		</tr>
		<tr height="12%">			
			<td width="31%" align="center">비밀번호</td><td align="left" style="padding-left: 10px;"><input type="text" name="password" id="passwd_k" value="<%= member.getPassword()%>"></td>
		</tr>
		<tr height="12%">
			<td width="31%" align="center">email</td><td align="left" style="padding-left: 10px;"><input type="text" name="email" id="email_k" value="<%= member.getEmail()%>"></td>
		</tr>
		<tr height="12%">
			<td width="31%" align="center">폰번호</td><td align="left" style="padding-left: 10px;"><input type="text" name="mobile" id="pnum_k" value="<%=mobile%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button type="button" class="btn btn-default" onclick="editinfo()" >회원정보 수정</button></td>
		</tr>
	</table>
	</form>
	<!-- </div> -->
<!-- </div> -->
			
<!-- 정보  끝 -->
		</div>
	</div>
</div>


<!-- ------------------------- 회원 정보 수정 Modals 끝 ------------------------ -->




<!--  - ------------------------- 새 일정 Modals -------------------- -  -->

	
  <div class="modal fade" id="nsch" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">새 일정</h4>
        </div>
        <div class="modal-body">
        
<div id="newschedule" >
	<script>
		
	</script>
   <form id="getScheduleFrm" name="getScheduleFrm" action="/triplan/schedule.tp" method="post">

      <div id="ns_name">
         <input type="text" id="sc_name" name="sc_name" placeholder="제목" required />
      </div>
      <div id="ns_day">
         <div id="ns_startday">
            <input type="text" id="startDatepicker" name="sc_start_date" readonly="readonly" placeholder="출발 날짜" required />
         </div>
         <span>~</span>
         <div id="ns_endday">
            <input type="text" id="endDatepicker" name="sc_end_date" readonly="readonly" placeholder="돌아오는 날짜" required />
         </div>
      </div>

      <div id="area_list">
         <div class="area_choice plus">
            <span>+</span>
         </div>
         <div class="area_choice plus plus1">
            <span>+</span>
         </div>
         <div class="area_choice plus plus2">
            <span>+</span>
         </div>
         
      </div>
      <div id="ns_btn">
         <button class="btn btn-default" id="ns_btnOK" type="button" tabindex="4" onClick="getSchedule()"><span class="ir_wa">만들기</span></button>
      </div>
   </form>
</div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>



<!--  - ------------------------- 새 일정 Modals 끝 -------------------- -  -->


<div id="screen"><%-- 화면 전체를 말한다  --%>
<jsp:include page="../top.jsp" /><%-- 로고, 로그인 등이 있는 탑 부분을 말한다 --%>
<section id="main"> <!-- Top 부분 아래부터 Foot 사이의 부분 -->
	
		<!-- @1 프로필부분 시작-->
		
		
		<%-- 배경화면 사진 바꿀 수 있는 폽 시작   --%>
		<div class="profile"  >
		<form id ="cd_backImgFrm" action ="/triplan/cd_uploadBGimg.tp" method = "post"  enctype="multipart/form-data" >
			<span class="back"><input id="backImg" name="attach" type ="file" class="cd_upload_btn2"/>배경화면바꾸기</span>
		</form>
		
			<%-- 2★ 프로필 부분인데 프로필 사진, 아이디, 정보수정, 상태메시지를 다 묶어논 DIV 이다  --%>
			<div id="profilecontent">
			
				<%-- 프로필 사진 바꿀 수 있는 폼 시작   --%>
				<form name ="cd_profileImgFrm" action ="/triplan/cd_uploadPRimg.tp" method = "post"  enctype="multipart/form-data" >
					<div class="profilepic">
						<input id="profileImg" type ="file" name="attach" class="cd_upload_btn" />
					</div>
				 </form>
				<%-- 프로필 사진 바꿀 수 있는 폼 끝   --%>
				 
				<div class="profileuserid" >${userid }</div>
				<div style="display: inline;" id="statusmsg" >${msg}</div >
				
				<%-- 하얀색 펜을 보여주는 이걸 누르면 상태메시지 변경 할 수 있다 --%>
				<div style="display: inline;"><a href="javascript:editmsg()" style="font-weight: bold; color:white; font-size:12pt" 
				class="glyphicon glyphicon-pencil">
				</a></div>
				
				 <%-- 하얀색 펜을 누르면 틱버튼이 나온다. 틱을 누르면 상태 메시지 변경 가능  --%>
				 <div style="display: inline;"><a href="javascript:editmsgend()" style="font-weight: bold; color:white;
				 font-size:12pt" class="glyphicon glyphicon-ok" id="tick"></a></div>
				 
				 
				 <%-- 간단한 회원 정보 수정 할 수 있는 팝업이 뜬다. --%>
				 <!-- <div class="memberedit" id="memberedit">회원정보수정</div> -->
				 <div class="memberedit" data-toggle="modal" data-target="#myEditModal" >회원정보수정</div>
				
			 </div>
			<%-- 2★  끝  --%>
		</div>​
		<!-- @1 프로필부분 끝-->

<div class="container"><!-- @2 프로필 아래부터의 DIV -->
 
  <!-- @3 Menu 부분 -->
  <ul class="nav nav-tabs" id="mytab">
    <li class="active" class="myplan" id="cd_topmenu"><a data-toggle="tab" href="#myplan" onclick="getMyPlan();">My Plan</a></li>
    <li id="cd_topmenu" class="liked"><a data-toggle="tab" href="#liked" onclick="getLiked();">Liked</a></li>
    <li id="cd_topmenu" class="wishlist"><a data-toggle="tab" href="#wishlist" onclick="getWishRegion('0');">WishList</a></li>
    <li id="cd_topmenu" class="friends"><a data-toggle="tab" href="#friends" onclick="k_friendList();">Friends</a></li>
  </ul>
  <!-- @3 Menu 끝 -->


<!-- ==================================== @4 매뉴 아래에서 부터 모든 내용 포함 ==================================== -->
  <div class="tab-content">
  
<!-- ==================================== @5 my plans TAB 부분 시작 (계획) ================================ -->
    <div id="myplan" class="tab-pane fade in active" style="border: none !important;">
    
      <!-- sub menu 부분 -->
      <ul class="breadcrumb" style="text-align: center;">
	    
	    <li ><a data-toggle="tab" href="" onclick="getMySchedule();">전체</a></li>
	    <li ><a data-toggle="tab" href="" onclick="requestedSchedule()">요청받은 스케줄</a></li> 
	                 
 	  </ul>
 	  <!-- sub menu 끝 -->
 	  
 	  <!-- 검색창 시작  -->
 	 <div class="cd_search-box" align="center">
					<input type="text" id="searchSC" name="searchSC" class="cd_search" size="30" placeholder="검색한 스케쥴 제목을 입력하세요">
					<a href="javascript:searchSchedule()" class="btn btn-default btn-lg cd_btn-search">
					<span class="glyphicon cd_glyphicon-search"></span> <span class="cd_span-search">검색</span>
					</a>
	</div>
	<!-- 검색창 끝 -->
<!-- ==================================== @6 my plans 나열한 부분  ==================================== -->
			<div class="cd_schedule-list" class="tab-pane fade in active">
				<div id="here3">
				<div class="cd_schedule" id="getSchedule" data-toggle="modal" data-target="#nsch">
					<div class="cd_schedule-image">
						<img id="cd_newsc" width="100%" height="100%" src="/triplan/resources/image/fly.jpg" />
					</div>
					<div class="cd_schedule-comment" >
						<br/><span class="title" style="text-align: center;font-weight: bold; font-size: 18pt; margin-left:17%;" ><a>새로운 여행을 등록하세요!!</a></span><br>
					</div>
				</div>
				
				<div id="mySchedule"></div>
				</div>
		</div>
<!-- ==================================== @6 my plans 나열한 부분 끝  ==================================== -->
			
</div>
<!-- ==================================== @5 my plans TAB 부분 끝 ==================================== -->




<!-- ==================================== @7 my plans TAB 부분 시작 (좋아요) ============================== -->
<div id="liked" class="tab-pane fade" id="mytab5">
     
  <!-- sub menu 부분 -->
      <ul class="breadcrumb" style="text-align: center;">
	    <li><a data-toggle="tab" href="" onclick="getLiked();">전체</a></li>
	          
	                 
 	  </ul>
 	  <!-- sub menu 끝 -->
 	  
 	  <!-- 검색창 시작  -->
 	  <form id = "cd_likeSearchFrm" name="cd_searchFrm" action="/triplan/cd_searchWishList.tp" method="get">
 	  <div class="cd_search-box" align="center">
	 				<input type="text" class="cd_search" size="30" name="like_search" id="like_search" placeholder="좋아요한 스케줄을 검색하세요">
					<a href="javascript:searchlike()" class="btn btn-default btn-lg cd_btn-search">
					<span class="glyphicon cd_glyphicon-search"></span> <span class="cd_span-search">검색</span>
					</a>
	  </div>
	  </form>
	  <!-- 검색창 끝 -->
 	  
 	  
			<div class="cd_schedule-list">
				
				<div id="likedList"></div>

	  		 </div>      
</div>
<!-- ==================================== @7 my plans TAB 부분 끝(좋아요) ==================================== -->




<!-- ==================================== @8 my plans TAB 부분 시작 (위시리스트) ============================== -->
    <div id="wishlist" class="tab-pane fade">
       <form id = "cd_searchFrm" name="cd_searchFrm" action="/triplan/cd_searchWishList.tp" method="get">
      <!-- sub menu 부분 -->
      <ul class="breadcrumb" style="text-align: center;" id="mytab4">
	    <li value="0" class="active"><a data-toggle="tab" href="#wishlistall" onclick="getWishRegion('0');">전체</a></li>
	    <li value="1"><a data-toggle="tab" href="#seoul" onclick="getWishRegion('1');">서울</a></li>
	   	<li value="2"><a data-toggle="tab" href="#incheon" onclick="getWishRegion('2');">인천</a></li>
	    <li value="3"><a data-toggle="tab" href="#busan" onclick="getWishRegion('3');">부산</a></li>
	    <li value="4"><a data-toggle="tab" href="#jeju" onclick="getWishRegion('4');">제주도</a></li>        
	    <li value="5"><a data-toggle="tab" href="#kyungki" onclick="getWishRegion('5');">경기</a></li>
	    <li value="6"><a data-toggle="tab" href="#gangwon" onclick="getWishRegion('6');">강원도</a></li>    
	    <li value="7"><a data-toggle="tab" href="#chungcheong" onclick="getWishRegion('7');">충청도</a></li>        
	    <li value="8"><a data-toggle="tab" href="#junra" onclick="getWishRegion('8');">전라도</a></li>        
	    <li value="9"><a data-toggle="tab" href="#kyungsang" onclick="getWishRegion('9');">경상도</a></li>              
 	  </ul>
 	  <!-- sub menu 끝 -->
    
      <!-- 검색창 시작  -->
 	  <div class="cd_search-box" align="center">
			<input type="text" class="cd_search" name="t_name" id="t_name" size="30" placeholder="검색할 명소이름을 입력하세요" />
			<a href="javascript:getWishRegionSearch();" class="btn btn-default btn-lg cd_btn-search">
			<span class="glyphicon cd_glyphicon-search"></span> <span id="search" class="cd_span-search"> 검색</span>
			</a>
	  </div>
	    </form> 
	  <!-- 검색창 끝 -->
      
      <div id="aftersearch" style="margin-top:100px; 
								 height:100%;margin-left:15%;width:70%; position: relative" >	
			<div id="wishlistall" class="tab-pane fade in active"></div>
 	  		<div id="seoul" class="tab-pane fade "></div>
 	 	 	<div id="incheon" class="tab-pane fade "></div>
	 	 	<div id="busan" class="tab-pane fade "></div>
	 	 	<div id="jeju" class="tab-pane fade "></div>
	 	 	<div id="kyungki" class="tab-pane fade "></div>
	 	 	<div id="gangwon" class="tab-pane fade "></div>
	 	 	<div id="chungcheong" class="tab-pane fade "></div>
	 	 	<div id="junra" class="tab-pane fade "></div>
	 	 	<div id="kyungsang" class="tab-pane fade "></div>
	 	 	<div id="here" ></div>
	  </div>
	  
     </div>
<!-- ==================================== @8 my plans TAB 부분 시작 (위시리스트) ============================== -->
    


<!-- ==================================== @9 my plans TAB 부분 시작 (친구) ============================== -->
    <div id="friends" class="tab-pane fade">
      
      <!-- sub menu 부분 -->
      <ul class="breadcrumb" style="text-align: center;" id="mytab3">
	    <li class="active"><a data-toggle="tab" class= "friendlist" href="#friendlist" onclick="k_friendList()">친구 목록</a></li>
	    <li><a data-toggle="tab" class="searchfriend"  href="#friendlist" onclick="friendfind()">친구추가/찾기</a></li>
	    <li><a data-toggle="tab" class="searchfriend"  href="#friendlist" onclick="requestList();">요청목록 보기</a></li>
	    <li><a data-toggle="tab" class="acceptreject" href="#friendlist" onclick="yesorno()">수락/거절</a></li>	      
 	  </ul><!--  -->
 	  <!-- sub menu 끝 -->

 	  <!-- 검색창 시작  -->
 	  <form id = "cd_searchFrm2" name="cd_searchFrm2" action="/triplan/cd_searchFriend.tp" method="get">
 	  <div class="cd_search-box" align="center">
					<input type="text" class="cd_search" name="search_id" id="search_id_k" size="30" placeholder="검색할 아이디를 입력하세요">
					<a href="javascript:findFriend();" class="btn btn-default btn-lg cd_btn-search">
						<span class="glyphicon cd_glyphicon-search"></span> <span class="cd_span-search" >검색</span>
					</a>
	  </div>
	  </form>
	  <!-- 검색창 끝 -->
	  
	
	<div id="aftersearch2" style="margin-top:70px; border:0px solid orange; height:100%; margin-left:8%; width:85%" class="cd_schedule-list">
			<div id="friendlist"    class="tab-pane in active" align="center" ></div> 
			<div id="searchfriend"  class="tab-pane " align="center"></div> <%-- <jsp:include page="cd_searchfriend.jsp" /> --%>
			<div id="acceptreject"  class="tab-pane " align="center"></div> <%-- <jsp:include page="cd_acceptreject.jsp" /> --%>
	</div>
	
  </div>
	
  </div>
<!-- ==================================== @9 my plans TAB 부분 끝 (친구) ============================== -->

<!-- ==================================== @4 매뉴 아래에서 부터 모든 내용 포함부분 끝 ==================================== -->
  </div>

</section>	
<jsp:include page="../foot.jsp" />
</div> <!--  @2 end of id=containe 프로필 아래부터의 DIV -->
<jsp:include page="../popup/popup.jsp" />