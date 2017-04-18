<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

	
    
    <div>
    	<table style="width: 150px; height: 250px;">
    		<tr>
    			<th style="border-bottom: 1px solid green; " colspan="3" align="left"><span style="font-weight: bold; font-size: 12pt;">실시간검색어 </span></th>
    		</tr>
    		<c:if test="${empty list }">
    			그런거 없어요!!ㅠㅠ
    		</c:if>
    		<c:if test="${not empty list}">
    			<c:forEach items="${list}" var="slist">						 
    				<tr align="center">
    					<td>${slist.RNO}</td><td>&nbsp;&nbsp;</td><td>${slist.SEARCHEDWORD}</td>
    				</tr>
    			</c:forEach>
    		</c:if>
    		
    
    	</table>
    
    </div>
    