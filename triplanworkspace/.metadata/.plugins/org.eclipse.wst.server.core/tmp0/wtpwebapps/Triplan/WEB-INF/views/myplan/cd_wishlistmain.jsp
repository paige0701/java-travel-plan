<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<form id="cd_deletewishlist" name="cd_deletewishlist" action="/triplan/cd_deleteOneWishList.tp">
			<button class="table" type="button" name="cd_delete" style="float:left; margin-right:1%; margin-bottom:1%" onclick="goDel()">위시리스트삭제</button>				 
				<table id="cd_wishlist">
					<tr>
						<th>&nbsp;<input type = "checkbox"  id = "allCheckorNone" onClick = "allCheckBox()" />
						<label for = "allCheckorNone">전체선택</label>
						</th>
						<th colspan="3" style="text-align:center; font-size: 18pt; font-weight: bold">위시리스트</th>
					</tr>
					<c:if test="${empty wlist }"><th colspan="4">가고싶은 곳을 위시리스트에 넣으세용 !</th></c:if>
					<c:if test="${not empty wlist}">
					
				<c:forEach var="wlist" items="${wlist}" >
					
							<tr>
								<td align="center" style="width:100px"><input type = "checkbox" name ="chkboxpnum" value="${wlist.T_IDX}" id ="check" /></td>
								<td style="width:200px"><img style="width:100% ;height:200px;" src="/triplan/resources/image/${wlist.T_IMAGE1}" /></td>
								<td style="width:400px; text-align: center">
								<p><br/>
								<span style="font-weight: bold;font-size: 16pt; ">${wlist.T_NAME}</span><br/><br/>
								<p>	
								${wlist.T_ADDR}<br/>
								<p><p><br/>
								별점 : ${wlist.T_RATING}<br/>
								<p>
								<hr>
								${wlist.T_DETAIL}
								<p><br/>
								</td>
								<td style="width:100px">
								<a onclick="goDelOne('${wlist.T_IDX}')">삭제
								<%-- <input type = "hidden" name = "t_idx" value="${wlist.T_IDX}" /> --%>
								</a>
								</td>
							</tr>
								
	     	   </c:forEach>	
		 	</c:if>	
		  </table>	
		</form>		