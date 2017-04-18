<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
</script>
<c:forEach var="sc" items="${list}" >
<%-- 
<%
	String chk = Integer.parseInt();
%>
 --%>
 <style>
 	#likebtn {text-decoration: none;}
 </style>	
	<div class="schedule" onclick="viewSchedule(${sc.SC_IDX});">
		<div class="schedule-image">
			<img width="100%" height="100%" src="/triplan/Schedule/${sc.SC_IDX}/title.jpg" />
		</div>
		<div class="schedule-comment">
			
			<div class="title" style="margin-top:5%; margin-bottom: 3%">
				<span>${sc.SC_NAME}</span>
			</div>
			
			<div align="center" style="margin-top:5%;">
			
			<c:if test="${sc.SC_CHK == 1}">
			<a id="likebtn" style="font-weight:bold; color: red;">Liked <%-- href="/triplan/cd_liked.tp?userid='paige0701'&sc_id='${sc.sc_idx}';"  --%>
				<span class="fa fa-thumbs-o-up"></span>
			</a>
			</c:if>
			
			<c:if test="${sc.SC_CHK == 0 || sc.SC_CHK ==null}">
			<a id="likebtn" style="font-weight:bold;">Like <%-- href="/triplan/cd_liked.tp?userid='paige0701'&sc_id='${sc.sc_idx}';"  --%>
				<span class="fa fa-thumbs-o-up"></span>
			</a>
			</c:if>
			
			&nbsp; 
			<span style="font-weight:bold">${sc.SC_LIKECOUNT}</span> Likes &nbsp; <span style="font-weight:bold">${sc.SC_VIEWCOUNT}</span> Views
			<hr style="margin-top:3%;">
			</div>
			      
		</div>
		<div class="schedule-tag" style="margin-bottom:2%;">
			<span>${sc.SC_TAG}</span>
		</div>
	</div>

</c:forEach>	