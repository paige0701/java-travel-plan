<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<select id="yj_de_area_code" name="de_area_code" class="area">
				
		<c:forEach var="tdalist" items="${tdalist}">
				
		           <option value="${tdalist.de_area_code}">${tdalist.de_area_name}</option>
            
		 </c:forEach>   
		        
</select>