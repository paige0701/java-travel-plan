<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// *** 세션값 삭제하기 ***
	session.invalidate();

    // 페이지 이동
    response.sendRedirect("/triplan/main.tp");
%>