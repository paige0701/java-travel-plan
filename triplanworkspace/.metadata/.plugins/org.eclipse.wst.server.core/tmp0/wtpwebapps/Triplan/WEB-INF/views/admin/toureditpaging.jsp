<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<script type="text/javascript">
$(document).ready(function(){
	
	// alert("${total}");
});


//  관광지 정보수정
	function goChange(t_idx)
	{
		var url = "tourinfochange.tp?t_idx="+t_idx;
		window.open(url, "../admin/yj_tourinfochange",
				"width=665px, height=700px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no"
		);
	}
	
//	관광지 삭제
	function goDelete(t_idx) {
		
	$.ajax({
			
			url: "deltour.tp",
			data: { 
					t_idx : t_idx    
			},
			success: function(){
			
			}
			
		})
		alert("삭제되었습니다.");
		tour();
			
	}
	
//	관광지 추가
	function goAdd()  { 
		
		var url = "adminaddtr.tp";
		window.open(url, "../admin/yj_addtr",
				"width=665px, height=700px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no"
		);
	}
	

function previous(start,end){
//alert("does this ");	
	if(start != 1 ){
	start = parseInt(start) - 10 ;
	end = parseInt(end) - 10;
	
//alert(start);
//alert(end);
	
	var form_data = { 
			 start : start,
			 end : end
			 
	       };
	 
	 	 $.ajax({url: "/triplan/toureditpaging.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here12").empty;
			$("#here12").html(result);  			
			           
	      }// end of success----------------------
	     
	  });// end of $.ajax();----------------------	
	} else if(start == 1){
		 
	    	  alert("전 페이지가 없습니다.");
	    	  return;
	   
		
	}
}

function next(start,end){
	
	//alert("돼냐...");
	//alert(start);
	//alert(end);
	
	//alert("total =" + "${total}");
	var total = "${total}";
	//alert("total="+total);
	//alert("start="+start);
	//alert("end="+end);
	
 	if((parseInt(end) > parseInt(total)) || (parseInt(end) == parseInt(total))){
	
		alert("다음페이지가 없습니다");
		return;
	} 
 	
	var start = parseInt(start) + 10;
	var end = parseInt(end) + 10;
	
	//alert("=========");
	//alert(start);
	//alert(end);
	
	
	var form_data = { 
			start:start,
			end:end
			 
	       };
	 
	 	 $.ajax({url: "/triplan/toureditpaging.tp",
	    	 
	 	  type: "GET",
	      data: form_data, 
	      dataType: "html", 
	      success: function(data){
	   	  var result = data;
	   	   
	   	  	$("#here12").empty;
			$("#here12").html(result);  			
			           
	      }// end of success----------------------
	      
	  });// end of $.ajax();----------------------	
	}
		
	

</script>    
 <table>
         <tr>
            <th style="width:25%">이름</th>
            <th style="width:7%">지역</th>
            <th style="width:8%">분류</th>
            <th style="width:50%">주소</th>
            <th style="width:10%">수정 / 삭제</th>
         </tr>
   
      <hr>
      
      <c:if test="${list == null || empty list }">
         <tr>
            <td colspan="5">데이터가 존재하지 않습니다</td>
         </tr>
      </c:if>
   
      <c:if test="${list != null || not empty list }">
         <c:set var="count" value="0" />
         <c:forEach var="tlist" items="${list}" varStatus="status">
            <tr>
               <td>${tlist.t_name}</td>
               <td>${tlist.de_area_code }</td>
               
               <td>
                  <c:if test="${tlist.t_type == 1}">관광지</c:if>
                  <c:if test="${tlist.t_type == 2}">음식점</c:if>
                  <c:if test="${tlist.t_type == 3}">숙박</c:if>
                  <c:if test="${tlist.t_type == 4}">체험/공연</c:if>
               </td>

               <td>${tlist.t_addr }</td>
               <td><a href="#" onClick="goChange('${tlist.t_idx}');">수정</a> / <a href="#" onclick="goDelete('${tlist.t_idx}');">삭제</a></td>
               </tr>
               <c:set var="count" value="${status.count }" />         
         </c:forEach>      
      </c:if>
      
      </table>
      
      <%-- <tr>
         <td class="mem_total" colspan="4">검색된 관광지수: </td>
         <td class="mem_count" colspan="1" align="right">${count}곳</td>
      </tr> --%>
      
      <br>
    <ul class="pager" style="width:50%">
	    <li class="previous"><a href="#previous" onClick="previous('${start}','${end}')">Previous</a></li>
	    <li class="next"><a href="#next" onClick="next('${start}','${end}')">Next</a></li>
	</ul>