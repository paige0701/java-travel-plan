<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<style type="text/css">

</style>
<Script type="text/javascript">

	function acceptornot(sc_idx,userid){
		
		var n = confirm("스케줄에 참여 하시겠습니까 ? (취소를 누르면 거절됩니다) ");
		
		if(n == true){

			 var form_data = { 
					 sc_idx : sc_idx,
					 userid : userid
			};
			 
			$.ajax({url: "/triplan/acceptRequest.tp",
			 	  type: "GET",
			      data: form_data, 
			      dataType: "html", 
			      success: function(data){
			   	  var result = data;
			   	   
			   	  	$("#here").empty();
					$("#here").html(result);  			
					           
			      }// end of success----------------------
			      ,error: function(data){
			    	
			    	 alert("");
			      }
			  });// end of $.ajax();----------------------		
				 
			
		}else if(n == false){
			
				var m = confirm("정말로 거절하시겠습니까");
				if(m == true){
					
					
					var form_data = { 
							 sc_idx : sc_idx,
							 userid : userid
					};
					 
					$.ajax({url: "/triplan/declineRequest.tp",
					 	  type: "GET",
					      data: form_data, 
					      dataType: "html", 
					      success: function(data){
					   	  var result = data;
					   	   
					   	  	$("#here").empty();
							$("#here").html(result);  			
							           
					      }// end of success----------------------
					      ,error: function(data){
					    	
					    	 alert("");
					      }
					  });// end of $.ajax();----------------------	
					
				}else{
					
					
				}
		}
		
		
	}

</Script>

<div id="here">
<c:forEach var="sc" items="${list}" >

	<div class="cd_schedule" onclick="acceptornot('${sc.IDX}','${sc.USERID }')">
		<div class="cd_schedule-image">
			<img width="100%" height="100%" src="/triplan/Schedule/${sc.IDX}/title.jpg" />
		</div>
		<div class="cd_schedule-comment">
		<div>
		${sc.MYUSERID}님이 초대하신 스케줄입니다.
		
		</div>
		<hr style="margin-top:8px;">
			<span class="cd_title" style="font-size:17pt; margin-top:1%">${sc.NAME}</span><br>
		</div>
	</div>

</c:forEach></div>