<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- ===== #151. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 7) ======= --%>

<c:if test="${jsonObjList != null && not empty jsonObjList }">
	${jsonObjList}
</c:if>