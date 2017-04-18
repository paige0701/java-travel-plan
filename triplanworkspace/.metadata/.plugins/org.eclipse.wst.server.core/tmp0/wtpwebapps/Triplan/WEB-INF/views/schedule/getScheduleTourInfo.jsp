<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:if test="${tList == null || empty tList }"><div>지역정보가 없습니다.</div></c:if>
<c:if test="${tList != null && not empty tList}">
<c:forEach var="vo" items="${tList}" varStatus="sts" >
<div id="ti${sts.index}"  draggable="true" ondragstart="drag(event)" class="copy">
<div style="width: 100%;">
	<img src="/triplan/TourInfo/images/${vo.t_idx}/title.jpg" style="height: 10%; width: 10%;">
	<span class="t_name">${vo.t_name}</span>
	<c:if test="${vo.t_type == '1'}">
		 <span style="color: #3399ff" class="view_t_type">관광</span>
	</c:if>
	<c:if test="${vo.t_type == '2'}">
		 <span style="color: #e6005c" class="view_t_type">음식</span>
	</c:if>
	<c:if test="${vo.t_type == '3'}">
		 <span style="color: #0033cc" class="view_t_type">숙박</span>
	</c:if>
	<c:if test="${vo.t_type == '4'}">
		 <span style="color: #ff5c33" class="view_t_type">기타</span>
	</c:if>
	<input type="hidden" value="${vo.t_idx}" class="t_idx"/>
	<input type="hidden" value="${vo.t_type}" class="t_type"/>
	<input type="hidden" value="${vo.t_rating}" class="t_rating"/>
	<input type="hidden" value="${vo.tx}" class="tx"/>
	<input type="hidden" value="${vo.ty}" class="ty"/>
</div>
</div>
</c:forEach>	
</c:if>	
	