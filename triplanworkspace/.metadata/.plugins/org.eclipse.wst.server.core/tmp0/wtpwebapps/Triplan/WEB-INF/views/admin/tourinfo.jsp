<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<script type="text/javascript">

	$(".table").mouseover(function(){
		
		$("#list").css("overflow", "auto");
	});
	
	$(".table").mouseout(function(){
		
		$("#list").css("overflow", "hidden");
	});



</script>


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
	      <c:if test="${tList == null || empty tList}">
			 <tr><td colspan="4">존재하지 않습니다.</td></tr>
		  </c:if>
		  <c:if test="${tList != null || not empty tList}">
		 	 <c:set var="count" value="0"/>
		 	 <c:forEach var="vo" items="${tList}" varStatus="status">
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