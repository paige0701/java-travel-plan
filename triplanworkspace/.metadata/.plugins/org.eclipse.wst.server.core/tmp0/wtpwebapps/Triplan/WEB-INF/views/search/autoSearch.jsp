<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    List<String> resultList = (List<String>)request.getAttribute("resultList");

//	System.out.println("확인용 resultList 의 size : " + resultList.size());

	if(resultList != null || resultList.size() != 0 ) { 
		out.print(resultList.size());
		out.print("|");
		
		for(int i=0; i<resultList.size(); i++) {
			String title = resultList.get(i);
			out.print(title);
			
			String comma = (i != (resultList.size()-1) )?",":"";
			out.print(comma);
		}
		// 만약에 검색어가 "자바" 이라면 
		// 결과물이 다음과 같이 나올 것이다.
		// 4|자바 프로그래밍,자바공부,자바프로그래머 김태균,자바
	}
	else{
		out.print("0|");
	}
%>





