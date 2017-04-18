<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
	
	<tr><td colspan="3">관광지 별점 순위</td></tr>
	<tr>	
		<td>순위
		</td>
		<td>이름
		</td>
		<td>점수(별점)
		</td>
		
	</tr>
<c:if test="${empty tourRating }">
<tr>
		<td colspan="3">관광지 정보가 없습니다.</td>
		</tr>
</c:if>
<c:if test="${tourRating != null }">
	<c:forEach var="tourRating" items="${tourRating }">
		<tr>
		<td >${tourRating.RANKING }
		</td>
		<td>${tourRating.NAME }
		</td>
		<td>${tourRating.RATING }
		</td>
		</tr>
	</c:forEach>
</c:if>
	
</table>
		
<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
	<tr><td colspan="3">음식점 별점 순위</td></tr>
	<tr>	
		<td>순위
		</td>
		<td>이름
		</td>
		<td>점수(별점)
		</td>
	</tr>
<c:if test="${empty foodRating }">
<tr>
		<td colspan="3">음식점 정보가 없습니다.</td>
		</tr>
</c:if>
<c:if test="${foodRating != null }">
	<c:forEach var="foodRating" items="${foodRating }">
		<tr>
		<td >${foodRating.RANKING }
		</td>
		<td>${foodRating.NAME }
		</td>
		<td>${foodRating.RATING }
		</td>
		</tr>
	</c:forEach>
</c:if>
		
</table>	

<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
	<tr><td colspan="3">숙박시설 별점 순위</td></tr>
	<tr>	
		<td>순위
		</td>
		<td>이름
		</td>
		<td>점수(별점)
		</td>
	</tr>
<c:if test="${empty hotelRating }">
		<tr>
		<td colspan="3">숙박시설 정보가 없습니다.</td>
		</tr>
</c:if>
<c:if test="${hotelRating != null }">
	<c:forEach var="hotelRating" items="${hotelRating }">
		<tr>
		<td >${hotelRating.RANKING }
		</td>
		<td>${hotelRating.NAME }
		</td>
		<td>${hotelRating.RATING }
		</td>
		</tr>
	</c:forEach>
</c:if>	
</table>		

<table class="table" style="margin-top:5%;margin-bottom:5%;  width: 68%; text-align: center;" >
			
	<tr><td colspan="3">체험,전시 별점 순위</td></tr>
	<tr>	
		<td>순위
		</td>
		<td>이름
		</td>
		<td>점수(별점)
		</td>
	</tr>
<c:if test="${empty  otherRating}">
<tr>
		<td colspan="3">체험, 전시  정보가 없습니다.</td>
		</tr>
</c:if>
<c:if test="${otherRating != null }">
	<c:forEach var="otherRating" items="${otherRating }">
		<tr>
		<td >${otherRating.RANKING }
		</td>
		<td>${otherRating.NAME }
		</td>
		<td>${otherRating.RATING }
		</td>
		</tr>
	</c:forEach>
</c:if>
</table>


















		
	