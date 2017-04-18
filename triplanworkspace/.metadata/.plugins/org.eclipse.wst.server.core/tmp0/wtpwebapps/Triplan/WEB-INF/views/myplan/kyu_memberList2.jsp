<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.model.MemberVO" %>
    

<%	MemberVO mem = (MemberVO)session.getAttribute("member"); %>

<script type="text/javascript">
	function friendaddreq(uid)
	{
		var ckdata ={ requserid : uid };
		
		var n = confirm("친구요청을 했습니다!");
		if(n == true){
		
		$.ajax({			
   		 	url: "/triplan/friendreq.tp",
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
<style>
	#atag {text-decoration: none;}
</style>
	
	
	<table class="table" style="width:80%; margin-top:3%; border: 1px solid #e6e6ff;" >
      <tr class="success">
         <th colspan="3" style="text-align:center; font-size: 18pt; font-weight: bold; width: 100%" >회원목록</th>
      </tr>
      
      <c:if test="${empty memberList }"><th colspan="3" align="center"><span style="color: purple;">회원이 없습니다 :( </span> </th></c:if>
      <c:if test="${not empty memberList }">
      
      	<c:forEach var="mlist" items="${memberList}" >
         
           <tr>
               <td style="width:30%; border: 1px solid #e6e6ff; height:200px; background-image: url('/triplan/User/${mlist.userid}/profile.jpg'); background-size: cover; background-position: center center;"></td>
               <td style="width:50%; border: 1px solid #e6e6ff; text-align: center; vertical-align: middle;">
	               <p>
	              		${mlist.userid}
	               <p>   
	               		${mlist.name}
	               <p>
	               		${mlist.email}
	               <p>
               </td>
               <td style="width:20%; border: 1px solid #e6e6ff; vertical-align: middle;  text-align: center">
               		<a onclick="friendaddreq('${mlist.userid}')"><button class="btn btn-info">친구요청</button></a>
               </td>
            </tr>
              
         </c:forEach>   
          
       </c:if>   
   </table>   <br>
	