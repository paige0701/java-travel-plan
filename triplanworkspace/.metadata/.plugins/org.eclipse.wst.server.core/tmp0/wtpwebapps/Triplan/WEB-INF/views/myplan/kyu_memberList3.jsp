<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.model.MemberVO" %>
    

<%	MemberVO mem = (MemberVO)session.getAttribute("member"); %>

<script type="text/javascript">
	
	/* 
	function requestList()
	{	
			$.ajax({			
	   		 	url: "/triplan/requestList.tp",
	   		 	type: "GET", 
	   		 	data: ckdata,
	   		 	
	        	 dataType: "html", 
	        	 success: function(data){
	        		$("#friendlist").html(data);	           
	        	 }
	    	 });	
	}
	 */
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
<style>
	#atag {text-decoration: none;}
</style>
 	
 	<table class="table" style="width:80%; margin-top:3%; border: 1px solid #e6e6ff;" >
      <tr class="success">
         <th colspan="3" style="text-align:center; font-size: 18pt; font-weight: bold; width: 100%" >요청중인 친구 목록</th>
      </tr>
      
      <c:if test="${empty reqmemlist}"><th colspan="3" align="center"><span style="color: purple;">요청중인 친구 목록이 없습니다 :(  </span></th></c:if>
      <c:if test="${not empty reqmemlist}">
      
      	<c:forEach var="reqm" items="${reqmemlist}" >
         
           <tr>
               <td style="width:30%; border: 1px solid #e6e6ff; height:200px; background-image: url('/triplan/User/${reqm.userid}/profile.jpg'); background-size: cover; background-position: center center;"></td>
               <td style="width:50%; border: 1px solid #e6e6ff; text-align: center; vertical-align: middle;">
	               <p>
	              		${reqm.userid}
	               <p>   
	               		${reqm.name}
	               <p>
	               		${reqm.email}
	               <p>
               </td>
               <td style="width:20%; border: 1px solid #e6e6ff; vertical-align: middle;  text-align: center">
               		<b>Waiting..</b>
               </td>
            </tr>
              
         </c:forEach>   
          
       </c:if>   
   </table>  