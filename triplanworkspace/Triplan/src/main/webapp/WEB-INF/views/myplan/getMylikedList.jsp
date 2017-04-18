<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:if test="${likelist == null || empty likelist}">
	<div class="cd_schedule">
	<span style="font-size: 20pt;">Liked 목록이 없습니다!</span>
	</div>
</c:if>

<c:if test="${likelist != null && not empty likelist }">

<c:forEach var="ls" items="${likelist}" >

	<div class="cd_schedule" onclick="viewSchedule(${ls.IDX});" id="list">
		<div class="cd_schedule-image">
			<img width="100%" height="100%" src="/triplan/Schedule/${ls.IDX}/title.jpg" />
		</div>
		<div class="cd_schedule-comment">
		<div><a id="likebtn" style="border:0px solid orange; text-decoration:none !important; border-radius:15px; font-weight:bold;font-size:10pt; padding:5px;" onclick="">Like
		<span class="fa fa-thumbs-o-up"></span></a>&nbsp; ${ls.LIKECNT} Likes &nbsp; ${ls.VIEWCNT} Views
		
		</div>
		<hr style="margin-top:8px;margin-bottom:8px;">
			<span class="cd_title">${ls.NAME}</span><br>
		</div>
	</div>

</c:forEach>

</c:if>