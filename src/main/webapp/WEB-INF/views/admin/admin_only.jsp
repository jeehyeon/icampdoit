<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.println( "<script type='text/javascript'>" );
	out.println( "alert( '관리자만 접속할 수 있습니다.' );" );
	out.println( "history.back();" );
	out.println( "</script>" );
%>