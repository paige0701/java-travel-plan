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

function jh_addr(t_addr)
{
	var addrarr = t_addr.split(" ");
	var addr = addrarr[0]+" "+addrarr[1];
	
	return addr;
}

</script>


<c:if test="${sc_wishlist == null || empty sc_wishlist }"><div>위시리스트가 없습니다.</div></c:if>
<c:if test="${sc_wishlist != null && not empty sc_wishlist}">
<c:forEach var="sc_wishlist" items="${sc_wishlist}" varStatus="sts" >
<div id="ti${sts.index}"  draggable="true" ondragstart="drag(event)" class="copy">
	<div style="width: 100%;">
		<img src="/triplan/TourInfo/images/${sc_wishlist.T_IDX}/title.jpg" style="height: 10%; width: 10%;">
		<span class="t_name">${sc_wishlist.T_NAME}</span>
		<c:if test="${sc_wishlist.T_TYPE == '1'}">
			 <span style="color: #3399ff" class="view_t_type">관광</span>
		</c:if>
		<c:if test="${sc_wishlist.T_TYPE == '2'}">
			 <span style="color: #e6005c" class="view_t_type">음식</span>
		</c:if>
		<c:if test="${sc_wishlist.T_TYPE == '3'}">
			 <span style="color: #0033cc" class="view_t_type">숙박</span>
		</c:if>
		<c:if test="${sc_wishlist.T_TYPE == '4'}">
			 <span style="color: #ff5c33" class="view_t_type">기타</span>
		</c:if>
		<input type="hidden" value="${sc_wishlist.T_IDX}" class="t_idx"/>
		<input type="hidden" value="${sc_wishlist.T_TYPE}" class="t_type"/>
		<input type="hidden" value="${sc_wishlist.T_RATING}" class="t_rating"/>
		<input type="hidden" value="${sc_wishlist.TX}" class="tx"/>
		<input type="hidden" value="${sc_wishlist.TY}" class="ty"/>
	</div>
</div>
</c:forEach>	
</c:if>	
	
