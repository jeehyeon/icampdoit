<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	out.println( "<script type='text/javascript'>" );
	if( flag != 1 ) {
		//세션 등록
		out.println( "alert( '찜취소 성공' );" );
		out.println( "location.href='/mypagesub.do';" );
	} else {
		out.println( "alert( '찜취소 실패' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>