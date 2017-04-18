<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${wl == 0}">
	<input type="button" onClick="addwishlist('${t_idx}','0')" value="위시리스트 추가">
</c:if>

<c:if test="${wl == 1}">
	<input type="button" onClick="addwishlist('${t_idx}','1')" value="위시리스트 해제">
</c:if> 
