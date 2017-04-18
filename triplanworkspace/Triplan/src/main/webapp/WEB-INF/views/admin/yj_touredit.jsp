<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<script type="text/javascript">
$(document).ready(function(){
	
	$("#search").focus(function(){
		
		$(this).keydown(function(event){
			if(event.keyCode == 13)
			{
				goSearchtour();
				event.preventDefault();
			}
		})
		
	})	
	
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
	
	
	var total = "${total}";
	//alert("total="+total);
	//alert("start="+start);
	//alert("end="+end);
	
	
	if((end > total) || (end == total)){
	
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
		
//관광지 검색
function goSearchtour() {
	
	
	var column = $("#column").val();
	var search = $("#search").val();

	$.ajax({
		
		url: "admintour.tp",
		data: {
			column : column,
			search : search
		},
		dataType: "html",
		success: function(data){
			
			/* $("#yj_memb+er").html(data); */
			
			
			
			$("#yj_show").html(data);
		
		}
		
		
		
	})

}
	

</script>    

   <div align="center" style="margin-top: 50px; width:100%;">
   
   <h2>모든 관광지</h2>
               
   <p>
      <select name="column" id="column" >
         <option value="t_name">이름</option>
         <option value="de_area_code">지역</option>
         <option value="t_type">관광지</option>
      </select>
      <input type="text" name="search" id="search" size="20">

      <button type="button" onClick="goSearchtour();">검색</button>

   <p>    
   
<div id="here12">
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
	</div>
    <button type="button" onClick="tour();" class="btn btn-success">목록보기</button>
    <button type="button" onClick="goAdd();" class="btn btn-info">추가</button>
   </div>
   <hr>