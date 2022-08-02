<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int flag = (Integer)request.getAttribute("flag");
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '비밀번호 변경 성공.' );" );
		out.println( "location.href='login.do';" );
	}else if(flag ==2){
		out.println( "alert( '실패 : 최근에 변경한 비밀번호와 같습니다.' );" );
		out.println( "history.back();" );
	}else {
		out.println( "alert( '비밀번호 변경 실패.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>