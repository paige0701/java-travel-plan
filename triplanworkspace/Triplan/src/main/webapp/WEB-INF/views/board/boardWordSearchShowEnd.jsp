<%-- #143. Ajax(검색어 입력시 검색단어 자동완성하기)관련
       주의!! 여기서 주석문을 <!-- --> 으로 하면 안된다.!!!
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
     
<%
    List<String> resultList = (List<String>)request.getAttribute("resultList");
	
	if(resultList != null || resultList.size() != 0) {
		out.print(resultList.size());
		
		// *** 확인용 ***
		System.out.print(resultList.size());
		
		 // 웹서버에 저장 되어있는 문자열 중 검색한 단어로 시작하는
		 // 문자열이 몇개 있는지 갯수를 웹브라우저에 출력함.
		out.print("|");
		 
		// *** 확인용 ***
		System.out.print("|");
		
		for(int i=0; i<resultList.size(); i++) {
			
			String resultWord = resultList.get(i);
			out.print(resultWord);
			
		// *** 확인용 ***
			System.out.print(resultWord);
			
			String comma = (i != resultList.size()-1 )?",":"";
			out.print(comma); // 검색한 단어로 시작하는 문자열들을 콤마(CSV)양식으로 웹브라우저에 출력함.
			
		// *** 확인용 ***
			System.out.print(comma);
			
		}// end of for----------------------------------
	}

%>