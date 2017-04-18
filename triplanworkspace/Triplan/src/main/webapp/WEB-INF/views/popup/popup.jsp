 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.spring.model.MemberVO" %>

<%
		MemberVO member = (MemberVO)session.getAttribute("member");
%>

<div id="popup">
	<jsp:include page="NewSchedule.jsp"/>
<input type="hidden" id="pop_ck" name="pop_ck" value="0"/>
</div>