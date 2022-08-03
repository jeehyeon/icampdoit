<%@page import="com.exam.login.SignUpTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag = (Integer)request.getAttribute("flag");
	SignUpTO sto =(SignUpTO)request.getAttribute("sto"); 

%>




<!DOCTYPE html>
  <head>
    <meta charset="utf-8"/>
  </head>
 	<body>
    <form action="./kakaosignup.do" method="post" name="signupdata">
		<input type="hidden" name="name" value="<%=sto.getName()%>"/>
		<input type="hidden" name="email" value="<%=sto.getEmail()%>"/>
		<input type="hidden" name="kid" value="<%=sto.getKid()%>"/>		
	</form>
	
   <script type='text/javascript'>
    const flag = <%=flag%>;
    if(flag == 0){
    	location.href='home.do';
    }else{
    	document.signupdata.submit()
    };
    
    </script>
   
  </body>
</html>