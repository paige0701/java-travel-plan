/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.32
 * Generated at: 2016-07-07 02:19:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.popup;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class NewSchedule_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/triplanworkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Triplan/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1463983535931L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write(" \r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css\" type=\"text/css\" />\r\n");
      out.write("<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"http://code.jquery.com/ui/1.8.18/jquery-ui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\tvar gh_flag = 0;\r\n");
      out.write("\t\r\n");
      out.write("   $(document).ready(function(){\r\n");
      out.write("   \r\n");
      out.write("\t  $(\"#startDatepicker\").datepicker({\r\n");
      out.write("           dateFormat: 'yy-mm-dd'\r\n");
      out.write("     });\r\n");
      out.write("\t   \r\n");
      out.write("\t  $(\"#endDatepicker\").datepicker({\r\n");
      out.write("           dateFormat: 'yy-mm-dd'\r\n");
      out.write("     });\r\n");
      out.write("\t   \r\n");
      out.write("      $(\"#ns_startday\").click(function(){\r\n");
      out.write("\r\n");
      out.write("           $(\"#startDatepicker\").change(function(){\r\n");
      out.write("           \t\r\n");
      out.write("        \t   var ck_date = $(\"#endDatepicker\").val();\r\n");
      out.write("        \t   \r\n");
      out.write("        \t   if(ck_date.trim() != \"\" && ck_date != null)\r\n");
      out.write("               {\r\n");
      out.write("        \t\t   validity( $(\"#startDatepicker\"));\r\n");
      out.write("               }\r\n");
      out.write("        \t   \r\n");
      out.write("           })\r\n");
      out.write("      });\r\n");
      out.write("      \r\n");
      out.write("      $(\"#ns_endday\").click(function(){\r\n");
      out.write("           \r\n");
      out.write("           $(\"#endDatepicker\").change(function(){\r\n");
      out.write("        \t\r\n");
      out.write("        \t   var ck_date = $(\"#startDatepicker\").val();\r\n");
      out.write("        \t   \r\n");
      out.write("        \t   if(ck_date.trim() != \"\" && ck_date != null)\r\n");
      out.write("               {\r\n");
      out.write("        \t\t   validity( $(\"#endDatepicker\"));\r\n");
      out.write("               }\r\n");
      out.write("        \t   \r\n");
      out.write("           })\r\n");
      out.write("           \r\n");
      out.write("           \r\n");
      out.write("      });\r\n");
      out.write("      \r\n");
      out.write("      function validity(date)// 날짜 유효성 검사\r\n");
      out.write("      {\r\n");
      out.write("\t   \t   var sc_start_date = document.getElementById(\"startDatepicker\").value;\r\n");
      out.write("\t   \t   var sc_end_date = document.getElementById(\"endDatepicker\").value;\r\n");
      out.write("\t   \t   \r\n");
      out.write("\t   \t   var arr1 = sc_start_date.split('-');\r\n");
      out.write("\t   \t   var arr2 = sc_end_date.split('-');\r\n");
      out.write("\t   \t   \r\n");
      out.write("\t   \t   var dat1 = new Date(arr1[0], arr1[1], arr1[2]);\r\n");
      out.write("\t   \t   var dat2 = new Date(arr2[0], arr2[1], arr2[2]);\r\n");
      out.write("\t   \t   \r\n");
      out.write("\t   \t   var diff = dat2 - dat1;\r\n");
      out.write("\t   \t   var currDay = 24 * 60 * 60 * 1000; // 시 * 분 * 초 * 밀리세컨\r\n");
      out.write("\t   \t   \r\n");
      out.write("\t   \t   var diffDate = parseInt(diff/currDay);\r\n");
      out.write("\t   \t   \r\n");
      out.write("\t   \t   if(diffDate < 0)\r\n");
      out.write("\t   \t   {\r\n");
      out.write("\t   \t\t   alert(\"출발날짜가 더 먼저에용\");\r\n");
      out.write("\t   \t\t   $(date).val(\"\");\r\n");
      out.write("\t   \t\t   return;\r\n");
      out.write("\t   \t   }\r\n");
      out.write("      }\r\n");
      out.write("      \r\n");
      out.write("      var area_count = 0;\r\n");
      out.write("      \r\n");
      out.write("      $(\".plus1\").hide();\r\n");
      out.write("      $(\".plus2\").hide();\r\n");
      out.write("/*       \r\n");
      out.write("      $(\"#getSchedule\").click(function(){  // 팝업열기\r\n");
      out.write("         \r\n");
      out.write("         if($(\"#pop_ck\").val() == 0)\r\n");
      out.write("         {\r\n");
      out.write("            scrolltop = $(\".head\").offset().top+$(\".head\").height()+50;\r\n");
      out.write("            scrollt = $(window).scrollTop();\r\n");
      out.write("            scrollb = $(window).scrollTop()+20;\r\n");
      out.write("            overlay(1.0);\r\n");
      out.write("            $(\"#newschedule\").css(\"opacity\",1.0);\r\n");
      out.write("            open_pop(\"newschedule\",scrolltop-150);\r\n");
      out.write("            $(\"#pop_ck\").val(\"999\");\r\n");
      out.write("            setTimeout(function(){\r\n");
      out.write("               $(\"#pop_ck\").val(\"1\");\r\n");
      out.write("            },330);\r\n");
      out.write("         }\r\n");
      out.write("      })\r\n");
      out.write("       */\r\n");
      out.write("      \r\n");
      out.write("      $(\".area_choice\").click(function(){\r\n");
      out.write("         \r\n");
      out.write("         var bool = $(this).hasClass(\"plus\");\r\n");
      out.write("         \r\n");
      out.write("         if(bool)\r\n");
      out.write("         {\r\n");
      out.write("            area_count++;\r\n");
      out.write("            \r\n");
      out.write("            $(this).removeClass(\"plus\");\r\n");
      out.write("            \r\n");
      out.write("            if(area_count < 3)\r\n");
      out.write("            {\r\n");
      out.write("               $(\".plus\"+area_count).show();\r\n");
      out.write("            }\r\n");
      out.write("         }\r\n");
      out.write("        \t var isClass1 = $(this).hasClass(\"areaList\");\r\n");
      out.write("        \t \r\n");
      out.write("       \t if(!isClass1)\r\n");
      out.write("       \t {\r\n");
      out.write("       \t\t $(this).html(\"<div class='div_areaList'></div><div class='div_deareaList'></div>\");\r\n");
      out.write("           \t getAreaList($(this).find(\".div_areaList\"));\r\n");
      out.write("           \t $(this).addClass(\"areaList\");\r\n");
      out.write("           \t $(this).css(\"padding-top\",0);\r\n");
      out.write("          \t\t getDeAreaList($(this).find(\".div_deareaList\"), 0);\r\n");
      out.write("       \t }\r\n");
      out.write("       \t else\r\n");
      out.write("       \t {\r\n");
      out.write("       \t\t var div_deareaList = $(this).find(\".div_deareaList\");\r\n");
      out.write("       \t\t \r\n");
      out.write("       \t\t $(this).find(\".div_areaList\").find(\"select\").change(function(){\r\n");
      out.write("       \t\t\t if(gh_flag == 0)\r\n");
      out.write("       \t\t\t {\r\n");
      out.write("       \t\t\t \tgh_flag = 1;\r\n");
      out.write("       \t\t\t \tgetDeAreaList(div_deareaList, $(this).val());\r\n");
      out.write("       \t\t\t }\r\n");
      out.write("       \t\t })\r\n");
      out.write("       \t }\r\n");
      out.write("         \r\n");
      out.write("      });\r\n");
      out.write("   });\r\n");
      out.write("     \r\n");
      out.write("/*    function getSchedule()\r\n");
      out.write("   {\t   \r\n");
      out.write("\t   var sc_name = document.getElementById(\"sc_name\").value;\r\n");
      out.write("\t   \r\n");
      out.write("\t   if(sc_name == null || sc_name.trim() == \"\")\r\n");
      out.write("\t   {\r\n");
      out.write("\t\t\talert(\"제목을 입력해주세요\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t   }\r\n");
      out.write("\t   \r\n");
      out.write("\t   var startDatepicker = document.getElementById(\"startDatepicker\").value;\r\n");
      out.write("\t   var endDatepicker = document.getElementById(\"endDatepicker\").value;\r\n");
      out.write("\t   \r\n");
      out.write("\t   if(startDatepicker == null || startDatepicker.trim() == \"\")\r\n");
      out.write("\t   {\r\n");
      out.write("\t\t   alert(\"출발날짜를 선택해주세요\");\r\n");
      out.write("\t\t   return;\r\n");
      out.write("\t   }\r\n");
      out.write("\t   \r\n");
      out.write("\t   if(endDatepicker == null || endDatepicker.trim() == \"\")\r\n");
      out.write("\t   {\r\n");
      out.write("\t\t   alert(\"돌아오는날짜를 선택해주세요\");\r\n");
      out.write("\t\t   return;\r\n");
      out.write("\t   }\r\n");
      out.write("\t   \r\n");
      out.write("\t   var de_area_code = document.getElementsByName(\"de_area_code\");\r\n");
      out.write("\t   \r\n");
      out.write("\t   for(var i = 0; i < de_area_code.length; i++)\r\n");
      out.write("\t   {\r\n");
      out.write("\t\t\tif(de_area_code[i].value == \"상세지역선택\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\talert(\"상세지역을 선택해주세요.\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t   }\r\n");
      out.write("\t   // 서브밋\r\n");
      out.write("\t   document.getScheduleFrm.submit();\r\n");
      out.write("   }\r\n");
      out.write("    */\r\n");
      out.write("/*     function getAreaList(area)\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\t url: \"/triplan/getAreaInfo.tp\",\r\n");
      out.write("\t\t\t type: \"POST\",\r\n");
      out.write("\t\t\t data: {},  // 전송해야할 데이터\r\n");
      out.write("\t\t\t dataType: \"json\", \r\n");
      out.write("\t\t\t success: function(data) {\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("\t\t\t\tvar html1 = \"<select class='ns_select'>\";\r\n");
      out.write("\t\t    \t\thtml1 += \"<option value='지역선택'>지역선택</option>\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$.each(data, function(entryIndex, entry){\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t    \thtml1 += \"<option value= '\" + entry.area_code + \"'>\" + entry.area_name + \"</option>\";\r\n");
      out.write("\t\t\t        \r\n");
      out.write("\t\t\t\t}); // end of each() -------------\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\thtml1 += \"</select>\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(area).html(html1);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t } \r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("    \r\n");
      out.write("    function getDeAreaList(area, p_area_code)\r\n");
      out.write("    {\r\n");
      out.write("    \t$.ajax({\r\n");
      out.write("\t\t\t url: \"/triplan/getDeAreaInfo.tp\",\r\n");
      out.write("\t\t\t type: \"POST\",\r\n");
      out.write("\t\t\t data: { area_code : p_area_code },  // 전송해야할 데이터\r\n");
      out.write("\t\t\t dataType: \"json\", \r\n");
      out.write("\t\t\t success: function(data) {\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("\t\t\t\tgh_flag = 0;\r\n");
      out.write("\t\t\t\t \r\n");
      out.write("\t\t\t\tvar html2 = \"<select class='ns_select' name='de_area_code'>\";\r\n");
      out.write("\t\t    \t\thtml2 += \"<option value='상세지역선택'>상세지역선택</option>\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$.each(data, function(entryIndex, entry){\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t    \thtml2 += \"<option value= '\" + entry.de_area_code + \"'>\" + entry.de_area_name + \"</option>\";\r\n");
      out.write("\t\t\t        \r\n");
      out.write("\t\t\t\t}); // end of each() -------------\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\thtml2 += \"</select>\";\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(area).html(html2);\r\n");
      out.write("\t\t\t },\r\n");
      out.write("\t\t\t error: function() {\r\n");
      out.write("\t\t\t\t alert(\"err\");\r\n");
      out.write("\t\t\t }\r\n");
      out.write("\t\t});\r\n");
      out.write("    } */\r\n");
      out.write("  \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }\r\n");
      out.write(".ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }\r\n");
      out.write("\r\n");
      out.write(".cs_pubtrans_wrap .traff_slayer3 {\r\n");
      out.write("    overflow: hidden;\r\n");
      out.write("    position: absolute;\r\n");
      out.write("    padding: 6px 16px 6px 5px;\r\n");
      out.write("    border: 1px solid #ccc;\r\n");
      out.write("    background: #fff;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".div_areaList {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 50%;\r\n");
      out.write("\tborder: 0 none;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".div_deareaList {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 50%;\r\n");
      out.write("\tborder: 0 none;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#startDatepicker {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tborder: 0 none;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#endDatepicker {\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tborder: 0 none;\r\n");
      out.write("\ttext-align: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".ns_select {\r\n");
      out.write("\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\theight: 100%;\r\n");
      out.write("\tborder: 0 none;\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("\r\n");
      out.write("}\t\r\n");
      out.write("</style>\r\n");
      out.write("<!-- <body>\r\n");
      out.write(" <div id=\"newschedule\" >\r\n");
      out.write("   <form name=\"getScheduleFrm\" action=\"/triplan/schedule.tp\" method=\"post\">\r\n");
      out.write("      <div id=\"ns_title\">\r\n");
      out.write("         <span style=\"padding-left: 5%;\">새 일정</span>\r\n");
      out.write("         <span class=\"x\" style=\"padding: 0 2% 2% 2%;\">X</span>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"ns_name\">\r\n");
      out.write("         <input type=\"text\" id=\"sc_name\" name=\"sc_name\" placeholder=\"제목!!!\" required />\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"ns_day\">\r\n");
      out.write("         <div id=\"ns_startday\">\r\n");
      out.write("            <input type=\"text\" id=\"startDatepicker\" name=\"sc_start_date\" readonly=\"readonly\" placeholder=\"출발 날짜\" required  />\r\n");
      out.write("         </div>\r\n");
      out.write("         <span>~</span>\r\n");
      out.write("         <div id=\"ns_endday\">\r\n");
      out.write("            <input type=\"text\" id=\"endDatepicker\" name=\"sc_end_date\" readonly=\"readonly\" placeholder=\"돌아오는 날짜\" required />\r\n");
      out.write("         </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div id=\"area_list\">\r\n");
      out.write("         <div class=\"area_choice plus\">\r\n");
      out.write("            <span>+</span>\r\n");
      out.write("         </div>\r\n");
      out.write("         <div class=\"area_choice plus plus1\">\r\n");
      out.write("            <span>+</span>\r\n");
      out.write("         </div>\r\n");
      out.write("         <div class=\"area_choice plus plus2\">\r\n");
      out.write("            <span>+</span>\r\n");
      out.write("         </div>\r\n");
      out.write("         \r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"ns_btn\">\r\n");
      out.write("         <button class=\"btn btn-default\" id=\"ns_btnOK\" type=\"button\" tabindex=\"4\" onClick=\"getSchedule()\"><span class=\"ir_wa\">만들기</span></button>\r\n");
      out.write("      </div>\r\n");
      out.write("   </form>\r\n");
      out.write("</div>  -->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
