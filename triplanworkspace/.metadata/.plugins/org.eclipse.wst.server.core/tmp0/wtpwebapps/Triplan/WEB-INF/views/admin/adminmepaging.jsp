<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script type="text/javascript" >



</script>

<table>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>상태</th>
				<th>활성화 / 비활성화</th>
			</tr>
			
			<hr>

		<c:if test="${mlst == null || empty mlst }">
			<tr>
				<td colspan="z">데이터가 존재하지 않습니다</td>
			</tr>
		</c:if>
		
		<c:if test="${mlst != null || not empty mlst }">
			<c:set var="count" value="0" />
			<c:forEach var="mlst" items="${mlst}" varStatus="status">
				<tr>
					<td>${mlst.name}</td>
					<td>${mlst.userid}</td>
					<td>${mlst.birth1}-${mlst.birth2}-${mlst.birth3}</td>
					<td>${mlst.gender}</td>
					<td>${mlst.email}</td>
					<td>${mlst.mobile}</td>
					<td>
						<c:if test="${mlst.active == 1}">!살아있아!</c:if>
			      		<c:if test="${mlst.active == 0}">!죽었띠!</c:if>
		      		</td>
					<td><a href="#" onclick="goOnOff('${mlst.userid}',1);">활성화</a> / <a href="#" onclick="goOnOff('${mlst.userid}',0);">비활성화</a></td>
					</tr>
					<c:set var="count" value="${status.count }" />			
			</c:forEach>		
		</c:if>
		</table>
	
			
			<%-- <span class="mem_count" >${count}명</span>  --%>
			
<ul class="pager" style="width:50%">
    <li class="previous"><a href="#previous" onClick="previousTen('${start}','${end}')">Previous</a></li>
    <li class="next"><a href="#next" onClick="nextTen('${start}','${end}')">Next</a></li>
</ul>