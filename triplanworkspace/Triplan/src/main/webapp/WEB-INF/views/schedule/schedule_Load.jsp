<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${StringArr}" var="td"  varStatus="status">
	<c:if test="${status.index == 0}"> <thead> </c:if>  
	<c:if test="${status.index == collen}"> <tbody> </c:if>  <!-- 맨윗줄의 입력이 끝났으면  -->
	<c:if test="${status.index == 0 || status.index % collen == 0}"> <tr> </c:if> <!-- 새로운 행추가 -->
	<c:if test="${status.index == 0 || status.index % collen == 0}"> <td class="jh_sctime">${td}</td> </c:if>  <!-- 행의 첫번째 -->
	<c:if test="${status.index % collen != 0}"> <td class="jh_sc_${status.index % collen} <c:if test="${status.index % collen <= 3}">view</c:if>"  >${td}</td> </c:if>  <!-- 행의 나머치 컬럼갯수 -->
	<c:if test="${status.index % collen == collen-1}"> </tr> </c:if> <!-- 행의 모든컴럼을 출력하면 -->
	<c:if test="${status.index == collen-1}"> </thead> </c:if>             <!-- 맨윗줄을 컬럼갯수만큼 출력하면 -->
	<c:if test="${status.last}"> </tbody> </c:if> <!-- 모든행을 출력하면 -->
</c:forEach>
<input type="hidden" id="collen" value="${collen}" />