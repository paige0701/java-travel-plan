<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>   
 
<script type="text/javascript">
	function inviteSchedule(id){
		
		//alert("${sc_idx}");
		//alert(id);
		 var form_data = { 
				friendid : id,
				sc_idx : "${sc_idx}"
		};
		 
		$.ajax({url: "/triplan/addInviteSchedule.tp",
		 	  type: "GET",
		      data: form_data, 
		      dataType: "html", 
		      success: function(data){
		   	  var result = data;
		   	   
		   	  	$("#here").empty();
				$("#here").html(result);  			
				           
		      }// end of success----------------------
		      ,error: function(data){
		    	
		    	 alert("확인하삼..");
		      }
		  });// end of $.ajax();----------------------		
			 
		
		
	}

</script>

<style type="text/css">
th{border:1px solid gray; text-align: center }
td{border:1px solid gray;}
</style>
<div id="here">
	<div>
		<table id="" class="table" style="width:60%;  margin-left:20%;margin-top:10% ">
			<tr >
				<th Colspan="2">친구 리스트</th>
			</tr>
			<tr>
				<th style="width:50%">USERID</th>
				<th style="width:50%">추가</th >	
			</tr>
			
			<c:if test="${empty list }"><th colspan="2">친구가 없으시네요 ...마이페이지에서 친구부터 추가하세요.</th></c:if>
			<c:if test="${not empty list}">
						
			<c:forEach var="list" items="${list}" >
				<tr>
					<td style="width:70%">${list.FRIEND }</td>
					<td style="width:30%">
					<button type="button" id="frienduserid" onclick="inviteSchedule('${list.FRIEND }')">추가</button>
					</td>
						
				</tr>
						
	    	 </c:forEach>	
			 </c:if>	
		</table>
	</div> 
    <button type="button" id="" onclick="javascript:window.close()" style="margin-left:45%;margin-top:1% ">닫기</button>
</div>		  
