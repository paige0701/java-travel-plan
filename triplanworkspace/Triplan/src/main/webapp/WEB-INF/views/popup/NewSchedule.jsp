 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">

	var gh_flag = 0;
	
   $(document).ready(function(){
   
	  $("#startDatepicker").datepicker({
           dateFormat: 'yy-mm-dd'
     });
	   
	  $("#endDatepicker").datepicker({
           dateFormat: 'yy-mm-dd'
     });
	   
      $("#ns_startday").click(function(){

           $("#startDatepicker").change(function(){
           	
        	   var ck_date = $("#endDatepicker").val();
        	   
        	   if(ck_date.trim() != "" && ck_date != null)
               {
        		   validity( $("#startDatepicker"));
               }
        	   
           })
      });
      
      $("#ns_endday").click(function(){
           
           $("#endDatepicker").change(function(){
        	
        	   var ck_date = $("#startDatepicker").val();
        	   
        	   if(ck_date.trim() != "" && ck_date != null)
               {
        		   validity( $("#endDatepicker"));
               }
        	   
           })
           
           
      });
      
      function validity(date)// 날짜 유효성 검사
      {
	   	   var sc_start_date = document.getElementById("startDatepicker").value;
	   	   var sc_end_date = document.getElementById("endDatepicker").value;
	   	   
	   	   var arr1 = sc_start_date.split('-');
	   	   var arr2 = sc_end_date.split('-');
	   	   
	   	   var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	   	   var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	   	   
	   	   var diff = dat2 - dat1;
	   	   var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨
	   	   
	   	   var diffDate = parseInt(diff/currDay);
	   	   
	   	   if(diffDate < 0)
	   	   {
	   		   alert("출발날짜가 더 먼저에용");
	   		   $(date).val("");
	   		   return;
	   	   }
      }
      
      var area_count = 0;
      
      $(".plus1").hide();
      $(".plus2").hide();
/*       
      $("#getSchedule").click(function(){  // 팝업열기
         
         if($("#pop_ck").val() == 0)
         {
            scrolltop = $(".head").offset().top+$(".head").height()+50;
            scrollt = $(window).scrollTop();
            scrollb = $(window).scrollTop()+20;
            overlay(1.0);
            $("#newschedule").css("opacity",1.0);
            open_pop("newschedule",scrolltop-150);
            $("#pop_ck").val("999");
            setTimeout(function(){
               $("#pop_ck").val("1");
            },330);
         }
      })
       */
      
      $(".area_choice").click(function(){
         
         var bool = $(this).hasClass("plus");
         
         if(bool)
         {
            area_count++;
            
            $(this).removeClass("plus");
            
            if(area_count < 3)
            {
               $(".plus"+area_count).show();
            }
         }
        	 var isClass1 = $(this).hasClass("areaList");
        	 
       	 if(!isClass1)
       	 {
       		 $(this).html("<div class='div_areaList'></div><div class='div_deareaList'></div>");
           	 getAreaList($(this).find(".div_areaList"));
           	 $(this).addClass("areaList");
           	 $(this).css("padding-top",0);
          		 getDeAreaList($(this).find(".div_deareaList"), 0);
       	 }
       	 else
       	 {
       		 var div_deareaList = $(this).find(".div_deareaList");
       		 
       		 $(this).find(".div_areaList").find("select").change(function(){
       			 if(gh_flag == 0)
       			 {
       			 	gh_flag = 1;
       			 	getDeAreaList(div_deareaList, $(this).val());
       			 }
       		 })
       	 }
         
      });
   });
     
/*    function getSchedule()
   {	   
	   var sc_name = document.getElementById("sc_name").value;
	   
	   if(sc_name == null || sc_name.trim() == "")
	   {
			alert("제목을 입력해주세요");
			return;
	   }
	   
	   var startDatepicker = document.getElementById("startDatepicker").value;
	   var endDatepicker = document.getElementById("endDatepicker").value;
	   
	   if(startDatepicker == null || startDatepicker.trim() == "")
	   {
		   alert("출발날짜를 선택해주세요");
		   return;
	   }
	   
	   if(endDatepicker == null || endDatepicker.trim() == "")
	   {
		   alert("돌아오는날짜를 선택해주세요");
		   return;
	   }
	   
	   var de_area_code = document.getElementsByName("de_area_code");
	   
	   for(var i = 0; i < de_area_code.length; i++)
	   {
			if(de_area_code[i].value == "상세지역선택")
			{
				alert("상세지역을 선택해주세요.");
				return;
			}
	   }
	   // 서브밋
	   document.getScheduleFrm.submit();
   }
    */
/*     function getAreaList(area)
	{
		$.ajax({
			 url: "/triplan/getAreaInfo.tp",
			 type: "POST",
			 data: {},  // 전송해야할 데이터
			 dataType: "json", 
			 success: function(data) {
				 
				var html1 = "<select class='ns_select'>";
		    		html1 += "<option value='지역선택'>지역선택</option>";
				
				$.each(data, function(entryIndex, entry){
					
			    	html1 += "<option value= '" + entry.area_code + "'>" + entry.area_name + "</option>";
			        
				}); // end of each() -------------
				
				html1 += "</select>";
				
				$(area).html(html1);
				
			 } 
		});
		
	}
    
    function getDeAreaList(area, p_area_code)
    {
    	$.ajax({
			 url: "/triplan/getDeAreaInfo.tp",
			 type: "POST",
			 data: { area_code : p_area_code },  // 전송해야할 데이터
			 dataType: "json", 
			 success: function(data) {
				 
				gh_flag = 0;
				 
				var html2 = "<select class='ns_select' name='de_area_code'>";
		    		html2 += "<option value='상세지역선택'>상세지역선택</option>";
				
				$.each(data, function(entryIndex, entry){
					
			    	html2 += "<option value= '" + entry.de_area_code + "'>" + entry.de_area_name + "</option>";
			        
				}); // end of each() -------------
				
				html2 += "</select>";
				
				$(area).html(html2);
			 },
			 error: function() {
				 alert("err");
			 }
		});
    } */
  
</script>

<style type="text/css">
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }

.cs_pubtrans_wrap .traff_slayer3 {
    overflow: hidden;
    position: absolute;
    padding: 6px 16px 6px 5px;
    border: 1px solid #ccc;
    background: #fff;
}

.div_areaList {
	width: 100%;
	height: 50%;
	border: 0 none;
	position: relative;
}

.div_deareaList {
	width: 100%;
	height: 50%;
	border: 0 none;
	position: relative;
}

#startDatepicker {
	width: 100%;
	height: 100%;
	border: 0 none;
	text-align: center;
}

#endDatepicker {
	width: 100%;
	height: 100%;
	border: 0 none;
	text-align: center;
}

.ns_select {

	width: 100%;
	height: 100%;
	border: 0 none;
	position: relative;

}	
</style>
<!-- <body>
 <div id="newschedule" >
   <form name="getScheduleFrm" action="/triplan/schedule.tp" method="post">
      <div id="ns_title">
         <span style="padding-left: 5%;">새 일정</span>
         <span class="x" style="padding: 0 2% 2% 2%;">X</span>
      </div>
      <div id="ns_name">
         <input type="text" id="sc_name" name="sc_name" placeholder="제목!!!" required />
      </div>
      <div id="ns_day">
         <div id="ns_startday">
            <input type="text" id="startDatepicker" name="sc_start_date" readonly="readonly" placeholder="출발 날짜" required  />
         </div>
         <span>~</span>
         <div id="ns_endday">
            <input type="text" id="endDatepicker" name="sc_end_date" readonly="readonly" placeholder="돌아오는 날짜" required />
         </div>
      </div>

      <div id="area_list">
         <div class="area_choice plus">
            <span>+</span>
         </div>
         <div class="area_choice plus plus1">
            <span>+</span>
         </div>
         <div class="area_choice plus plus2">
            <span>+</span>
         </div>
         
      </div>
      <div id="ns_btn">
         <button class="btn btn-default" id="ns_btnOK" type="button" tabindex="4" onClick="getSchedule()"><span class="ir_wa">만들기</span></button>
      </div>
   </form>
</div>  -->