<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<style type="text/css">



</style>

<script type="text/javascript"> 

$(".table").mouseover(function(){
	
	$("#aftersearch").css("overflow", "auto");
});


$(".table").mouseout(function(){
	
	$("#aftersearch").css("overflow", "hidden");
});

</script>



			<button class="btn btn-info" type="button" name="cd_delete" style="margin-bottom:1%" onclick="javascript:deleteWishList()">위시리스트삭제</button>				 
				<table id="cd_wishlist" class="table" style="width: 100%">
					<tr class="success">
						<th style="width:10%">&nbsp;<input type = "checkbox"  id = "allCheckorNone" onClick = "allCheckBox()" />
						<label for = "allCheckorNone">전체선택</label>
						</th>
						<th colspan="3" style="text-align:center; font-size: 18pt; font-weight: bold; width: 90%" >위시리스트</th>
					</tr>
					<c:if test="${empty wishregionlist }"><th colspan="4">없당 !</th></c:if>
					<c:if test="${not empty wishregionlist}">
					
				<c:forEach var="wishregionlist" items="${wishregionlist}" >
					
							<tr>
								<td align="center" style="width:10%; vertical-align: middle"><input type = "checkbox" name ="chkboxpnum" value="${wishregionlist.T_IDX}" id ="chkboxpnum" class ="chkboxpnum"/></td>
								<td style="width:30%; background-image: url('/triplan/TourInfo/images/${wishregionlist.T_IDX}/title.jpg'); background-size: cover; background-position: center center;"><%-- <img style="width:100%;height:auto;  " src="/triplan/TourInfo/images/${wishregionlist.T_IDX}/title.jpg"   /> --%></td>
								<td style="width:50%; text-align: center">
								<p><br/>
								<span style="font-weight: bold;font-size: 16pt; ">${wishregionlist.T_NAME}</span>
								<p>	
								${wishregionlist.T_ADDR}
								<p>
								별점 : ${wishregionlist.T_RATING}
								<p>
								<hr>
								${wishregionlist.T_DETAIL}
								<p>
								</td>
								<td style="width:10%; vertical-align: middle;  text-align: center">
								<a onclick="javascript:deleteWishlist1('${wishregionlist.T_IDX}')">삭제</a>
								</td>
							</tr>
								
	     	   </c:forEach>	
		 	</c:if>	
		  </table>	
