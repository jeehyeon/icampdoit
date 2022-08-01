<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '회원가입 성공' );" );
		out.println( "location.href='login.do';" );
	} else {
		out.println( "alert( '회원가입 실패 : 다시 시도해 주세요.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>