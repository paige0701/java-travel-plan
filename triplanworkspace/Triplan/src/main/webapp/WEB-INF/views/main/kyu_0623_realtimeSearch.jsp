<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    
    <li id="jh_top"><a href=""><span id="show">* 실시간 검색어 </span></a></li>
	
    <c:forEach items="${rlist}" var="list" varStatus="status">
    	<li>
    		<a href="">
    			<span id="show">${status.count}위&nbsp;${list.SEARCHEDWORD}</span>
    		</a>
    	</li>
    </c:forEach>
   
