<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.model.MemberVO" %>
    
<div style="border:1px solid blue;height:100%;width:100%">
<%	MemberVO mem = (MemberVO)session.getAttribute("member"); %>

<script type="text/javascript">
	function friendaddck()
	{
		friendadd.submit();
	}
	
</script> 
<p>
		<span style="font-weight: bold;font-size:21pt">회원목록</span><span style="float: right"><button onclick="friendaddck();"> 친구추가 </button></span>
		<c:if test="${empty memberList }">
			회원이 없습니다.
		</c:if>
		
		<c:if test="${not empty memberList }">
			<form name="friendadd" action="/triplan/friendadd.tp" method="get" >
			
			<!-- 친구 목록 -->
			<c:forEach var="mlist" items="${memberList}" varStatus="status">
				
				<div style="float: left; width: 48%; height:200px; border:1px solid #ccc; display: inline-block; margin: 10px 7px 7px 7px ">
				<img width="40%" height="100%" src="/triplan/resources/image/paige2.jpg">
					<span style="display:inline-block; font-weight: bold; font-size: 13pt; text-align: center">
					<input type="checkbox" name="addchk" value="${mlist.userid }" id="ckk${status.count}" />
						<label for="ckk${status.count}">
						${mlist.userid }<br/>
						${mlist.name}<br/>
						${mlist.email }<br/>
						</label>
					</span>
				</div>
			
			</c:forEach>
			
			 </form>
		</c:if>
		
</div>		