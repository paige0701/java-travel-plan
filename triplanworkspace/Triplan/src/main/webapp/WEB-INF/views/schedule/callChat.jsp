<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- ===== Ajax(JSON 을 사용하여 채팅내역 보여주기) ======= --%>

<c:if test="${jsonObjList != null && not empty jsonObjList }">
	${jsonObjList}
</c:if>