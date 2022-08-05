<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int flag = (Integer)request.getAttribute("flag");

	out.println("<script type='text/javascript'>");
	if( flag == 0 ) {
		out.println("alert('글쓰기 성공');");
		out.println("location.href='./mboardlist.do';");
	} else {
		out.println("alert('글쓰기 실패');");
		out.println("history.back();");
	}
	out.println("</script>");
	

%>