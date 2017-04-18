<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<style type="text/css">

	

</style>

<c:forEach var="sc" items="${sc_list}" >

	<div class="cd_schedule" onclick="viewSchedule(${sc.sc_idx});">
		<div class="cd_schedule-image">
			<img width="100%" height="100%" src="/triplan/Schedule/${sc.sc_idx}/title.jpg" />
		</div>
		<div class="cd_schedule-comment">
		<div><a id="likebtn" style="border:0px solid orange; text-decoration:none !important; border-radius:15px; font-weight:bold;font-size:10pt; padding:5px;">Like
		<span class="fa fa-thumbs-o-up"></span></a>&nbsp;<span style="font-weight:bold">${sc.sc_likecount}</span> Likes &nbsp; <span style="font-weight:bold">${sc.sc_viewcount}</span> Views
		
		</div>
		<hr style="margin-top:8px;">
			<span class="cd_title" style="font-size:17pt; margin-top:1%">${sc.sc_name}</span><br>
		</div>
	</div>

</c:forEach>