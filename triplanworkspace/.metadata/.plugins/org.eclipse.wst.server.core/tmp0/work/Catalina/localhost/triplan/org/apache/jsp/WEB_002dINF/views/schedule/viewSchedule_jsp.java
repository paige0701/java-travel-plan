/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.32
 * Generated at: 2016-07-07 02:17:57 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.schedule;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.spring.model.*;
import java.util.*;

public final class viewSchedule_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("com.spring.model");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

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
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<script src=\"http://maps.googleapis.com/maps/api/js?key=AIzaSyAfN2Bk4lSWLI3icy1x15wZXvLY0XpAims\"></script>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\t#screen{\r\n");
      out.write("\t\theight:auto;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#totalscreen {\r\n");
      out.write("\t\theight:auto;\r\n");
      out.write("\t\tpadding: 0 9% 0 15%;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("  #leftscreen {\r\n");
      out.write("  \t  width:35%;\r\n");
      out.write("  \t  height:auto;\r\n");
      out.write("  \t  float:left;\r\n");
      out.write("  \t  padding-left:10px;\r\n");
      out.write("  \t  padding-top:5%;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  #rightscreen {\r\n");
      out.write("  \t  width:60%;\r\n");
      out.write("  \t  height:auto;\r\n");
      out.write("  \t  float:left;\r\n");
      out.write("  \t  padding-left: 1%;\r\n");
      out.write("  \t  padding-right:10px;\r\n");
      out.write("  \t  padding-top:5%;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  #chatscreen {\r\n");
      out.write("  \tmargin: 52px 0 0 0;\r\n");
      out.write("  \tleft: 100%;\r\n");
      out.write("  \twidth: 0%;\r\n");
      out.write("  \theight: 89%;\r\n");
      out.write("  \tfloat: right;\r\n");
      out.write("  \tposition: fixed;\r\n");
      out.write("  \tborder: 1px solid #ddd;\r\n");
      out.write("  \tbackground-color :  #f2f2f2;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  #chatroom {\r\n");
      out.write("  \tdisplay: none;\r\n");
      out.write("  \theight: 100%;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  #googleMap {\r\n");
      out.write("      height:40%;\r\n");
      out.write("      width:100%;\r\n");
      out.write("      float:right;\r\n");
      out.write("  \t  padding-right:10px;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  #edsc_search {\r\n");
      out.write("  \tpadding-left: 10%;\r\n");
      out.write("  \tfloat: left;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  #timeTable {\r\n");
      out.write("      height:auto;\r\n");
      out.write("      width:100%;\r\n");
      out.write("      float:left;\r\n");
      out.write("  \t  padding-left:10px;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  #list {\r\n");
      out.write("      height:50%;\r\n");
      out.write("      width:100%;\r\n");
      out.write("      float:right;\r\n");
      out.write("  \t  padding-right:10px;\r\n");
      out.write("  \t  padding-top:10px;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  #list>ul>li>a {\r\n");
      out.write("  \tpadding : 7px 13px;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  #display_tlist {\r\n");
      out.write("  \tmin-height: 130%;\r\n");
      out.write("  \tmax-height: 130%;\r\n");
      out.write("  \toverflow-y: auto;\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("  #jh_table {  \r\n");
      out.write("  \ttext-align: center;\r\n");
      out.write("  \tfont-size: 92%;\r\n");
      out.write("  }\r\n");
      out.write(" \r\n");
      out.write("  .jh_sctime {\r\n");
      out.write("  \twidth: 10% !important;\t\r\n");
      out.write("  \tdisplay: table-cell !important;\r\n");
      out.write("  \ttable-layout: fixed;\r\n");
      out.write("  }\r\n");
      out.write(" \r\n");
      out.write(" #jh_table>thead>tr>td {\r\n");
      out.write(" \tpadding : 8px;\r\n");
      out.write(" \twidth: 30% ;\r\n");
      out.write(" \tdisplay : none;\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write(" #jh_table>tbody>tr>td {\r\n");
      out.write(" \tpadding : 8px;\r\n");
      out.write(" \twidth: 30% ;\r\n");
      out.write(" \tdisplay : none;\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  .view {\r\n");
      out.write("  \tdisplay: table-cell !important;\r\n");
      out.write("  }\r\n");
      out.write(" \r\n");
      out.write(" .jh_btn_left, .jh_btn_right {\r\n");
      out.write("\tmargin: 0;\r\n");
      out.write("\tcolor: blue;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write(" }\r\n");
      out.write("  \r\n");
      out.write(" .ti_on_sc1{\r\n");
      out.write(" \tborder: 1px solid #3399ff;\r\n");
      out.write(" \tbackground-color: #cce6ff;\r\n");
      out.write(" \tpadding : 0;\r\n");
      out.write(" \tfont-size: 10pt !important;\r\n");
      out.write(" }\r\n");
      out.write(" .ti_on_sc1 img{\r\n");
      out.write(" \tmargin-top: 2px;\r\n");
      out.write(" \tmargin-bottom: 2px;\r\n");
      out.write(" \theight: 24px !important;\r\n");
      out.write(" \twidth: 24px !important;\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write(" .ti_on_sc2{\r\n");
      out.write(" \tborder: 1px solid #e6005c;\r\n");
      out.write(" \tbackground-color: #ffcce0;\r\n");
      out.write(" \tpadding : 0;\r\n");
      out.write(" \tfont-size: 10pt !important;\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write(" .ti_on_sc2 img{\r\n");
      out.write(" \tmargin-top: 2px;\r\n");
      out.write(" \tmargin-bottom: 2px;\r\n");
      out.write(" \theight: 24px !important;\r\n");
      out.write(" \twidth: 24px !important;\r\n");
      out.write(" }\r\n");
      out.write(" .ti_on_sc3{\r\n");
      out.write(" \tborder: 1px solid #0033cc;\r\n");
      out.write(" \tbackground-color: #ccd9ff;\r\n");
      out.write(" \tpadding : 0;\r\n");
      out.write(" \tfont-size: 10pt !important;\r\n");
      out.write(" }\r\n");
      out.write(" \r\n");
      out.write(" .ti_on_sc3 img{\r\n");
      out.write(" \tmargin-top: 2px;\r\n");
      out.write(" \tmargin-bottom: 2px;\r\n");
      out.write(" \theight: 24px !important;\r\n");
      out.write(" \twidth: 24px !important;\r\n");
      out.write(" }\r\n");
      out.write(" .ti_on_sc4{\r\n");
      out.write(" \tborder: 1px solid #ff5c33;\r\n");
      out.write(" \tbackground-color: #ffd6cc;\r\n");
      out.write(" \tpadding : 0;\r\n");
      out.write(" \tfont-size: 10pt !important;\r\n");
      out.write(" }\r\n");
      out.write("  \r\n");
      out.write(" .ti_on_sc4 img{\r\n");
      out.write(" \tmargin-top: 2px;\r\n");
      out.write(" \tmargin-bottom: 2px;\r\n");
      out.write(" \theight: 24px !important;\r\n");
      out.write(" \twidth: 24px !important;\r\n");
      out.write(" }\r\n");
      out.write("  \r\n");
      out.write(" .copy {\r\n");
      out.write(" \tborder: 1px solid #ddd;\r\n");
      out.write(" \tborder-top: none;\r\n");
      out.write(" \tfont-size: 12pt;\r\n");
      out.write(" }\r\n");
      out.write("  \r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print( request.getContextPath() );
      out.write("/resources/js/jquery-2.0.0.js\" ></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\r\n");
      out.write("\t\tjh_read(");
      out.print(request.getAttribute("sc_idx"));
      out.write(");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar j = 0;\r\n");
      out.write("\t\t\r\n");
      out.write("\t})\r\n");
      out.write("\r\n");
      out.write("\tvar touridxarr = new Array();\r\n");
      out.write("\tvar map;\r\n");
      out.write("\tvar tdcount;\r\n");
      out.write("\tvar viewnum = 1;\r\n");
      out.write("\tvar infowindows = new Array();\r\n");
      out.write("\tvar infowindowcount = 0;\r\n");
      out.write("\tvar openinfowindow = 0;\r\n");
      out.write("\r\n");
      out.write("   function noinsc_map()\r\n");
      out.write("   {\r\n");
      out.write("\t   var mycenterX = 36.568993;\r\n");
      out.write("\t   var mycenterY = 128.032776;\r\n");
      out.write("\t   \r\n");
      out.write("\t   var mycenter = new google.maps.LatLng(mycenterX, mycenterY);\r\n");
      out.write("\t   \r\n");
      out.write("\t   var mapProp = {\r\n");
      out.write("\t     center:mycenter,\r\n");
      out.write("\t     zoom: 7,\r\n");
      out.write("\t     mapTypeId:google.maps.MapTypeId.ROADMAP\r\n");
      out.write("\t     };\r\n");
      out.write("\t    \r\n");
      out.write("\t   map=new google.maps.Map(document.getElementById(\"googleMap\"),mapProp);\r\n");
      out.write("\t   \r\n");
      out.write("   }\r\n");
      out.write("\t\r\n");
      out.write("   function initialize(inscarr)\r\n");
      out.write("   {\r\n");
      out.write("\t   var mycenterX = $(inscarr).find(\".tx\").val();\r\n");
      out.write("\t   var mycenterY = $(inscarr).find(\".ty\").val();\r\n");
      out.write("\t   \r\n");
      out.write("\t   var mycenter = new google.maps.LatLng(mycenterX, mycenterY);\r\n");
      out.write("\t   \r\n");
      out.write("\t   var mapProp = {\r\n");
      out.write("\t     center:mycenter,\r\n");
      out.write("\t     zoom: 8,\r\n");
      out.write("\t     mapTypeId:google.maps.MapTypeId.ROADMAP\r\n");
      out.write("\t     };\r\n");
      out.write("\t    \r\n");
      out.write("\t   map=new google.maps.Map(document.getElementById(\"googleMap\"),mapProp);\r\n");
      out.write("\t   \r\n");
      out.write("\t   addMap(inscarr)\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   function addMap(inscarr)\r\n");
      out.write("   {\r\n");
      out.write("\t      var mypositionX = $(inscarr).find(\".tx\").val();\r\n");
      out.write("\t      var mypositionY = $(inscarr).find(\".ty\").val();\r\n");
      out.write("\t   \r\n");
      out.write("\t      var myposition = new google.maps.LatLng(mypositionX, mypositionY);\r\n");
      out.write("\t      \r\n");
      out.write("\t      var myposition_name = $(inscarr).find(\".t_name\").text();\r\n");
      out.write("\t      \r\n");
      out.write("\t\t\tvar iconImage = \"\";\r\n");
      out.write("\t\t\tvar category = 0;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif($(inscarr).find(\".t_type\").val() == \"1\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ticonImage = \"/triplan/resources/image/tours.png\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if($(inscarr).find(\".t_type\").val() == \"2\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ticonImage = \"/triplan/resources/image/restaurants.png\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if($(inscarr).find(\".t_type\").val() == \"3\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ticonImage = \"/triplan/resources/image/lounges.png\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if($(inscarr).find(\".t_type\").val() == \"4\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\ticonImage = \"/triplan/resources/image/nightlife.png\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t      \r\n");
      out.write("\t        var marker=new google.maps.Marker({\r\n");
      out.write("\t        position:myposition,\r\n");
      out.write("\t        icon:iconImage\r\n");
      out.write("\t        });\r\n");
      out.write("\t      \r\n");
      out.write("\t        marker.setMap(map);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar rating_str = $(inscarr).find(\".t_rating\").val();\r\n");
      out.write("\t\t\tvar rating_star = \"☆☆☆☆☆\";\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tvar rating_num = parseFloat(rating_str);\r\n");
      out.write("\t\t\trating_num = Math.round(rating_num);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif(rating_num == 1)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trating_star = \"★☆☆☆☆\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if(rating_num == 2)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trating_star = \"★★☆☆☆\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if(rating_num == 3)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trating_star = \"★★★☆☆\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if(rating_num == 4)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trating_star = \"★★★★☆\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telse if(rating_num == 5)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\trating_star = \"★★★★★\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\tvar html = myposition_name + \" (\" + rating_star + \") <br/>\";\r\n");
      out.write("\t   \t\thtml += \"<img style='width:100%; height:120px;' src='/triplan/TourInfo/images/\"+$(inscarr).find(\".t_idx\").val()+\"/title.jpg' /><br/>\";\r\n");
      out.write("\t   \t\thtml += \"<p></p>\";\r\n");
      out.write("\t\t    html += \"<a onClick='goDetail(\"+$(inscarr).find(\".t_idx\").val()+\");' style='cursor: pointer;'>상세정보보기</a>\";\r\n");
      out.write("\t        \r\n");
      out.write("\t        \r\n");
      out.write("\t       var infowindow = new google.maps.InfoWindow({\r\n");
      out.write("\t           content:html,\r\n");
      out.write("\t           maxWidth: 200\r\n");
      out.write("\t         });\r\n");
      out.write("\t       \r\n");
      out.write("\t       infowindows.push(infowindow);\r\n");
      out.write("\t\t\tvar temp = infowindowcount;\r\n");
      out.write("\t      \r\n");
      out.write("\t      google.maps.event.addListener(marker, 'click', function() {\r\n");
      out.write("\t    \t    infowindows[openinfowindow].close();\r\n");
      out.write("\t\t\t\tinfowindow.open(map,marker);\r\n");
      out.write("\t\t\t\topeninfowindow = temp; \r\n");
      out.write("\t      });\r\n");
      out.write("\t      \r\n");
      out.write("\t      $(inscarr).click(function(){\r\n");
      out.write("\t    \t  infowindows[openinfowindow].close();\r\n");
      out.write("\t\t\t\tinfowindow.open(map,marker);\r\n");
      out.write("\t\t\t\topeninfowindow = temp; \r\n");
      out.write("\t      })\r\n");
      out.write("\t      \r\n");
      out.write("\t      infowindowcount++;\r\n");
      out.write("   }\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\tfunction jh_read(sc_idx) {\r\n");
      out.write("\t\t\r\n");
      out.write(" \t\t$.ajax({\r\n");
      out.write(" \t\t\t  url: \"/triplan/schedule_Load.tp\",\r\n");
      out.write("\t\t      type: \"POST\",\r\n");
      out.write("\t\t      data: {sc_idx : sc_idx},\r\n");
      out.write("\t\t      dataType : \"html\",\r\n");
      out.write("\t\t      success: function(data){\r\n");
      out.write("  \t\t\t\t\t$(\"#jh_table\").html(data);\r\n");
      out.write("\t\t\t\t\t tdcount = parseInt($(\"#collen\").val());\r\n");
      out.write("\t\t\t\t\t if(tdcount > 4)\r\n");
      out.write("\t\t\t\t     {\r\n");
      out.write("\t\t\t\t\t \tlr_btn_loca();\r\n");
      out.write("\t\t\t\t     }\r\n");
      out.write("\t\t\t\t\t sc_init();\r\n");
      out.write("\t\t      }\r\n");
      out.write("\t\t      \r\n");
      out.write("\t\t  }); \r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tfunction jh_left() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(viewnum > 1){\r\n");
      out.write("\t\t\t$(\".jh_sc_\"+(viewnum-1)).addClass(\"view\");\r\n");
      out.write("\t\t\t$(\".jh_sc_\"+(viewnum+2)).removeClass(\"view\");\r\n");
      out.write("\t\t\tviewnum = viewnum - 1;\r\n");
      out.write("\t\t\tlr_btn_loca()\r\n");
      out.write("\t\t\tif(viewnum < tdcount-3)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\t$(\".jh_btn_right\").html(\"&nbsp;>&nbsp;&nbsp;\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse {\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\talert(\"처음 날짜입니다.\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t} \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction jh_right() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif(viewnum < tdcount-3)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\t$(\".jh_sc_\"+(viewnum+3)).addClass(\"view\");\r\n");
      out.write("\t\t\t$(\".jh_sc_\"+(viewnum)).removeClass(\"view\");\r\n");
      out.write("\t\t\tviewnum = viewnum + 1;\r\n");
      out.write("\t\t\tlr_btn_loca()\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\telse \r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\talert(\"마지막 날짜입니다.\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction lr_btn_loca()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$(\".jh_btn_left\").remove();\r\n");
      out.write("\t\t$(\".jh_btn_right\").remove();\r\n");
      out.write("\t\t$(\"#jh_table>thead>tr>td\").css(\"text-align\",\"center\");\r\n");
      out.write("\t\tvar theadleft = $(\"#jh_table\").find(\"thead\").find(\".jh_sc_\"+viewnum);\r\n");
      out.write("\t\tvar theadright = $(\"#jh_table\").find(\"thead\").find(\".jh_sc_\"+(viewnum+2));\r\n");
      out.write("\t\t$(theadleft).css(\"text-align\",\"left\");\r\n");
      out.write("\t\t$(theadright).css(\"text-align\",\"right\");\r\n");
      out.write("\t\t$(theadleft).html(\"<span class='jh_btn_left' onclick='jh_left()' style=' margin-right:12%;'>&nbsp;&nbsp;<&nbsp;</span>\"+$(theadleft).html());\r\n");
      out.write("\t\t$(theadright).html($(theadright).html()+\"<span class='jh_btn_right' onclick='jh_right()' style='margin-left:12%;'>&nbsp;>&nbsp;&nbsp;</span\");\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tfunction edit_sc(sc_idx){\r\n");
      out.write("\t\tlocation.href = \"edit_schedule.tp?sc_idx=\"+sc_idx;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction sc_init()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar inscarr = document.getElementsByClassName(\"insc\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\tif(inscarr[0] != null)\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\t$(inscarr[0]).parent().css(\"padding\",\"2px\");\r\n");
      out.write("\t\t\t\ttouridxarr[0] = $(inscarr[0]).find(\".t_idx\").val();\r\n");
      out.write("\t\t\t\tgoogle.maps.event.addDomListener(window, 'load', initialize(inscarr[0]));\r\n");
      out.write("\t\t\t\tfor(var i = 1; i < inscarr.length; i++)\r\n");
      out.write("\t\t\t\t{\r\n");
      out.write("\t\t\t\t\t$(inscarr[i]).parent().css(\"padding\",\"2px\");\r\n");
      out.write("\t\t\t\t\ttouridxarr[i] = $(inscarr[i]).find(\".t_idx\").val();\r\n");
      out.write("\t\t\t\t\tgoogle.maps.event.addDomListener(window, 'load', addMap(inscarr[i]));\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tgetTour(\"0\");\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tgoogle.maps.event.addDomListener(window, 'load', noinsc_map);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction getTour(t_type)\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\t  url: \"/triplan/getReadScheduleTour.tp\",\r\n");
      out.write("\t\t      type: \"POST\",\r\n");
      out.write("\t\t      data: {t_idx : JSON.stringify(touridxarr),\r\n");
      out.write("\t\t    \t     t_type : t_type\r\n");
      out.write("\t\t    \t     },\r\n");
      out.write("\t\t      dataType : \"html\",\r\n");
      out.write("\t\t      success: function(data){\r\n");
      out.write("\t\t\t\t\t$(\"#display_tlist\").html(data);\r\n");
      out.write("\t\t\t\t\t$(\".copy\").click(function(){\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\tvar t_idx = $(this).find(\".t_idx\").val();\r\n");
      out.write("\t\t\t\t\t\tgoDetail(t_idx); \r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t})\r\n");
      out.write("\t\t      }\r\n");
      out.write("\t\t      \r\n");
      out.write("\t\t  }); \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction goDetail(t_idx)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar url = \"detailTourInfo.tp?t_idx=\"+t_idx;\r\n");
      out.write("\t\twindow.open(url, \"detailTourInfo\",\r\n");
      out.write("\t\t\t\t\"width=665px, height=750px, top=70px, left=300px, resizable=no, status=no, scrollbars=yes, menubar=no\"\r\n");
      out.write("\t\t);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<div id=\"screen\">\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../top.jsp", out, false);
      out.write("\r\n");
      out.write("\t<div id=\"totalscreen\">\r\n");
      out.write("\t    <div id=\"leftscreen\">\r\n");
      out.write("      \t\t<div id=\"googleMap\"></div>\r\n");
      out.write("\t      \t<div id=\"list\">\r\n");
      out.write("\t\t      \t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t      \t<ul class=\"nav nav-tabs\">\r\n");
      out.write("\t\t\t\t  \t<li class=\"active\"><a data-toggle=\"tab\" onclick=\"getTour('0');\">전체</a></li>\r\n");
      out.write("\t\t\t\t  \t<li><a data-toggle=\"tab\" onclick=\"getTour('1');\">관광</a></li>\r\n");
      out.write("\t\t\t\t  \t<li><a data-toggle=\"tab\" onclick=\"getTour('2');\">음식</a></li>\r\n");
      out.write("\t\t\t\t  \t<li><a data-toggle=\"tab\" onclick=\"getTour('3');\">숙박</a></li>\r\n");
      out.write("\t\t\t\t  \t<li><a data-toggle=\"tab\" onclick=\"getTour('4');\">기타</a></li>\r\n");
      out.write("\t\t\t  \t</ul>\r\n");
      out.write("\t\t\t  \t<div id=\"display_tlist\"></div>\r\n");
      out.write("   \t \t\t</div>\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t\r\n");
      out.write("\t    <div id=\"rightscreen\">\r\n");
      out.write("\t\t\t<div id=\"timeTable\">\r\n");
      out.write("\t\t\t  <table id=\"jh_table\" class=\"table table-bordered\" style=\"color: #000000;\">\r\n");
      out.write("\t\t\t  </table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../foot.jsp", out, false);
      out.write("\r\n");
      out.write("</div>");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/views/schedule/viewSchedule.jsp(475,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ck_sc == 1}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t      \t\t\t<button onclick=\"edit_sc(");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sc_idx}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
        out.write(")\" class=\"btn btn-default\"  style=\"width:100%;  margin-bottom:2%\">수정하기</button>\r\n");
        out.write("\t\t      \t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }
}