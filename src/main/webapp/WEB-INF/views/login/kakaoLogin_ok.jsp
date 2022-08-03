<%@page import="com.exam.login.SignUpTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	SignUpTO sto =(SignUpTO)request.getAttribute("sto"); 
	
	out.println( "<script type='text/javascript'>" );
	//기존회원
	if( flag == 0 ) {
		//여기서 세션 부여(카카오로그인)
		
		
		
		out.println( "location.href='home.do';" );
	} else {
	//신규 회원
		out.println( "document.signupdata.submit();" );
	}
	out.println( "</script>" );
%>

<form action="./kakaosignup.do" method="post" name="signupdata">
<input type="hidden" name="name" value=<%=sto.getName()%>/>
<input type="hidden" name="email" value=<%=sto.getEmail()%>/>
<input type="hidden" name="kid" value=<%=sto.getKid()%>/>

</form>