<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	
			<button class="btn btn-info" type="button" name="cd_delete" style=" margin-bottom:1%" onclick="javascript:deleteWishList()">위시리스트삭제</button>				 
				<table id="cd_wishlist" class="table" style="width: 100%">
					<tr class="success">
						<th style="width:10%">&nbsp;<input type = "checkbox"  id = "allCheckorNone" onClick = "allCheckBox()" />
						<label for = "allCheckorNone">전체선택</label>
						</th>
						<th colspan="3" style="text-align:center; font-size: 18pt; font-weight: bold; width: 90%">위시리스트</th>
					</tr>
					<c:if test="${empty wishsearchlist }"><td colspan="4"><span style="text-align: center; margin-left: 47%; font-weight: bold">검색한 결과가 없습니다</span></td></c:if>
					<c:if test="${not empty wishsearchlist}">
					
				<c:forEach var="wishsearchlist" items="${wishsearchlist}" >
					
							<tr>
								<td align="center" style="width:10%; vertical-align: middle"><input type = "checkbox" name ="chkboxpnum" value="${wishsearchlist.T_IDX}" id ="check" /></td>
								<td style="width:30%; background-image: url('/triplan/TourInfo/images/${wishsearchlist.T_IDX}/title.jpg'); background-size: cover; background-position: center center;"><%-- <img style="width:100% ;height:200px;" src="/triplan/TourInfo/images/${wishregionlist.T_IDX}/title.jpg" /> --%></td>
								<td style="width:50%; text-align: center">
								<p><br/>
								<span style="font-weight: bold;font-size: 16pt; ">${wishsearchlist.T_NAME}</span><br/><br/>
								<p>	
								${wishsearchlist.T_ADDR}
								<p>
								별점 : ${wishsearchlist.T_RATING}
								<p>
								<hr>
								${wishsearchlist.T_DETAIL}
								<p>
								</td>
								<td style="width:10%; vertical-align: middle;  text-align: center">
								<a onclick="javascript:deleteWishlist1('${wishsearchlist.T_IDX}')">삭제
								<%-- <input type = "hidden" name = "t_idx" value="${wlist.T_IDX}" /> --%>
								</a>
								</td>
							</tr>
								
	     	   </c:forEach>	
		 	</c:if>	
		  </table>	
