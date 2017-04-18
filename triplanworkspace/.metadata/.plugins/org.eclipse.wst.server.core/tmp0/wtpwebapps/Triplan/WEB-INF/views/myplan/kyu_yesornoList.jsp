<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.model.MemberVO" %>
    
<%	MemberVO mem = (MemberVO)session.getAttribute("member"); %>

<script type="text/javascript">
	function friendadd(uid)
	{
		var n = confirm("친구요청을 수락하시겠습니까??");
		if(n == true){
		var ckdata ={ requserid : uid };
		
		$.ajax({			
   		 	url: "/triplan/friendadd.tp",
   		 	type: "GET", 
   		 	data: ckdata,
   		 	
        	 dataType: "html", 
        	 success: function(data){
        		$("#friendlist").html(data);	           
        	 }
    	 });
	     }
	}
	
	function friendreqdel(uid)
	{
		var n = confirm("친구요청을 거절하시겠습니까??");
		if(n == true){
		var ckdata ={ requserid : uid };
		
		$.ajax({			
   		 	url: "/triplan/friendreqdel.tp",
   		 	type: "GET", 
   		 	data: ckdata,
   		 	
        	 dataType: "html", 
        	 success: function(data){
        		$("#friendlist").html(data);	           
        	 }
    	 });
		
		}
	}
	
	$(document).ready(function(){
		<!-- ////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/ -->   
		$(".table").mouseover(function(){
			$("#aftersearch2").css("overflow", "auto");
		 
		});
		
		
		$(".table").mouseout(function(){
		   
		   $("#aftersearch2").css("overflow", "hidden");
		});
		<!-- ////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/ -->
	});
	
</script> 

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<table class="table" style="width:80%; margin-top:3%; border: 1px solid #e6e6ff;" >
      <tr class="success">
         <th colspan="3" style="text-align:center; font-size: 18pt; font-weight: bold; width: 100%" >회원목록(수락거절)</th>
      </tr>
      
      <c:if test="${empty list || list==null }">
      <tr>	
      	<th colspan="3" align="center">
      		<span style="color: purple;" >친구 요청이 없습니다 :( </span> 
      	</th>
      </tr>	
      </c:if>
      <c:if test="${not empty list }">
      
      	<c:forEach var="ynlist" items="${list}" >
         	<!-- ////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/ -->
	           <!-- if제거 -->
	           <tr>
	               <%-- <td style="width:30%; border: 1px solid #e6e6ff; height:200px; background-image: url('/triplan/User/${mlist.userid}/profile.jpg'); background-size: cover; background-position: center center;"></td> --%>
	               <td style="width:50%; border: 1px solid #e6e6ff; text-align: center; vertical-align: middle;">
		               <p>
		              		<span style="color: red;">${ynlist.REQ_ID}</span> 님이 친구요청을 하셨습니다.
	               </td>
	               
	               <td style="width:50%; border: 1px solid #e6e6ff; vertical-align: middle;  text-align: center">
	               		<a onclick="friendadd('${ynlist.REQ_ID}')"><button class="btn btn-info">요청 수락</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	               		<a onclick="friendreqdel('${ynlist.REQ_ID}')"><button class="btn btn-info">요청 거절</button></a>
	               </td>
	            </tr>
	            
            <!-- ////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/ -->  
         </c:forEach>   
          
       </c:if>   
   </table>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<%-- 		<span style="font-weight: bold;font-size:21pt">회원목록(수락거절)</span>
		<c:if test="${empty list }">
			친구 요청이 없습니다!
		</c:if>
		
		<c:if test="${not empty list }">
			
			<!-- 친구 목록 -->
			<c:forEach var="ynlist" items="${list}" varStatus="status">
				<c:if test="${ynlist.YN != 0}">
				<div style="float:left; ; width: 48%; height:150px; border:1px solid #ccc; display: inline-block; margin: 10px 7px 7px 7px ">
					
					<span style="display:inline-block; font-weight: bold; font-size: 13pt; text-align: center">
						${ynlist.REQ_ID}님이 친구요청을 하셨습니다.<br>
						<a onclick="friendadd('${ynlist.REQ_ID}')"><button>요청 수락</button></a>
						<a onclick="friendreqdel('${ynlist.REQ_ID}')"><button>요청 거절</button></a>
					</span>
					
				</div>
				</c:if>
			</c:forEach>
			 
		</c:if>
		
</div>	 --%>	